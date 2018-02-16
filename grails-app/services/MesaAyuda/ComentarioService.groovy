package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql

@Transactional
class ComentarioService {

    def listarComentarios(def incidente) {
        def consulta
        def datosComentario=[] 
        consulta = Comentario.executeQuery("SELECT c FROM Comentario c WHERE c.incidente = :inc ",[inc: Incidente.findById(incidente) ])
        println "consulta::::::::::::::::::::::::::::...."+consulta
        consulta.each{
            def comentario = [:]
            comentario.id = it.id
            comentario.incidente = it.incidente.tema
            println"incidente:::::::::::::::::.."+comentario.incidente
            comentario.descripcion = it.descripcion
            comentario.usuario=it.usuario 
            comentario.fechaComentario=it.fechaComentario
            datosComentario << comentario
        }
        return datosComentario

    }
}
