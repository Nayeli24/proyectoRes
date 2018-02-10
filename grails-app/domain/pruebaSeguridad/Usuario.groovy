package pruebaSeguridad

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class Usuario implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService
        
    String nombre
    String apellidoPat
    String apellidoMat
    String areaDpto
    Empresa empresa
    String email
    String username
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Usuario(String username, String password) {
        this()
        this.username = username
        this.password = password
    }

    Set<Role> getAuthorities() {
        UsuarioRole.findAllByUsuario(this)*.role
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        password blank: false
        nombre blank: false
        apellidoPat blank: false
        apellidoMat blank: false
        areaDpto blank: false
        empresa (nullable:true)
        email (email:true, blank:false)
    }

    static mapping = {
        password column: '`password`'
    }
}
