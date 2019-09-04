class Bomba {
	var property dano
	var property materiales = []

	method esEfectivo() {
		return dano > 100
	}

	method calidad() {
		return materiales.min({ material => material.calidad() })
	}
	
	method capacidad() {
			return dano / 2
	}
}

class Pocion {
	var property podercurativo	
	var property materiales = []

	method tieneMaterialMistico() {
		return materiales.any({ material => material.esMistico() })
	}

	method esEfectivo() {
		return podercurativo > 50 and self.tieneMaterialMistico()
	}

	method calidad() {
		if (self.tieneMaterialMistico()) {
			return materiales.find({ material => material.esMistico() })
		}
		
		else {
			return materiales.first().calidad()
		}
	}
	
	method capacidad() {
		return podercurativo + 10 * materiales.count({ material => material.esMistico() })
	}
}

class Debilitador {
	var property potencia
	var property materiales = []

	method esEfectivo() {
		return potencia > 0 and (!materiales.any({ material => material.esMistico() }))
	}
	
	method calidad() {
		var calidadesOrdenadas = materiales.map({ material => material.calidad() }).sortBy({ material, otroMaterial => material > otroMaterial })

		return ((calidadesOrdenadas.take(2)) / 2)
	}
	
	method capacidad() {
		var materialesMisticos = materiales.count({ material => material.esMistico() })
	
		if (materialesMisticos > 0) {
			return 12 * materialesMisticos
		}
		
		return 5
	}
}

class ItemDeRecoleccion {
	var property descripcion = ""
	var property materiales = []
	
	method calidad() {
		return 30 + materiales.asSet().map({ material => material.calidad() }).sum() / 10
	}
}

class Material {
	var property descripcion = ""
	var property esMistico
	var property calidad
}

class Alquimista {
	var property itemsDeCombate = []
	var property itemsDeRecoleccion = []
	
	method todosLosItems() {
		return (itemsDeCombate + itemsDeRecoleccion)
	}
	
	method tieneCriterio() {
		return itemsDeCombate.count({ item => item.esEfectivo() }) > itemsDeCombate.size() / 2
	}
	
	method esBuenExplorador() {
		return itemsDeRecoleccion.asSet().size() >= 3
	}
	
	method capacidadOfensiva() {
		return itemsDeCombate.map({ item => item.capacidad() }).sum()
	}
	
	method esProfesional() {
		var promedioDeCalidades = self.todosLosItems().map({ item => item.calidad() }).sum() / self.todosLosItems().size()
		var todosItemsEfectivos = itemsDeCombate.all({ item => item.esEfectivo() })
		
		return promedioDeCalidades > 50 and todosItemsEfectivos and self.esBuenExplorador()
	}
}

