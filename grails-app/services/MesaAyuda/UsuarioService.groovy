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
            println "usuario::::::::::::::::::::::."+usuario
            def respuesta2 = [:]
            respuesta2.id = it.id
            respuesta2.username = it.username
            respuesta2.password=it.password
            respuesta2.empresa=it.empresa
            def activa=it.enabled
            println "ACtiva cuenta:::::::::::::::::::::::::::::::::::::::::::::::::"
            println activa
            if(activa==true){
                respuesta2.enabled="Sí"
            }else{
                respuesta2.enabled="No"
            }
            respuesta2.authorities = it.authorities.descripcion
            
            userList << respuesta2
        }
        println userList.enabled 
        return userList      
    }
    
    
    def usuarioLog(def username){
        println"========================================================================="
        def  consulta= Usuario.executeQuery("select u from Usuario u where u.username= '$username'")
        println ":::::::::::"+consulta
        def datos= []
        consulta.each{
            def user =[:]
            user.id = it.id
            user.username = it.username
            user.nombre=it.nombre+" "+it.apellidoPat+" "+it.apellidoMat
            user.empresa=it.empresa
            user.areaDpto=it.areaDpto
            user.email=it.email
            user.authorities = it.authorities.descripcion
            
            datos << user
        }
        return datos      
    }
}

