package pruebaSeguridad

class Incidente {

    String descripcion
    String tema
    def date = new Date()
    int noComentarios
    Date fechaRegistro = new Date()
    Date fechaAtencion
    String folio
    Estatus estatus 
    Usuario registradoPor
    Usuario asignadoA
    Date fechaAsignacion // = new Date()
    String solucion
    Date fechaCerrado   
    boolean envioCorreo=false
    
    static constraints = {
        descripcion blank: false 
        noComentarios blank :false
        tema blank:false
        estatus (nullable: true)
        folio blank: false
        registradoPor (nullable: true)
        asignadoA  (nullable: true)
        fechaAsignacion  (nullable: true)
        fechaAtencion  (nullable: true)
        fechaCerrado  (nullable: true)
        estatus defaultValue: 'Nuevo'
        solucion (nullable:true)
    }
    
    static mapping = {
        
        id generator: 'sequence', column: 'id_incidente', params:[sequence:'sec_id_incidente']
        
    }
    
    String toString () {
        "${descripcion}"     
        "${folio}"  
        "${solucion}" 
    }
}
