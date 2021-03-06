package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql

@Transactional
class IncidenteService {
    def springSecurityService
    def dataSource

    
    
    def verIncidentes(def role,def usuario){
        def consulta
        def datosIncidente=[]
         
        if(role == '[ROLE_CLIENTE]'){
            println "role if "+role
            consulta = Incidente.executeQuery("SELECT t FROM Incidente t WHERE t.registradoPor = :user order by estatus_id desc ",[user: Usuario.findByUsername(usuario) ])
            consulta.each{
                def incidente = [:]
                incidente.id = it.id
                incidente.folio = it.folio
                incidente.estatus=it.estatus
                incidente.tema = it.tema
                incidente.fechaRegistro = it.fechaRegistro
                incidente.asignadoA=it.asignadoA
                incidente.fechaAsignacion=it.fechaAsignacion
                incidente.registradoPor = it.registradoPor
                incidente.fechaCerrado=it.fechaCerrado
                incidente.envioCorreo=it.envioCorreo
                datosIncidente << incidente
            }
        }else if(role=='[ROLE_ADMIN]'){
            def consulta2 = Incidente.executeQuery("SELECT i FROM Incidente i order by estatus_id asc")
            consulta2.each{
                def incidente = [:]
                incidente.id = it.id
                incidente.folio = it.folio
                incidente.estatus=it.estatus
                incidente.tema = it.tema
                incidente.fechaRegistro = it.fechaRegistro
                incidente.registradoPor=it.registradoPor
                incidente.asignadoA=it.asignadoA
                incidente.fechaAsignacion=it.fechaAsignacion
                incidente.registradoPor = it.registradoPor
                incidente.fechaCerrado=it.fechaCerrado
                incidente.envioCorreo=it.envioCorreo
                datosIncidente << incidente
            }
        }else if(role == '[ROLE_DESARROLLADOR]'){  
            def consulta3 = Incidente.executeQuery("SELECT t FROM Incidente t WHERE (t.estatus = :estatus OR t.estatus= :estatus2) AND t.asignadoA = :user order by estatus_id desc",[estatus: Estatus.get(2 as long) , estatus2: Estatus.get(3 as long),user: Usuario.findByUsername(usuario) ])
            consulta3.each{
                def incidente = [:]
                incidente.id = it.id
                incidente.folio = it.folio
                incidente.estatus=it.estatus
                incidente.tema = it.tema
                incidente.fechaRegistro=it.fechaRegistro
                incidente.fechaAsignacion = it.fechaAsignacion
                incidente.registradoPor = it.registradoPor
                incidente.fechaCerrado=it.fechaCerrado
                incidente.envioCorreo=it.envioCorreo
                datosIncidente << incidente
            }
        }
       
        return datosIncidente
      
    }
    
    
    def obtenerIncidentes(def tipo , def role, def usuario) {
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
                    incidente.tema=it.tema
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
            def activo=it.usuario.enabled
            if(activo==true){
                user.id=it.usuario.id
                user.nombre = it.usuario.nombre
                user.apellidoPat = it.usuario.apellidoPat
                user.apellidoMat = it.usuario.apellidoMat
                user.nombreCompleto = user.nombre+" "+user.apellidoPat+" "+user.apellidoMat
                datos << user
            }
        }
        return datos
        
    }
    
    def guardarFlujo(def usuario , def estatus , def folio){
        println "folio:::::::$folio"
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
        println resultado[0]
        return resultado[0]
    }
    
    
    def incidente(id){
        def query=(" select * from Incidente where id_incidente='$id' ")
        def sql = new Sql(dataSource)
        def resultado = sql.rows(query)
        def idt = resultado
        return idt
    }
    

    def cambiarEstatus(def estatus, def idIncidente){
        def  consulta= Incidente.get(idIncidente as long)       
        consulta.estatus = Estatus.get(estatus)  
        consulta.save()
        def gf = guardarFlujo(springSecurityService.currentUser.username,estatus,consulta)
        return consulta
        
    }
}


