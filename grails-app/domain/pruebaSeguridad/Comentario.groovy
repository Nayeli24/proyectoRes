package pruebaSeguridad

class Comentario {

       
    Incidente incidente
    Usuario usuario
    String descripcion
    Date fechaComentario = new Date()
    static mapping = {
        id generator: 'sequence', column: 'id_comentario', params:[sequence:'sec_id_comentario']
    }
    static constraints = {
        incidente (nullable: true)
        descripcion blank: false
        usuario (nullable: true)
        fechaComentario  (nullable: true)
    }
    
    String toString () {
        "${descripcion}"     
    }
}
