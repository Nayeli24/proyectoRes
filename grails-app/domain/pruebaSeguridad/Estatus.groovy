package pruebaSeguridad

class Estatus implements Serializable{
    
    String tipoEstatus
    
    static mapping = {
        id generator: 'sequence', column: 'id_estatus', params:[sequence:'sec_id_estatus']
    }
    static constraints = {
        tipoEstatus blank: false
    }
    
    String toString () {
        "${tipoEstatus}"     
    }
}