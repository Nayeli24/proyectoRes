package pruebaSeguridad

class Empresa {

       
    String nombreEmpresa
    boolean enabled=true
    
    static mapping = {
        id generator: 'sequence', column: 'id_empresa', params:[sequence:'sec_id_empresa']
    }
    static constraints = {
        nombreEmpresa blank: false, size: 1..35
    }
    
    String toString () {
        "${nombreEmpresa}"     
    }
}