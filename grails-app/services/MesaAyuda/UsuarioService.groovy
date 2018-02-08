package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql

@Transactional
class UsuarioService {
    
    def usuarioId(){
        println"========================================================================="
        def usuario = Usuario.findAll();
        def userList = []
        usuario.each {
            def respuesta2 = [:]
            respuesta2.id = it.id
            respuesta2.username = it.username
            respuesta2.password=it.password
            respuesta2.enabled=it.enabled
            respuesta2.authorities = it.authorities.authority
            userList << respuesta2
        }
        println userList 
        return userList

       
    }
}

