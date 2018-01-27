package pruebaSeguridad

class Flujo {
    Usuario usuarioMovimiento
    Incidente incidente
    Estatus estatus
    Date fechaMovimiento = new Date()
   
    static constraints = {
    }
    
     static mapping = {
        
        id generator: 'sequence', column: 'id_flujo', params:[sequence:'sec_id_flujo']
        
    }
}
