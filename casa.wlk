import cosas.* 

object casaDePepeYJulian {

    var cosasCompradas = []
    var cuenta = cuentaBancaria


    method cosasCompradas() {
        return cosasCompradas
    }
    
    method comprar(cosa) {
            cuenta.extraer(cosa.precio()) // yo elegiria cuentaGastos ya que puede tener valores negativo, pero necesito esto para el test
            cosasCompradas.add(cosa) // agregar cada compra a un conjunto2
    }
    
    method cambiarCuenta(otraCuenta) {
      cuenta = otraCuenta
    }

    method cantidadDeCosasCompradas() {
        return cosasCompradas.size()
    }

    method tieneAlgun(categoria) { // indica si tiene en la lista algo con la misma categoria que "categoria"
        return cosasCompradas.any({ cosa => cosa.categoria() == categoria})
    }

    method vieneDeComprar(categoria) { // indica si la ultima cosa que se compro es de categoria indicada
            return cosasCompradas.last().categoria() == categoria 
    }

    method totalGastado() {
        return cosasCompradas.sum({cadaCosa => cadaCosa.precio()})
    } 

    method esDerrochona() { // indica si el importe total de las cosas compradas es de 9000 pesos o mas 
      return self.totalGastado() > 9000 // recibe una lista y pregunta si el valor de todos los precios de esa lista es mayor a 9000
    } 

    method compraMasCara(){ // retorna la cosa comprada de mayor valor 
            return cosasCompradas.max({cosa => cosa.precio()}) // recibe una lista de objetos y devuelve el objeto con mayor valor
    }

    method comprados(categoria) { // devuelve un objeto que contiene todas las cosas compradas que es de esa categoria 
         return cosasCompradas.filter({cosa => cosa.categoria() == categoria }) // agrega el objeto si tiene la misma categoria que el parametro dado
    }

    method malaEpoca() { // indica si todas las cosas compradas son comida 
            return cosasCompradas.all({ cosa => cosa.categoria() == comida}) // busca en una lista o conjunto si todas sus cosas son comida 
    }

    method queFaltaComprar(lista) { // dada una lista de objetos, devuelve lo que falta comprar de esa lista (si falta algo obvio)
            return lista.filter({cosa => !cosasCompradas.contains(cosa) })
            }

    method faltaComida() { // indica si se han comprado menos de 2 cosas que son comida 
            return cosasCompradas.count({ cosa => cosa.categoria() == comida }) < 2 // recibe una lista y devuelve false si hay mas de 2 comidas verdadero en otro caso 
    }

    method categoriasCompradas() { // indica todas las categorias para las cuales se ha realizado al menos una compra
           return cosasCompradas.map({cosa => cosa.categoria()}).asSet() // recibe una lista y devuelve otra con las categorias que vio en esa lista
    }
}

object cuentaBancaria {
    var property saldo = 0

    method extraer(cantidad) { // no puede extraer si no hay dinero
       self.validarExtraccion(cantidad)
       saldo -= cantidad 
    }

    method depositar(cantidad) {
      saldo += cantidad
    }

    method validarExtraccion(cantidad) {
         return   if (cantidad > saldo ) {
                 throw "Saldo insuficiente"
      }
    }
    
}
 
   object cuentaGastos {
       var property saldo = 0
       var property costoPorOperacion = 0

       method depositar(cantidad) {
            self.validarDeposito(cantidad)
            saldo += cantidad - costoPorOperacion
       }

       method validarDeposito(cantidad) {
         return if (cantidad > 1000) {
                throw "No se permite depositar mas de $1000 en una sola accion"
            }
       }

       method extraer(cantidad) {
         saldo -= cantidad
       }
   }


