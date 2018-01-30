package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql

@Transactional
class IncidenteService {
    def springSecurityService
     def dataSource
    
    def obtenerIncidentes(def tipo , def usuario) {
        def datos = []
        def consulta
        if (tipo == 'SinAsignar'){
            consulta = Incidente.executeQuery("SELECT t FROM Incidente t WHERE t.estatus = :estatus AND t.registradoPor = :user ",[estatus: Estatus.get(1 as long) , user: Usuario.findByUsername(usuario) ])
            consulta.each{
                def incidente = [:]
                incidente.id = it.id
                incidente.folio = it.folio
                incidente.fechaRegistro = it.fechaRegistro
                datos << incidente
            }
            return datos
        }else if(tipo == "Asignados"){            
            consulta = Incidente.executeQuery("SELECT t FROM Incidente t WHERE t.estatus = :estatus AND t.asignadoA = :user ",[estatus: Estatus.get(2 as long) , user: Usuario.findByUsername(usuario) ])
            consulta.each{
                def incidente = [:]
                incidente.id = it.id
                incidente.folio = it.folio
                incidente.descripcion = it.descripcion
                incidente.fechaAsignacion = it.fechaAsignacion
                incidente.registradoPor = it.registradoPor
                datos << incidente
            }
            return datos
        }
    }
    def obtenerUsuarios(def usuario){
        def datos = []
        def consulta = Usuario.executeQuery("SELECT u FROM Usuario u Where u.username <> '$usuario'")
        consulta.each{
            def user =[:]
            user.id = it.id
            user.username = it.username
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
        def query=("select id_ticket from Incidente  order by id_ticket desc limit 1 ")
        def sql = new Sql(dataSource)
        def resultado = sql.rows(query)
        def idt = resultado.id_ticket
        return idt
    }
    
    
}
