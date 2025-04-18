import cosas.* 

object casaDePepeYJulian {

    var cantCosasCompradas = 0
    const cosasCompradas = []
    var totalGastado = 0

    method cosasCompradas() {
        return cosasCompradas
    }
    
    method comprar(cosa) {
            cosasCompradas.add(cosa) // agregar cada compra a un conjunto
            cantCosasCompradas += 1 // suma la cantidad comprada
            totalGastado += cosa.precio()
    }

    method cantidadDeCosasCompradas() {
        return cantCosasCompradas
    }

    method tieneAlgun(categoria) { // indica si tiene en la lista algo con la misma categoria que "categoria"
        return cosasCompradas.any({ unaCosa => unaCosa.categoria() == categoria})
    } 

    method vieneDeComprar(categoria) { // indica si la ultima cosa que se compro es de categoria indicada
            return cosasCompradas.last().categoria() == categoria 
    }

    method totalGastado() {
        return totalGastado
    } 

    method esDerrochona() { // indica si el importe total de las cosas compradas es de 9000 pesos o mas 
      return totalGastado > 9000 // recibe una lista y pregunta si el valor de todos los precios de esa lista es mayor a 9000
    } 

    method compraMasCara(){ // retorna la cosa comprada de mayor valor 
            return cosasCompradas.max({cosa => cosa.precio()})    // recibe una lista de objetos y devuelve el objeto con mayor valor
    }

    method comprados(categoria) { // devuelve un objeto que contiene todas las cosas compradas que es de esa categoria 
         return cosasCompradas.filter({unaCosa => unaCosa.categoria() == categoria })           // agrega el objeto si tiene la misma categoria que el parametro dado
    }

    method malaEpoca() { // indica si todas las cosas compradas son comida 
            return cosasCompradas.all({ unaCosa => unaCosa.categoria() == comida})    // busca en una lista o conjunto si todas sus cosas son comida 
    }

    method queFaltaComprar(lista) { // dada una lista de objetos, devuelve lo que falta comprar de esa lista (si falta algo obvio)
            return lista.filter({unaCosa => !cosasCompradas.constains(unaCosa) })
            }

    method faltaComida() { // indica si se han comprado menos de 2 cosas que son comida 
            return cosasCompradas.count({ unaCosa => unaCosa.categoria() == comida }) < 2      // recibe una lista y devuelve false si hay mas de 2 comidas verdadero en otro caso 
    }

    method categoriasCompradas() { // indica todas las categorias para las cuales se ha realizado al menos una compra
           return cosasCompradas.map({unaCosa => unaCosa.categoria()})        // recibe una lista y devuelve otra con las categorias que vio en esa lista
    }
}

