import pruebaSeguridad.Role
import pruebaSeguridad.Usuario
import pruebaSeguridad.UsuarioRole
import pruebaSeguridad.Estatus

class BootStrap {

    def init = { servletContext ->

        def userRole = new Role(authority: 'ROLE_DESARROLLADOR').save(flush: true)
        def clienteRole = new Role(authority: 'ROLE_CLIENTE').save(flush: true)
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      

        def testUser = new Usuario(username: 'admin', enabled: true, password: 'admin', email:'email@mail.com', nombre:'Manuel Belgrano', direccion:'San Martin 132', dni: '45456')
        testUser.save(flush: true)                 	
        UsuarioRole.create testUser, adminRole, true

        assert Usuario.count() == 1
        assert Role.count() == 3
        assert UsuarioRole.count() == 1
        def nuevoEstatus = new Estatus(tipoEstatus: 'Nuevo')
        nuevoEstatus.save(flush: true) 
        def asignadoEstatus = new Estatus(tipoEstatus: 'Asignado')
        asignadoEstatus.save(flush: true) 
        def revisionEstatus = new Estatus(tipoEstatus: 'En revision')
        revisionEstatus.save(flush: true) 
        def atendidoEstatus = new Estatus(tipoEstatus: 'Atendido')
        atendidoEstatus.save(flush: true) 
        def cerradoEstatus = new Estatus(tipoEstatus: 'Cerrado')
        cerradoEstatus.save(flush: true) 
    }
}