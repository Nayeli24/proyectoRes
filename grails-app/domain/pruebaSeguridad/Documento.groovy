package pruebaSeguridad

class Documento {

  Incidente incidente
    TipoDoc tipoDoc
    String nombre
    String size
    Date fechaSubio = new Date()
    String urlArchivo
    
    static mapping = {
        id generator: 'sequence', column: 'id_documento', params:[sequence:'sec_id_documento']
    }
    static constraints = {
        incidente (nullable: true)
        tipoDoc (nullable: true)
        nombre blank: false
        size blank:false
        fechaSubio (nullable: true)
        urlArchivo (url:true, blank:false)
        
    }
    
    String toString () {
        "${nombre}" 
        "${size}"  
        "${urlArchivo}"  
    }
}