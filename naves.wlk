class NaveEspacial {
var velocidad
var direccion 
var  combustible

method acelerar(unValor) {
    velocidad =(velocidad+unValor).min(100000)
  
}
method desacelerar(unValor) {
    velocidad =(velocidad-unValor).max(0)
  
}

method irHaciaElSol() {
    direccion=10
}
method escaparDelSol() {
    direccion= -10
  
}

method ponerseParaleloAlSol() {
  direccion=0
}

method acercarseUnPocoAlSol() {
    direccion=(direccion+1).min(10)
  
}
method alejarseUnPocoDelSol(){
  direccion= (direccion-1).max(-10) 
}

method prepararViaje() 
method cargarCombustible(unaCantidad) {
 combustible += unaCantidad  
}
method descargarCombustible(unaCantidad) {
    combustible-=unaCantidad
  
}

method accionAdicional() {
    self.cargarCombustible(30000)
    self.acelerar(5000)
  
}

method estaTranquila()
method condicionesParaLaTranquilidad() = (combustible>=4000) and velocidad<=12000
method escapar()
method avisar()

method recibirAmenaza() {
    self.escapar()
    self.avisar()  
}


method estaDeRelajo() = self.estaTranquila() and self.tienePocaActividad()
method tienePocaActividad()





}



class NaveBaliza inherits NaveEspacial{
    var color
    var cambioDeColor = false
    method cambiarColorBaliza(unColor) {
      color =  unColor
      cambioDeColor= true
    }
  
   method color() =color 
   override method prepararViaje() {
     self.cambiarColorBaliza("verde")
     self.ponerseParaleloAlSol()
     self.accionAdicional()
   }

   override method estaTranquila() = self.condicionesParaLaTranquilidad() and self.color() != "rojo"

   override method tienePocaActividad() = not  cambioDeColor

}




class NaveDePasajeros inherits NaveEspacial {
    var cantidadDePasajeros
    var property comida
    var property bebida  

    override method prepararViaje(){
        self.comida(self.comida()+(cantidadDePasajeros*4))
        self.bebida(self.bebida()+(cantidadDePasajeros*6))
        self.acercarseUnPocoAlSol()
        self.accionAdicional()

    }

     //  override method tienePocaActividad() =  terminar 
}




class NaveDeCombate inherits NaveEspacial {
    var invisible = true
    var misilesDesplegados
    var mensajes=[]
    method ponerseInvisble(){
        invisible=true

    }
    method ponerseVisible() {

       invisible=false
    }
    method estaInvisible() = invisible

    method desplegarMisiles() {
        misilesDesplegados=true

    }
    method replegarMisiles(){
        misilesDesplegados = false

    }
    method misilesDesplegados()= misilesDesplegados

    method emitirMensaje(mensaje) {mensajes.add(mensaje)} 
    method  mensajesEmitidos() = mensajes
    method primerMensajeEmitido() = mensajes.first()
    method ultimoMensajeEmitido() = mensajes.last()
    method  esEscueta() =mensajes.any({m=>m.length()>30})
    method emitioMensaje(mensaje) =mensajes.contains(mensaje)
    
    override method prepararViaje() {
        self.accionAdicional()
        self.ponerseInvisble()
        self.replegarMisiles()
        self.acelerar(15000)
        self.emitioMensaje("saliendo en mision")
        self.acelerar(15000)
        
   
 }

 override method estaTranquila() = self.condicionesParaLaTranquilidad() and  not  self.misilesDesplegados()


}




class NaveHospital inherits NaveDePasajeros{
    var quirofanosPreparados = false
    method prepararQuirofanos() {
        quirofanosPreparados=true
      
    }

    method quirofanosPreparados() = quirofanosPreparados
    method utilizarQuirofano() {
        quirofanosPreparados=false
      
    } 

    override method estaTranquila() = self.condicionesParaLaTranquilidad() and not self.quirofanosPreparados()



  
}

class NaveSigilosa inherits NaveDeCombate {

    override method estaTranquila() = super() and not self.estaInvisible()
}

// terminar puntos   Reacción ante amenazas - para los tres tipos principales de nave  y Reacción ante amenazas - detalles de las naves especiales