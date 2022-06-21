class Plato {
	// var property peso = 250
	method peso()
	method esAptoVegetariano() = false
	method valoracion()
	method esAbundante() = self.peso() > 250
}

class Provoleta inherits Plato {
	var peso
	var tieneEspecias
	
	override method peso() = peso
	override method esAptoVegetariano() = !tieneEspecias
	method esEspecial() = self.esAbundante() || tieneEspecias
	override method valoracion() = if(self.esEspecial()) 120 else 80
}

class HamburCarne inherits Plato {
	var pan = panIndustrial
	
	override method peso() = 250
	method configurarPan(unPan) { pan = unPan }
	override method valoracion() = 60+pan.valoracion()
}

object panIndustrial {
	method valoracion() = 0
}

object panCasero {
	method valoracion() = 20
}

object panMasaMadre {
	method valoracion() = 45
}

class HamburVege inherits HamburCarne {
	var legumbre
	
	override method esAptoVegetariano() = true
	override method valoracion() = super() + 17.min(2*legumbre.size())
}

class Parrillada inherits Plato {
	const cortesCarne = []
	
	method agregarCorte(corte) { cortesCarne.add(corte) }
	method quitarCorte(corte) { cortesCarne.remove(corte) }
	override method peso() = cortesCarne.sum{ c=>c.peso() }
	override method valoracion() = (15* self.maximaCalidadCortes() - cortesCarne.size()).abs()
	method maximaCalidadCortes() = cortesCarne.max({ c=>c.calidad() }).calidad()
}

class CorteCarne {
	const nombre
	const property calidad
	const property peso
}