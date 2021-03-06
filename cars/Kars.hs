module Kars where

import Text.Show.Functions -- Para mostrar <Function> en consola cada vez que devuelven una
import Data.List -- Para métodos de colecciones que no vienen por defecto (ver guía de lenguajes)
import Data.Maybe -- Por si llegan a usar un método de colección que devuelva “Just suElemento” o “Nothing”.

type Velocidad = Float
type Nafta = Float
type Truco = Auto -> Auto
type CriterioAuto = Auto -> Float
type CriterioCarrera = [Auto] -> [Auto]
type Metros = Float
type Kilometros = Float
type Trampa = Carrera -> Carrera

data Auto = Auto {
    nombre :: String,
    nivelDeNafta :: Nafta,
    velocidad :: Velocidad,
    nombreDeEnamorado :: String,
    trucoParticular :: Truco
} deriving (Show)

--3.0)
deReversa :: Truco
deReversa = cambiarNaftaSegun ((*0.2).velocidad) 

--3.1)

data Carrera = Carrera {
    vueltas :: Int,
    longitudPista :: Kilometros,
    participantes :: [Auto],
    nombresPublico :: [String],
    trampa :: Trampa
} deriving (Show)

potreroFunes = Carrera 3 5 [rochaMcQueen,biankerr,gushtav,rodra] ["Ronco", "Tinch", "Dodain"] sacarAlPistero

--3.2)

sacarAlPistero :: Trampa
sacarAlPistero = cambiarParticipantesSegun tail

cambiarParticipantesSegun :: CriterioCarrera -> Carrera -> Carrera
cambiarParticipantesSegun criterio unaCarrera = cambiarParticipantes unaCarrera ((criterio.participantes) unaCarrera)

cambiarParticipantes :: Carrera -> [Auto] -> Carrera
cambiarParticipantes unaCarrera unosParticipantes = unaCarrera {participantes = unosParticipantes}

lluvia :: Trampa
lluvia = cambiarParticipantesSegun (map (cambiarVelocidad (-10)))

cambiarVelocidad :: Velocidad -> Auto -> Auto
cambiarVelocidad unaVelocidadAdicional unAuto = unAuto {velocidad = velocidad unAuto + unaVelocidadAdicional}

neutralizarTrucos :: Trampa
neutralizarTrucos  =  cambiarParticipantesSegun (map (cambiaDeTruco inutilidad))

cambiaDeTruco :: Truco -> Auto -> Auto
cambiaDeTruco unTruco unAuto = unAuto {trucoParticular = unTruco}

inutilidad :: Auto -> Auto
inutilidad = id

pocaReserva :: Trampa
pocaReserva  = cambiarParticipantesSegun (filter (not.tienePocaReserva))

tienePocaReserva :: Auto -> Bool
tienePocaReserva  =  ((<30).nivelDeNafta)

podio :: Trampa
podio  = cambiarParticipantesSegun (take 3)

--3.3)

participantesSufrirTrampa :: Carrera -> Carrera
participantesSufrirTrampa unaCarrera = (trampa unaCarrera) unaCarrera

participantesEnamoradesLuegoDeHacerTruco ::  Carrera ->  Carrera
participantesEnamoradesLuegoDeHacerTruco unaCarrera  = cambiarParticipantesSegun (map (loVenSusEnamorades unaCarrera)) unaCarrera

participantesGastarCombustibleVuelta :: Carrera -> Carrera
participantesGastarCombustibleVuelta unaCarrera = cambiarParticipantesSegun (map (cambiarNaftaSegun (calcularCombustibleVuelta unaCarrera))) unaCarrera

darVuelta ::  Carrera -> Carrera
darVuelta = (participantesSufrirTrampa.participantesEnamoradesLuegoDeHacerTruco.participantesGastarCombustibleVuelta)

correrCarrera :: Carrera -> Carrera
correrCarrera unaCarrera = (iterate darVuelta unaCarrera)!!(vueltas unaCarrera)

--Funciones Auxiliares 3.3

loVenSusEnamorades ::  Carrera -> Auto -> Auto
loVenSusEnamorades unaCarrera unAuto
      |  puedeRealizarManiobraEnamorado unaCarrera unAuto = realizarTruco unAuto
      |  otherwise = unAuto

enamoradeEstaEnElPublico ::  Carrera -> Auto -> Bool
enamoradeEstaEnElPublico unaCarrera unAuto = any ( coincidenNombres (nombreDeEnamorado unAuto)) (nombresPublico unaCarrera)

puedeRealizarManiobraEnamorado ::  Carrera -> Auto -> Bool
puedeRealizarManiobraEnamorado unaCarrera unAuto = (enamoradeEstaEnElPublico unaCarrera unAuto) && (puedeRealizarUnTruco unAuto)

--3.4)

quienGana :: Carrera -> Auto
quienGana = (foldl1 elMasRapido).participantes.correrCarrera

elMasRapido :: Auto -> Auto -> Auto
elMasRapido auto1 auto2
    | (velocidad auto1) > (velocidad auto2) = auto1
    | otherwise = auto2

--3.5)

elGranTruco :: Auto -> [Truco] -> Auto
elGranTruco unAuto = foldl (flip ($)) unAuto

--3.6)

--	Nota: no se puede correr una carrera de infinitos participantes
--		porque a la hora de llamar a afectarParticipantes el map nunca terminaria de correr

primerParticipanteDsp2Vueltas :: Carrera -> Auto
primerParticipanteDsp2Vueltas = head . participantes . darVuelta . darVuelta

--	Nota: no se puede saber el estado de la carrera despues de una vuelta
--		porque no se puede calcular el estado de los infinitos participantes

-- Comienzo de entrega 1

coincidenNombres ::  String -> String -> Bool
coincidenNombres unNombre  =  (==) unNombre

realizarTruco :: Auto -> Auto
realizarTruco unAuto = (trucoParticular unAuto) unAuto

cambiarNaftaSegun :: (Auto -> Nafta) -> Auto -> Auto
cambiarNaftaSegun criterio unAuto = cambiarNafta (criterio unAuto) unAuto

cambiarNafta :: Nafta -> Auto -> Auto
cambiarNafta cantidadNafta unAuto = unAuto {nivelDeNafta = nivelDeNafta unAuto + cantidadNafta}

calcularCombustibleVuelta :: Carrera -> Auto -> Nafta
calcularCombustibleVuelta unaCarrera unAuto = - (velocidad unAuto / 10 * longitudPista unaCarrera)

impresionar :: Truco
impresionar  = incrementarVelocidadSegun velocidad

incrementarVelocidadSegun :: CriterioAuto -> Auto -> Auto
incrementarVelocidadSegun criterio auto = cambiarVelocidad (criterio auto) auto

incrementarVelocidadPorEnamorade :: Truco
incrementarVelocidadPorEnamorade = incrementarVelocidadSegun (velocidadDeTurbo.cantDeVocales.nombreDeEnamorado)

nitro :: Truco
nitro = cambiarVelocidad  15

fingirAmor :: String -> Truco
fingirAmor nombreEnamorade = elijeOtreEnamorade nombreEnamorade

elijeOtreEnamorade :: String -> Auto -> Auto
elijeOtreEnamorade nombreEnamorade unAuto = unAuto {nombreDeEnamorado = nombreEnamorade}

--3)
rochaMcQueen = Auto "Rocha McQueen" 300 0 "Ronco" (deReversa)
biankerr = Auto "Biankerr" 500 20 "Tinch" impresionar
gushtav = Auto "Gushtav" 200 130 "PetiLaLinda" nitro
rodra  = Auto "Rodra" 0 50 "Taisa" (fingirAmor "Petra")


--	 Punto 2	--
esVocal :: Char -> Bool
esVocal = flip elem "aeiou"

cantDeVocales :: String -> Int
cantDeVocales = length.filter esVocal

velocidadDeTurbo :: Int -> Velocidad
velocidadDeTurbo nDeVocales
    |    nDeVocales >  4 = 30
    |    nDeVocales >= 3 = 20
    |    nDeVocales >= 1 = 15
    |    otherwise = 0

-- Punto 3 --
tieneNafta :: Auto -> Bool
tieneNafta = (>0).nivelDeNafta

velocidadEsMenorACien :: Auto -> Bool
velocidadEsMenorACien = (<100).velocidad

puedeRealizarUnTruco :: Auto -> Bool
puedeRealizarUnTruco auto = (tieneNafta auto) && (velocidadEsMenorACien auto)

-- Punto 4 --

comboLoco :: Truco
comboLoco =  deReversa.nitro

queTrucazo :: String -> Truco
queTrucazo enamorado = incrementarVelocidadPorEnamorade.elijeOtreEnamorade enamorado

turbo :: Truco
turbo = (vaciarTanqueDeNafta.(incrementarVelocidadSegun ((*10).nivelDeNafta)))

vaciarTanqueDeNafta :: Auto -> Auto
vaciarTanqueDeNafta unAuto = unAuto {nivelDeNafta = 0.0}
