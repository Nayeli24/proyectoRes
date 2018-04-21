package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql

@Transactional
class UsuarioService {
    def dataSource
    def usuarioId(){
        def usuario = Usuario.findAll();
        def userList = []
        usuario.each {
            def respuesta2 = [:]
            respuesta2.id = it.id
            respuesta2.username = it.username
            respuesta2.nombre = it.nombre
            respuesta2.apellidoPat = it.apellidoPat
            respuesta2.apellidoMat= it.apellidoMat
            respuesta2.password=it.password
            respuesta2.empresa=it.empresa
            respuesta2.accountLocked=it.accountLocked
            respuesta2.areaDpto=it.areaDpto
            def activa=it.enabled
          
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
    
    
    def obtenerEmpresas(){
        def datos = []
        def  consulta= Empresa.executeQuery("select ur from Empresa ur where ur.enabled='true'")
        println consulta
        // def consulta = Usuario.executeQuery("SELECT u FROM Usuario u Where u.username <> '$usuario'")
        consulta.each{
            def empresa =[:]
            def activo=it.enabled
            if(activo==true){
                empresa.id=it.id
                empresa.nombreEmpresa = it.nombreEmpresa
                datos << empresa
            }
        }
        return datos
    }
    
    
    def ultimoRegistro(){
        def query=("select id_usuario from usuario  order by id_usuario desc limit 1 ")
        def sql = new Sql(dataSource)
        def resultado = sql.rows(query)
        def idt = resultado.id_usuario
        return idt.first()
    }
}