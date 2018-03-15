package pruebaSeguridad

class Documento {

  Incidente incidente
  
    String nombre
  
    Date fechaSubio = new Date()
    String urlArchivo
    
    static mapping = {
        id generator: 'sequence', column: 'id_documento', params:[sequence:'sec_id_documento']
    }
    static constraints = {
        incidente (nullable: true)
     
        nombre blank: false
  
        fechaSubio (nullable: true)
        urlArchivo (blank:false)
        
    }
    
    String toString () {
        "${nombre}" 
        "${size}"  
        "${urlArchivo}"  
    }
}