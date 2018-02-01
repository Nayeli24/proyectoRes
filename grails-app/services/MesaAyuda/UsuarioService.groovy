package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql

@Transactional
class UsuarioService {
    def usuarioId(def usuario){
        println usuario.username
      def datos = []
        def consulta = Usuario.executeQuery("SELECT u FROM Usuario u Where id_usuario = :user ",[user: Usuario.findByUsername(usuario.username)])
        println consulta
        consulta.each{
            def user =[:]
            user.id = it.id
            println "user service::::::::"+user
            def  rol=UsuarioRole.findByUsuario(Usuario.get(user.id))
            def rol2=rol.role.authority
            println "2rol:::::::::::::"+rol2
            datos << rol2
            println "datosssssssssssssssssssssssssssssssssssss"+datos
        }
        return datos 
       
}
}
