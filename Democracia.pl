%%% PUNTO 1 %%%

% esCandidato
esCandidato(frank, rojo).
esCandidato(claire, rojo).
esCandidato(garrett, azul).
esCandidato(jackie, amarillo).
esCandidato(linda, azul).
esCandidato(catherine, rojo).
esCandidato(seth, amarillo).
esCandidato(heather, amarillo).

% edad(Nombre, Edad)
edad(frank, 50).
edad(claire, 52).
edad(garrett, 64).
edad(peter, 26).
edad(jackie, 38).
edad(linda, 30).
edad(catherine, 59).
edad(heather, 50).

% sePostulaEn(Provincia, Partido)
sePostulaEn(buenosAires, azul).
sePostulaEn(chaco, azul).
sePostulaEn(tierraDelFuego, azul).
sePostulaEn(sanLuis, azul).
sePostulaEn(neuquen, azul).
sePostulaEn(buenosAires, rojo).
sePostulaEn(santaFe, rojo).
sePostulaEn(cordoba, rojo).
sePostulaEn(chubut, rojo).
sePostulaEn(tierraDelFuego, rojo).
sePostulaEn(sanLuis, rojo).
sePostulaEn(chaco, amarillo).
sePostulaEn(formosa, amarillo).
sePostulaEn(tucuman, amarillo).
sePostulaEn(salta, amarillo).
sePostulaEn(santaCruz, amarillo).
sePostulaEn(laPampa, amarillo).
sePostulaEn(corrientes, amarillo).
sePostulaEn(misiones, amarillo).
sePostulaEn(buenosAires, amarillo).

% poblacion(Provincia, NumeroDeHabitantes)
poblacion(buenosAires, 15355000).
poblacion(chaco, 1143201).
poblacion(tierraDelFuego, 160720).
poblacion(sanLuis, 489255).
poblacion(neuquen, 637913).
poblacion(santaFe, 3397532).
poblacion(cordoba, 3567654).
poblacion(chubut, 577466).
poblacion(formosa, 527895).
poblacion(tucuman, 1687305).
poblacion(salta, 1333365).
poblacion(santaCruz, 273964).
poblacion(laPampa, 349299).
poblacion(corrientes, 992595).
poblacion(misiones, 1189446).

% intencionDeVotoEn(Provincia, Partido, Porcentaje)
intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

% inflacion(cotaInferior, cotaSuperior)
% construir(listaDeObras)
% nuevosPuestosDeTrabajo(cantidad)

% edilicio(hospital, 800)

promete(azul, construir([edilicio(hospital, 1000),
			edilicio(jardin, 100),
			edilicio(escuela, 5)])).
promete(amarillo, construir([edilicio(hospital, 100),
			edilicio(universidad, 1),
			edilicio(comisaria, 200)])).
promete(rojo, nuevosPuestosDeTrabajo(800000)).
promete(amarillo, nuevosPuestosDeTrabajo(10000)).
promete(azul, inflacion(2,4)).
promete(amarillo, inflacion(1,15)).
promete(rojo, inflacion(10,30)).

%%% PUNTO 2 %%%
esPicante(Provincia) :-
	sePresentaMasDeUnPartido(Provincia),
	masDeUnMillonDeHabitantes(Provincia).

sePresentaMasDeUnPartido(Provincia) :-
	sePostulaEn(Provincia, UnPartido),
	sePostulaEn(Provincia, OtroPartido),
	UnPartido \= OtroPartido.

masDeUnMillonDeHabitantes(Provincia) :-
	poblacion(Provincia,Poblacion),
	Poblacion > 1000000.

%%% PUNTO 3 %%%
esCandidatoEnProvincia(Candidato, Provincia) :-
	esCandidato(Candidato, Partido),
	sePostulaEn(Provincia, Partido).

leGanaA(CandidatoGanador, CandidatoPerdedor, Provincia) :-
	esCandidatoEnProvincia(CandidatoGanador, Provincia),
	not(esCandidatoEnProvincia(CandidatoPerdedor, Provincia)).

leGanaA(CandidatoGanador, CandidatoPerdedor, Provincia) :-
	sonCandidatosEnLaMismaProvincia(CandidatoGanador,CandidatoPerdedor),
	candidatosDeDistintoPartido(CandidatoGanador, CandidatoPerdedor),
	intencionDeVotoEn(Provincia, PartidoGanador, PorcentajeGanador),
	intencionDeVotoEn(Provincia, PartidoPerdedor, PorcentajePerdedor),
	PorcentajeGanador > PorcentajePerdedor.

leGanaA(CandidatoGanador, CandidatoPerdedor, Provincia) :-
	esCandidato(CandidatoGanador, Partido),
	esCandidato(CandidatoPerdedor, Partido),

	sePostulaEn(Provincia, Partido).

candidatosDeDistintoPartido(UnCandidato, OtroCandidato) :-
	esCandidato(UnCandidato, UnPartido),
	esCandidato(OtroCandidato, OtroPartido),
	UnPartido \= OtroPartido.

sonCandidatosEnLaMismaProvincia(CandidatoGanador,CandidatoPerdedor):-
	esCandidatoEnProvincia(CandidatoGanador,Provincia),
	esCandidatoEnProvincia(CandidatoPerdedor,Provincia).

%%% PUNTO 4 %%%

elGranCandidato(CandidatoA):-
	esCandidato(CandidatoA, Partido),
	candidatoMasJovenDelPartido(CandidatoA),
	forall((sePostulaEn(Provincia, Partido),esCandidatoEnProvincia(CandidatoB, Provincia)),
	 leGanaA(CandidatoA, CandidatoB , Provincia)).

candidatoMasJovenDelPartido(CandidatoA):-
	esCandidato(CandidatoA, Partido),	
	forall(esCandidato(CandidatoB, Partido), tieneMenosEdad(CandidatoA, CandidatoB)).

tieneMenosEdad(CandidatoA, CandidatoB):-
	edad(CandidatoA, EdadA),
	edad(CandidatoB, EdadB),
	EdadA =< EdadB.

%%%% Este lo hice por el caso de Seth en el partido amarillo que no tiene la edad en la base de conocimiento. %%%
tieneMenosEdad(_, CandidatoB):-
	esCandidato(CandidatoB, _),
	not(edad(CandidatoB, _)).

%%% Falta responder las preguntas.%%%

%%% PUNTO 5 %%%
ajusteConsultora(Partido, Provincia, VerdaderoPorcentaje) :-
	intencionDeVotoEn(Provincia, Partido, FalsoPorcentaje),
	valorCorrespondiente(Provincia, Partido, ValorCorrector),
	VerdaderoPorcentaje is FalsoPorcentaje + ValorCorrector.

valorCorrespondiente(Provincia, Partido, (-20)) :-
	ganabaEnProvincia(Provincia, Partido).

valorCorrespondiente(Provincia, Partido, 5) :-
	not(ganabaEnProvincia(Provincia, Partido).

ganabaEnProvincia(Provincia, Partido) :-
	intencionDeVotoEn(Provincia, Partido, _),
	forall(intencionDeVotoEn(Provincia, OtrosPartidos, _), 
		leGanaPorIntencionDeVotosA(Partido, OtrosPartidos, Provincia)).

leGanaPorIntencionDeVotosA(UnPartido, OtroPartido, Provincia):-
	intencionDeVotoEn(Provincia, UnPartido, IntencionDeVotosA),
	intencionDeVotoEn(Provincia, OtroPartido, IntencionDeVotosB),

	IntencionDeVotosA >= IntencionDeVotosB.

ganabaEnProvincia(Provincia, Partido) :-
	intencionDeVotoEn(Provincia, Partido, _),
	forall(intencionDeVotoEn(Provincia, OtrosPartidos, _), 
		partidoLeGanaAPartido(Partido, OtrosPartidos, Provincia)).

%%% PUNTO 7 %%%
influenciaDePromesas(inflacion(ValorInferior, ValorSuperior), Variacion) :-
	Variacion is (-1) * (ValorInferior + ValorSuperior) / 2.

influenciaDePromesas(nuevosPuestosDeTrabajo(Num), 3) :-
	Num > 50000.

influenciaDePromesas(nuevosPuestosDeTrabajo(Num), 0) :-
	Num =< 50000.

influenciaDePromesas(Edilicios, VariacionTotal) :-
	forall(member(PosibleEdilicio, Edilicios),
		esEdilicio(PosibleEdilicio)),
	findall(Porcentaje,
		(member(Edilicio, Edilicios), 
			porcentajeDeEdilicio(Edilicio, Porcentaje)),
		Porcentajes),
	sumlist(Porcentajes, VariacionTotal).

esEdilicio(edilicio(_, _)).

porcentajeDeEdilicio(edilicio(hospital, _), 2).
porcentajeDeEdilicio(edilicio(jardin, N), Porcentaje) :-
	Porcentaje is (0.1) * N.
porcentajeDeEdilicio(edilicio(escuela, N), Porcentaje) :-
	Porcentaje is (0.1) * N.
porcentajeDeEdilicio(edilicio(comisaria, 200), 2).
porcentajeDeEdilicio(edilicio(comisaria, _), 0).
porcentajeDeEdilicio(edilicio(universidad, _), 0).
porcentajeDeEdilicio(edilicio(otro, _), -1).

%%% PUNTO 8 %%%
promedioDeCrecimiento(Partido, Promedio) :-
	partido(Partido),
	findall(Porcentaje, 
		(promete(Partido, Promesa),
			influenciaDePromesas(Promesa, Porcentaje)),
		Porcentajes),
	sumlist(Porcentajes, Promedio),

partido(Partido) :-
	sePostulaEn(_, Partido).
