import Text.Show.Functions -- Para mostrar <Function> en consola cada vez que devuelven una

--	Punto 1	--
-- 1)import Text.Show.Functions -- Para mostrar <Function> en consola cada vez que devuelven una
import Data.List -- Para métodos de colecciones que no vienen por defecto (ver guía de lenguajes)
import Data.Maybe -- Por si llegan a usar un método de colección que devuelva “Just suElemento” o “Nothing”.

--	INCISO 1	--

type Velocidad = Float
type Nafta = Float
type Truco = Auto -> Auto
type Criterio = Auto -> Float
type Metros = Float
type Kilometros = Float
type Trampa = Carrera -> Carrera

data Auto = Auto {
    nombre :: String,
    nivelDeNafta :: Nafta,
    velocidad :: Velocidad,
    nombreDeEnamorado :: String,
  trucoParticular :: Truco
} deriving Show

--3.1)

data Carrera = Carrera {
    vueltas :: Int,
    longitudPista :: Kilometros,
    participantes :: [Auto],
    nombresPublico :: [String],
    trampa :: Trampa
} deriving Show

--2)
--deReversa :: Velocidad -> Truco
--deReversa = aumentarNafta.(*0.2) en realidad solo cambiaria el tipo

--potreroFunes = Carrera 3 5 [rochaMcQueen,biankerr,gushtav,rodra] ["Ronco", "Tinch", "Dodain"] sacarAlPistero

--3.2)

cambiarParticipantesSegun :: (Carrera -> [Auto]) -> Carrera -> Carrera
cambiarParticipantesSegun criterio unaCarrera = cambiarParticipantes unaCarrera (criterio unaCarrera)

--Para afectar a los participantes conviene pasarle la carrera y obtener los participantes o directamente pasarle los participantes??
afectarParticipantes :: (Auto -> Auto) -> Carrera -> [Auto]
afectarParticipantes criterio unaCarrera = map criterio (participantes unaCarrera)

--seleccionarParticipantes :: (Auto -> Bool) ->  [Auto] -> [Auto]
--seleccionarParticipantes criterio unaCarrera = filter criterio (participantes una Carrera)

sacarAlPistero :: Trampa
sacarAlPistero = cambiarParticipantesSegun (tail.participantes)

lluvia :: Trampa
lluvia = cambiarParticipantesSegun participantesDuranteLluvia

neutralizarTrucos :: Trampa
neutralizarTrucos  = cambiarParticipantesSegun participantesNeutralizados

pocaReserva :: Trampa
pocaReserva  = cambiarParticipantesSegun sacarParticipantesConPocaReserva

podio :: Trampa
podio  = cambiarParticipantesSegun participantesPodio

--Funciones Auxiliares para trampas

participantesDuranteLluvia :: Carrera -> [Auto]
participantesDuranteLluvia  = afectarParticipantes (disminuirVelocidad 10)

participantesNeutralizados :: Carrera -> [Auto]
participantesNeutralizados = afectarParticipantes (cambiaDeTruco inutilidad)

sacarParticipantesConPocaReserva :: Carrera -> [Auto]
sacarParticipantesConPocaReserva unaCarrera  = filter (not.tienePocaReserva) (participantes unaCarrera)

participantesPodio :: Carrera -> [Auto]
participantesPodio  = (take 3 . participantes)

tienePocaReserva :: Auto -> Bool
tienePocaReserva  =  (esNaftaMenorA 30)

--3.3)

sufrirTrampa :: Carrera -> Carrera
sufrirTrampa unaCarrera = (trampa unaCarrera) unaCarrera


realizanTruco :: Carrera -> Carrera
realizanTruco = cambiarParticipantesSegun participantesLuegoDeHacerTruco
participantesLuegoDeHacerTruco ::  Carrera ->  [Auto]
participantesLuegoDeHacerTruco  = afectarParticipantes realizarTruco
realizarTruco :: Auto -> Auto
realizarTruco unAuto = (trucoParticular unAuto) unAuto

-- maniobraEnamorado = creo que habria que hacer guardas para aplicar por auto,
-- porque si filtro la lista a los que puedan debolveria una lista diferente a la original

--losVenSusEnamorades unaCarrera = seleccionarParticipantes (enamoradeEstaEnElPublico unaCarrera)
--enamoradeEstaEnElPublico unaCarrera unAuto = any ((==).nombreDeEnamorado unAuto) (publico unaCarrera)
--puedenRealizarUnTruco = seleccionarParticipantes puedeRealizarUnTruco

--participantesLuegoDeUnaVuelta unaCarrera = afectarParticipantes (sufrirTrampa.maniobraEnamorado.combustibleLuegoDeVuelta unaCarrera)
--combustibleLuegoDeVuelta unaCarrera =  (gastarNafta.calcularCombustibleVuelta unaCarrera)
--calcularCombustibleVuelta unaCarrera unAuto = div (longitudPista unaPista) ((*10).velocidad)


--darVuelta :: Carrera -> Carrera
--darVuelta unaCarrera = cambiarParticipantesSegun participantesLuegoDeUnaVuelta

cambiarParticipantes :: Carrera ->  [Auto] -> Carrera
cambiarParticipantes unaCarrera unosParticipantes = unaCarrera {participantes = unosParticipantes}

inutilidad :: Auto -> Auto
inutilidad = id

cambiaDeTruco :: Truco -> Auto -> Auto
cambiaDeTruco unTruco unAuto = unAuto {trucoParticular = unTruco}

deReversa :: Metros -> Truco
deReversa = aumentarNafta.(*0.2)

aumentarNafta :: Nafta -> Auto -> Auto
aumentarNafta cantidadNafta unAuto = unAuto {nivelDeNafta = nivelDeNafta unAuto + cantidadNafta}
gastarNafta :: Nafta -> Auto -> Auto
gastarNafta cantidadNafta unAuto = unAuto {nivelDeNafta = nivelDeNafta unAuto - cantidadNafta}

impresionar :: Truco
impresionar  = incrementarVelocidadSegun velocidad

incrementarVelocidadSegun :: Criterio -> Auto -> Auto
incrementarVelocidadSegun criterio auto = aumentarVelocidad (criterio auto) auto

incrementarVelocidadPorEnamorade :: Truco
incrementarVelocidadPorEnamorade = incrementarVelocidadSegun (velocidadDeTurbo.cantDeVocales.nombreDeEnamorado)

aumentarVelocidad :: Velocidad -> Auto -> Auto
aumentarVelocidad unaVelocidadAdicional unAuto = unAuto {velocidad = velocidad unAuto + unaVelocidadAdicional}
disminuirVelocidad :: Velocidad -> Auto -> Auto
disminuirVelocidad unaVelocidadAdicional unAuto = unAuto {velocidad = velocidad unAuto - unaVelocidadAdicional}

nitro :: Truco
nitro = aumentarVelocidad 15

fingirAmor :: String -> Truco
fingirAmor nombreEnamorade = elijeOtreEnamorade nombreEnamorade

elijeOtreEnamorade :: String -> Auto -> Auto
elijeOtreEnamorade nombreEnamorade unAuto = unAuto {nombreDeEnamorado = nombreEnamorade}

--3)
rochaMcQueen = Auto "Rocha McQueen" 300 0 "Ronco" (deReversa 1000)
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

esNaftaMenorA :: Nafta ->  Auto -> Bool
esNaftaMenorA unaNafta = (<unaNafta).nivelDeNafta

velocidadEsMenorACien :: Auto -> Bool
velocidadEsMenorACien = (<100).velocidad

puedeRealizarUnTruco :: Auto -> Bool
puedeRealizarUnTruco auto = (tieneNafta auto) && (velocidadEsMenorACien auto)

-- Punto 4 --

comboLoco :: Truco
comboLoco =  deReversa 1000.nitro

queTrucazo :: String -> Truco
queTrucazo enamorado = incrementarVelocidadPorEnamorade.elijeOtreEnamorade enamorado

turbo :: Truco
turbo = (vaciarTanqueDeNafta.(incrementarVelocidadSegun ((*10).nivelDeNafta)))

vaciarTanqueDeNafta :: Auto -> Auto
vaciarTanqueDeNafta unAuto = unAuto {nivelDeNafta = 0.0}
