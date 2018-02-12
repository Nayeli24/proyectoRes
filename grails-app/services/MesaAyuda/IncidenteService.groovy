package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql

@Transactional
class IncidenteService {
    def springSecurityService
    def dataSource
    def usuarioService
    
    def obtenerIncidentes(def tipo , def role) {
        def datos = []
        def consulta
        if (tipo == 'SinAsignar'){
            def  consultauser= UsuarioRole.executeQuery("select ur from UsuarioRole ur where ur.role= :roleCliente",[roleCliente : Role.findByAuthority('ROLE_CLIENTE')])
            def usuarioCliente=consultauser.usuario.username
            for (def usuarioc : usuarioCliente) {
                consulta = Incidente.executeQuery("SELECT t FROM Incidente t WHERE t.estatus = :estatus AND t.registradoPor = :user ",[estatus: Estatus.get(1 as long) , user: Usuario.findByUsername(usuarioc) ])
                consulta.each{
                    def incidente = [:]
                    incidente.id = it.id
                    incidente.folio = it.folio
                    incidente.fechaRegistro = it.fechaRegistro
                    incidente.estatus=it.estatus
                    datos << incidente
                }
            }
            return datos
        }else if(tipo == "Asignados"){  
             def  consultaDesaUser= UsuarioRole.executeQuery("select ur from UsuarioRole ur where ur.role= :roleDesarrollador",[roleDesarrollador : Role.findByAuthority('ROLE_DESARROLLADOR')])
             def usuarioDesarrollador=consultaDesaUser.usuario.username
             println "::::::::::35"
            for (def usuariod : usuarioDesarrollador) {
                consulta = Incidente.executeQuery("SELECT t FROM Incidente t WHERE t.estatus = :estatus AND t.asignadoA = :user ",[estatus: Estatus.get(2 as long) , user: Usuario.findByUsername(usuariod) ])
                consulta.each{
                    def incidente = [:]
                    incidente.id = it.id
                    incidente.folio = it.folio
                    incidente.estatus=it.estatus
                    incidente.descripcion = it.descripcion
                    incidente.fechaAsignacion = it.fechaAsignacion
                    incidente.registradoPor = it.registradoPor
                    datos << incidente
                }
            }
            return datos
        }
    }
    def obtenerUsuarios(def role){
        def datos = []
        def  consulta= UsuarioRole.executeQuery("select ur from UsuarioRole ur where ur.role= :roleDesarrollador",[roleDesarrollador : Role.findByAuthority('ROLE_DESARROLLADOR')])
       // def consulta = Usuario.executeQuery("SELECT u FROM Usuario u Where u.username <> '$usuario'")
        consulta.each{
            def user =[:]
            user.id=it.usuario.id
            user.username = it.usuario.username
            
            datos << user
        }
        return datos
    }
    
    def guardarFlujo(def usuario , def estatus , def folio){
        
        def flujo = new Flujo ()
        flujo.usuarioMovimiento = Usuario.findByUsername(usuario)
        flujo.incidente = folio
        flujo.estatus = Estatus.get(estatus as long)
        flujo.save()
        println "46 ::::::::  " + flujo
    }
    
    
    def ultimoRegistro(){
        def query=("select id_incidente from Incidente  order by id_incidente desc limit 1 ")
        def sql = new Sql(dataSource)
        def resultado = sql.rows(query)
        def idt = resultado.id_incidente
        return idt
    }
    
    
    
    
    
    
    
}
