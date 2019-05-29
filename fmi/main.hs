type Recurso = String
type Estrategia = Pais -> Pais
type Receta = Pais -> Pais

data Pais = Pais {
	ingresoPerCapita 	:: Int,
	poblacionSectorPublico 	:: Int,
	poblacionSectorPrivado 	:: Int,
	recursosNaturales 	:: [Recurso],
	deuda 			:: Int
} deriving (Show, Eq)

--

modificarDeuda :: Int -> Estrategia
modificarDeuda valor pais = pais { deuda = deuda + valor }

prestamo :: Int -> Estrategia
prestamo nMillones = (modificarDeuda (nMillones*(1.5)))

--

reducirIngreso :: Int -> Estrategia
reducirIngreso porcentaje pais = pais { ingresoPerCapita = ingresoPerCapita - ingresoPerCapita * porcentaje / 100 }

reducirIngresoPorPuestos :: Int -> Estrategia
reducirIngresoPorPuestos puestos pais 
    | puestos > 100 	= reducirIngreso 20 pais
    | otherwise		= reducirIngreso 15 pais

reducirActivosPublicos :: Int -> Estrategia
reducirActivosPublicos activos pais = pais { poblacionSectorPublico = poblacionSectorPublico - activos }

reducirPuestosPublicos :: Int -> Estrategia
reducirPuestosPublicos puestos = ((reducirActivosPublicos puestos) . (reducirIngresoPorPuestos puestos))

--

sacarRecurso :: Recurso -> [Recurso] -> [Recurso]
sacarRecurso recurso = (filter (not.(==recurso)))

modificarRecursos :: [Recurso] -> Estrategia
modificarRecursos nuevosRecursos pais = pais { recursosNaturales = nuevosRecursos }

modificarRecursosPorCriterio :: ([Recurso] -> [Recurso]) -> Estrategia
modificarRecursosPorCriterio f pais = modificarRecursos (f.recursosNaturales $ pais) pais

explotarRecurso :: Recurso -> Estrategia
explotarRecurso recurso = ((modificarDeuda (-2)) . (modificarRecursosPorCriterio (sacarRecurso recurso)))

--

pbi :: Pais -> Int
pbi pais = ingresoPerCapita pais * (poblacionSectorPublico pais + poblacionSectorPrivado pais)

blindaje :: Estrategia
blindaje pais = ((modificarDeuda (pbi pais / 2)) . reducirActivosPublicos 500) pais

--

namibia = Pais 4140 400000 650000 ["Mineria", "Ecoturismo"] 50

--

explotarMineria :: Receta
explotarMineria = (modificarDeuda 200 . modificarRecursosPorCriterio (sacarRecurso "Mineria"))

--

--explotarMineria namibia

--

zafan :: [Pais] -> [Pais]
zafan = (filter (elem "Petroleo" . recursosNaturales))

--

deudaTotal :: [Pais] -> Int
deudaTotal = (sum . map deuda)

--

listaEstaOrdenada :: [Receta] -> Pais -> Bool
listaEstaOrdenada [] _ = True
listaEstaOrdenada (receta:otrasRecetas) pais
  | (pbi.receta) pais > pbi pais 	= listaEstaOrdenada otrasRecetas pais
  | otherwise 				= False
