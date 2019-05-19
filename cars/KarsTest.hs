import Kars
import Test.Hspec

main :: IO ()
main = hspec $ do
	describe "Casos de prueba Kars" $ do
		describe "Punto 3.0" $ do
			it "La nafta del rochaMcQueen luego de hacer su truco favorito es 300" $ do
				nivelDeNafta rochaMcQueen `shouldBe` 300

			it "La nafta de rodra tras deReversa es 10" $ do
				deReversa rodra `shouldBe` 10

		describe "Punto 3.2" $ do
			it "La cantidad de participantes en potreroFunes luego de sacarAlPistero es 3" $ do
				length (participantes potreroFunes) `shouldBe` 3

			it "rochaMcQueen ya no participa en potreroFunes tras sacarAlPistero" $ do
				sacarAlPistero `shouldBe` True

			it "La cantidad de participantes en potreroFunes luego de pocaReserva es 3" $ do

			it "El participante llamado “rodra” ya no debería estar entre los participantes de potreroFunes luego de aplicar pocaReserva" $ do
				
			it "La cantidad de participantes luego de aplicar podio en potreroFunes es 3" $ do
				 
			it "La velocidad del último participante de potreroFunes (rodra) luego de la lluvia es 40" $ do
				

		describe "Punto 3.3" $ do
			it "El nivel de nafta del primer participante (biankerr porque rochaMcQueen quedó afuera) luego de dar una vuelta en potreroFunes es 490" $ do
				
			it "La velocidad del primer participante (biankerr porque rochaMcQueen quedó afuera) luego de dar una vuelta en potreroFunes es 40" $ do	

			it "la cantidad de participantes tras dar dos vueltas en potrero funes es 2" $ do

			it "Luego de dos vueltas, el nivelDeNafta del primer participante (gushtav) es 70" $ do

			it "Rodra debe ser el único participante luego de correr la carrera de potreroFunes" $ do

		describe "Punto 3.4" $ do
			it "El ganador de potreroFunes es rodra" $ do

		describe "Punto 3.5" $ do
			it "La velocidad de rodra tras realizar elGranTruco con nitro, deReversa e impresionar es 140" $ do

			it "El nivelDeNafta de rodra tras realizar elGranTruco con nitro, deReversa e impresionar es 13" $ do


