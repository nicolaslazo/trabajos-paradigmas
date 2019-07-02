% PUNTO 1

esCandidato(frank,rojo).
esCandidato(claire,rojo).
esCandidato(garrett,azul).
esCandidato(jackie,amarillo).
esCandidato(linda,azul).
esCandidato(catherine,rojo).
esCandidato(seth,amarillo).
esCandidato(heather,amarillo).

edad(frank,50).
edad(claire,52).
edad(garrett,64).
edad(peter,26).
edad(jackie,38).
edad(linda,30).
edad(catherine,59).
edad(heather,50).

sePostulanEn(buenosAires,azul).
sePostulanEn(chacho,azul).
sePostulanEn(tierraDelFuego,azul).
sePostulanEn(sanLuis,azul).
sePostulanEn(neuquen,azul).
sePostulanEn(buenosAires,rojo).
sePostulanEn(santaFe,rojo).
sePostulanEn(cordoba,rojo).
sePostulanEn(chubut,rojo).
sePostulanEn(tierraDelFuego,rojo).
sePostulanEn(sanLuis,rojo).
sePostulanEn(chaco,amarillo).
sePostulanEn(formosa,amarillo).
sePostulanEn(tucuman,amarillo).
sePostulanEn(salta,amarillo).
sePostulanEn(santaCruz,amarillo).
sePostulanEn(laPampa,amarillo).
sePostulanEn(corrientes,amarillo).
sePostulanEn(misiones,amarillo).
sePostulanEn(buenosAires,amarillo).


cantidadDeHabitantes(buenosAires,15355000).
cantidadDeHabitantes(chaco,1143201).
cantidadDeHabitantes(tierraDelFuego,160720).
cantidadDeHabitantes(sanLuis,489255).
cantidadDeHabitantes(neuquen,637913).
cantidadDeHabitantes(santaFe,3397532).
cantidadDeHabitantes(cordoba,3567654).
cantidadDeHabitantes(chubut,577466).
cantidadDeHabitantes(formosa,527895).
cantidadDeHabitantes(tucuman,1687305).
cantidadDeHabitantes(salta,1333365).
cantidadDeHabitantes(santaCruz,273964).
cantidadDeHabitantes(laPampa,349299).
cantidadDeHabitantes(corrientes,992595).
cantidadDeHabitantes(misiones,1189446).

% aca los numeros de "cantidadDeHabitantes" no les puse punto ni nada porque no me los tomaba bien (no se si eso despues habria que arreglarlo).

% PUNTO 2
esPicante(Provincia):-
	sePresentaMasDeUnPartido(Provincia),
	masDeUnMillonDeHabitantes(Provincia).

sePresentaMasDeUnPartido(Provincia):-
	

masDeUnMillonDeHabitantes(Provincia):-
	cantidadDeHabitantes(Provincia,Cantidad),
	Cantidad > 1000000.
