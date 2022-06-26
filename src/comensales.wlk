import comidas.*

class Comensales {
	var peso
	const comidasQueComio = []
	
	method comer(unaComida) { comidasQueComio.add(unaComida) }
	method leAgrada(unaComida)
	method estaSatisfecho() = self.pesoComidasIngeridas() >= peso*0.01 && self.condicionAdicional()
	method pesoComidasIngeridas() = comidasQueComio.sum{ c=>c.peso() }
	method condicionAdicional()
}

class Vegetariano inherits Comensales {
	override method leAgrada(unaComida) = unaComida.esAptoVegetariano() && unaComida.valoracion() > 85
	override method condicionAdicional() = comidasQueComio.all{ c=>!c.esAbundante() }
}

class HambrePopular inherits Comensales {
	override method leAgrada(unaComida) = unaComida.esAbundante()
	override method condicionAdicional() = true
}

class PaladarFino inherits Comensales {
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) && unaComida.valoracion() > 100
	override method condicionAdicional() = comidasQueComio.size().even()
}