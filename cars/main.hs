import Text.Show.Functions -- Para mostrar <Function> en consola cada vez que devuelven una
import Data.List -- Para métodos de colecciones que no vienen por defecto (ver guía de lenguajes)
import Data.Maybe -- Por si llegan a usar un método de colección que devuelva “Just suElemento” o “Nothing”.

--	Punto 1	--
-- 1)
type Velocidad = Float
type Nafta = Float
type Truco = Auto -> Auto
type Criterio = Auto -> Float
type Metros = Float

data Auto = Auto {
    nombre :: String,
    nivelDeNafta :: Nafta,
    velocidad :: Velocidad,
    nombreDeEnamorado :: String,
    trucoParticular :: Truco
} deriving Show

--2)
deReversa :: Metros -> Truco
deReversa = aumentarNafta.(*0.2)

aumentarNafta :: Nafta -> Auto -> Auto
aumentarNafta cantidadNafta unAuto = unAuto {nivelDeNafta = nivelDeNafta unAuto + cantidadNafta}

impresionar :: Truco
impresionar  = incrementarVelocidadSegun velocidad

incrementarVelocidadSegun :: Criterio -> Auto -> Auto
incrementarVelocidadSegun criterio auto = aumentarVelocidad (criterio auto) auto

incrementarVelocidadPorEnamorade :: Truco
incrementarVelocidadPorEnamorade = incrementarVelocidadSegun (velocidadDeTurbo.cantDeVocales.nombreDeEnamorado)

aumentarVelocidad :: Velocidad -> Auto -> Auto
aumentarVelocidad unaVelocidadAdicional unAuto = unAuto {velocidad = velocidad unAuto + unaVelocidadAdicional}

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
cantDeVocales = (length.(filter (esVocal)))

velocidadDeTurbo :: Int -> Velocidad
velocidadDeTurbo nDeVocales
    |    (nDeVocales>=1) && (nDeVocales<=2) = 15
    |    (nDeVocales>=3) && (nDeVocales<=4) = 20
    |    nDeVocales > 4 = 30
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
comboLoco =  (deReversa 1000).nitro

queTrucazo :: String -> Truco
queTrucazo enamorado = incrementarVelocidadPorEnamorade.(elijeOtreEnamorade enamorado)

turbo :: Truco
turbo = (vaciarTanqueDeNafta.(incrementarVelocidadSegun ((*10).nivelDeNafta)))

vaciarTanqueDeNafta :: Auto -> Auto
vaciarTanqueDeNafta unAuto = unAuto {nivelDeNafta = 0.0}
