import pruebaSeguridad.Role
import pruebaSeguridad.Usuario
import pruebaSeguridad.UsuarioRole

class BootStrap {

   def init = { servletContext ->

    def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
      def clienteRole = new Role(authority: 'ROLE_CLIENTE').save(flush: true)

      def testUser = new Usuario(username: 'admin', enabled: true, password: 'admin', email:'email@mail.com', nombre:'Manuel Belgrano', direccion:'San Martin 132', dni: '45456')
      testUser.save(flush: true)                 	
      UsuarioRole.create testUser, adminRole, true

      assert Usuario.count() == 1
      assert Role.count() == 3
      assert UsuarioRole.count() == 1
   }
}