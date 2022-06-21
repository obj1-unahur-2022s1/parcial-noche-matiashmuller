import comidas.*
import comensales.*

object cocina {
	const comidasPreparadas = []
	
	method prepararComida(unaComida) { comidasPreparadas.add(unaComida) }
	method quitarComida(unaComida) { comidasPreparadas.remove(unaComida) }
	method tieneBuenaOfertaVege() = (self.comidasNoVege().size() - self.comidasVege().size()) <= 2
	method comidasVege() = comidasPreparadas.filter{ c=>c.esAptoVegetariano() }
	// Otra forma de hacer comidasNoVege() sería comidasPreparadas.filter{ c=>!self.comidasVege().contains(c) }
	method comidasNoVege() = comidasPreparadas.filter{ c=>!c.esAptoVegetariano() }
	method platoFuerteCarnivoro() = self.comidasNoVege().max{ c=>c.valoracion() }
	method comidasLeGustanA(comensal) = comidasPreparadas.filter{ c=>comensal.leAgrada(c) }
	
	// Bonus
	
	method elegirPlatoPara(comensal) {
		if(self.platosQueGustanA(comensal).isEmpty()) self.error("No le gusta la oferta")
		
		const platoElegido = self.platosQueGustanA(comensal).anyOne()
		
		comidasPreparadas.remove(platoElegido)
		comensal.comer(platoElegido)
	}
	method platosQueGustanA(comensal) = comidasPreparadas.filter{ c=>comensal.leAgrada(c) }
}