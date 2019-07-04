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

% sePostulanEn(Provincia, Partido)
sePostulanEn(buenosAires, azul).
sePostulanEn(chaco, azul).
sePostulanEn(tierraDelFuego, azul).
sePostulanEn(sanLuis, azul).
sePostulanEn(neuquen, azul).
sePostulanEn(buenosAires, rojo).
sePostulanEn(santaFe, rojo).
sePostulanEn(cordoba, rojo).
sePostulanEn(chubut, rojo).
sePostulanEn(tierraDelFuego, rojo).
sePostulanEn(sanLuis, rojo).
sePostulanEn(chaco, amarillo).
sePostulanEn(formosa, amarillo).
sePostulanEn(tucuman, amarillo).
sePostulanEn(salta, amarillo).
sePostulanEn(santaCruz, amarillo).
sePostulanEn(laPampa, amarillo).
sePostulanEn(corrientes, amarillo).
sePostulanEn(misiones, amarillo).
sePostulanEn(buenosAires, amarillo).

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

%%% PUNTO 2 %%%
esPicante(Provincia) :-
	sePresentaMasDeUnPartido(Provincia),
	masDeUnMillonDeHabitantes(Provincia).

sePresentaMasDeUnPartido(Provincia) :-
	sePostulanEn(Provincia, UnPartido),
	sePostulanEn(Provincia, OtroPartido),
	UnPartido \= OtroPartido.

masDeUnMillonDeHabitantes(Provincia) :-
	poblacion(Provincia,Poblacion),
	Poblacion > 1000000.

%%% PUNTO 3 %%%
esCandidatoEnProvincia(Candidato, Provincia) :-
	esCandidato(Candidato, Partido),
	sePostulanEn(Provincia, Partido).

leGanaA(CandidatoA, CandidatoB, Provincia) :-
	esCandidatoEnProvincia(CandidatoA, Provincia),
	not(esCandidatoEnProvincia(CandidatoB, Provincia)).

leGanaA(CandidatoA, CandidatoB, Provincia) :-
	esCandidatoEnProvincia(CandidatoA, Provincia),
	esCandidatoEnProvincia(CandidatoB, Provincia),
	
	esCandidato(CandidatoA, PartidoA),
	esCandidato(CandidatoB, PartidoB),

	PartidoA \= PartidoB,

	intencionDeVotoEn(Provincia, PartidoA, PorcentajeA),
	intencionDeVotoEn(Provincia, PartidoB, PorcentajeB),

	PorcentajeA > PorcentajeB.

leGanaA(CandidatoA, CandidatoB, Provincia) :-
	esCandidato(CandidatoA, Partido),
	esCandidato(CandidatoB, Partido),

	sePostulanEn(Provincia, Partido).

%%% PUNTO 4 %%%

elGranCandidato(CandidatoA):-
	esCandidato(CandidatoA, Partido),
	candidatoMasJovenDelPartido(CandidatoA),
	forall((sePostulanEn(Provincia, Partido),esCandidatoEnProvincia(CandidatoB, Provincia)),
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
	ganabaEnProvincia(Provincia, Partido),
	VerdaderoPorcentaje is FalsoPorcentaje - 20.

ajusteConsultora(Partido, Provincia, VerdaderoPorcentaje) :-
	intencionDeVotoEn(Provincia, Partido, FalsoPorcentaje),
	not(ganabaEnProvincia(Provincia, Partido)),
	VerdaderoPorcentaje is FalsoPorcentaje + 5.

ganabaEnProvincia(Provincia, Partido) :-
	forall(sePostulanEn(Provincia, OtrosPartidos), 
		partidoLeGanaAPartido(Partido, OtrosPartidos, Provincia)).

partidoLeGanaAPartido(UnPartido, OtroPartido, Provincia) :-
	esCandidato(Candidato, UnPartido),
	forall(esCandidato(OtroCandidato, OtroPartido), leGanaA(Candidato, OtroCandidato, Provincia)).
