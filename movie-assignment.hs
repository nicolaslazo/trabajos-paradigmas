-- Estructuras de datos propias
type Peli = (String, [Int])
type Maraton = [Peli]

titulo :: Peli -> String
titulo (nombre, _) = nombre

califs :: Peli -> [Int]
califs (_, puntajes) = puntajes


-- Funciones auxiliares
promedio :: [Int] -> Int
promedio numeros = sum numeros / length numeros

aumentarPuntaje :: Int -> Int
aumentarPuntaje 1 = 1
aumentarPuntaje num = min 10 num+2

unaPeliYPuntaje :: Peli -> (String, Int)
unaPeliYPuntaje pelicula = (titulo pelicula, puntaje pelicula)


-- Soluciones
esPopular :: Peli -> Bool
esPopular = (>5).length.califs

estaBuena :: Peli -> Bool
estaBuena pelicula = esPopular pelicula && ((>7).length.titulo) pelicula

puntaje :: Peli -> Int
puntaje = promedio.califs

dispersion :: Peli -> Int
dispersion pelicula = (maximum.califs) pelicula - (minimum.califs) pelicula

calificar :: Peli -> Int -> Peli
calificar pelicula califNueva = (titulo pelicula, (califs pelicula) ++ [califNueva])

manijear :: Peli -> Peli
manijear pelicula = (titulo pelicula, ((map aumentarPuntaje).califs) pelicula)

valeLaPena :: Maraton -> Bool
valeLaPena bingeWatch = (estaBuena.head) bingeWatch && (estaBuena.last) bingeWatch

pertenece :: String -> Maraton -> Bool
pertenece nombre = ((>1).length.(filter (==nombre)).(map titulo))

valoracion :: Maraton -> Int
valoracion = promedio.(map puntaje)

maratonDeOscar :: Maraton -> Bool
maratonDeOscar = (all (>8)).(map (promedio.califs)).(filter ((<2).dispersion))

pelisYPuntajes :: Maraton -> [(String, Int)]
pelisYPuntajes = map unaPeliYPuntaje
