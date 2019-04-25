
{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions -- Para mostrar <Function> en consola cada vez que devuelven una
import Data.List -- Para métodos de colecciones que no vienen por defecto (ver guía de lenguajes)
import Data.Maybe -- Por si llegan a usar un método de colección que devuelva “Just suElemento” o “Nothing”.

--	INCISO 1	--

type Velocidad = Int
type Nafta = Float
type Truco = Auto -> Auto
type Criterio = Auto -> Int
type Metros = Float

data Auto = Auto {
	nombre :: String,
	nivelDeNafta :: Nafta,
	velocidad :: Velocidad,
	nombreDeEnamorado :: String,
  trucoParticular :: Truco
} deriving Show

rochaMcQueen = Auto "Rocha McQueen" 300 0 "Ronco" (deReversa 1000)
biankerr = Auto "Biankerr" 500 20 "Tinch" impresionar
gushtav = Auto "Gushtav" 200 130 "PetiLaLinda" nitro
rodra  = Auto "Rodra" 0 50 "Taisa" (fingirAmor "Petra")

deReversa :: Metros -> Truco
deReversa metrosPista = nuevaNafta (metrosPista * 0.2)

impresionar :: Truco
impresionar  = incrementarVelocidadSegun velocidad

nitro :: Truco
nitro = nuevaVelocidad 15

fingirAmor :: String -> Truco
fingirAmor nombreEnamorade = elijeOtreEnamorade nombreEnamorade

--	 INCISO 2	--
nuevaVelocidad :: Velocidad -> Auto -> Auto
nuevaVelocidad unaVelocidadAdicional unAuto = unAuto {velocidad = velocidad unAuto + unaVelocidadAdicional}

nuevaNafta :: Nafta -> Auto -> Auto
nuevaNafta cantidadNafta unAuto = unAuto {nivelDeNafta = nivelDeNafta unAuto + cantidadNafta}

elijeOtreEnamorade :: String -> Auto -> Auto
elijeOtreEnamorade nombreEnamorade unAuto = unAuto {nombreDeEnamorado = nombreEnamorade}

esVocal :: Char -> Bool
esVocal = flip elem "aeiou"

cantDeVocales :: String -> Int
cantDeVocales = (length.(filter (esVocal)))

velocidadDeTurbo :: Int -> Velocidad
velocidadDeTurbo nDeVocales
	|	(nDeVocales>=1) && (nDeVocales<=2) = 15
	|	(nDeVocales>=3) && (nDeVocales<=4) = 20
	|	nDeVocales > 4 = 30
	| otherwise = 0

incrementarVelocidadSegun :: Criterio -> Auto -> Auto
incrementarVelocidadSegun criterio auto = nuevaVelocidad (criterio auto) auto

incrementarVelocidadPorEnamode = incrementarVelocidadSegun (velocidadDeTurbo.cantDeVocales.nombreDeEnamorado)
