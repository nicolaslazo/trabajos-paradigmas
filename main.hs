--	INCISO 1	--
data Auto = Auto {
	nombre :: String,
	nivelDeNafta :: Int,
	velocidad :: Int,
	nombreDeEnamorado :: String,
	trucoParticular :: 
} deriving Show

--	 INCISO 2	--

esVocal :: Char -> Bool
esVocal letra = elem letra "aeiou"

cantDeVocales :: String -> Int
cantDeVocales = (length.(filter (esVocal)))

velocidadDeTurbo :: Int -> Int
velocidadDeTurbo nDeVocales
	|	(nDeVocales>=1) && (nDeVocales<=2) = 15
	|	(nDeVocales>=3) && (nDeVocales<=4) = 20
	|	nDeVocales > 4 = 40

incrementarVelocidad :: Auto -> Auto
incrementarVelocidad auto = {	nombre,
				nivelDeNafta,
				velocidad + ((velocidadDeTurbo.cantDeVocales) nombreDeEnamorado),
				trucoParticular
}
