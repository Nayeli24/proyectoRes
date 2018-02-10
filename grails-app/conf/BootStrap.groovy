
import pruebaSeguridad.Role
import pruebaSeguridad.Usuario
import pruebaSeguridad.UsuarioRole
import pruebaSeguridad.Empresa
import pruebaSeguridad.Estatus

class BootStrap {

    def init = { servletContext ->

      /* def userRole = new Role(authority: 'ROLE_DESARROLLADOR',descripcion:'Empleado').save(flush: true)
        def clienteRole = new Role(authority: 'ROLE_CLIENTE',descripcion:'Cliente').save(flush: true)
        def adminRole = new Role(authority: 'ROLE_ADMIN', descripcion:'Administrador').save(flush: true)    
        
        def testEmpresa = new Empresa(nombreEmpresa:'Nuuptech S.A. de C.V.')
        testEmpresa.save(flush:true)
        
        def testUser = new Usuario(nombre:'Manuel', apellidoPat:'Belgrano', apellidoMat:'Garcia', areaDpto:'Direccion General',empresa: testEmpresa, email:'admin@mail.com',username: 'admin', enabled: true, password: 'admin')
        testUser.save(flush: true)                 	
        UsuarioRole.create testUser, adminRole, true
        
        assert Empresa.count()==1
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
        */
    }
    
}