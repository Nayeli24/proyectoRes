package pruebaSeguridad

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
@ToString(includes='authority', includeNames=true, includePackage=false)
class Role implements Serializable {

    private static final long serialVersionUID = 1

    String authority
    String descripcion

    Role(String authority) {
        this()
        this.authority = authority
    }

    static constraints = {
        authority blank: false, unique: true
        descripcion blank: false, unique: true
    }

    static mapping = {
        id generator: 'sequence', column: 'id_role', params:[sequence:'sec_id_role']
        cache true
    }
        
    public String toString(){
        return descripcion
    }
}
