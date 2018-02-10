package pruebaSeguridad

class TipoDoc {

      String tipoDoc
    
    static mapping = {
        id generator: 'sequence', column: 'id_tipodoc', params:[sequence:'sec_id_tipodoc']
    }
    static constraints = {
        tipoDoc blank: false
    }
    
    String toString () {
        "${tipoDoc}"     
    }
}