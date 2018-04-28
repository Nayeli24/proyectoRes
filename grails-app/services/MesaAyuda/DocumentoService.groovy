package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql
import java.sql.*

@Transactional
class DocumentoService {
    def dataSource
    def listarDocumentos(def incidente) {
      
        def consulta
        def docs=[] 
        consulta = Documento.executeQuery("SELECT d FROM Documento d WHERE d.incidente = :inc order by id_documento desc",[inc: Incidente.findById(incidente)],[offset:0, max:5])
        println "consulta::::::::::::::::::::::::::::...."+consulta
        consulta.each{
            def documento = [:]
            documento.id = it.id
            documento.incidente = it.incidente.tema
            documento.nombre = it.nombre
            documento.urlArchivo=it.urlArchivo
            documento.fechaSubio=it.fechaSubio
            documento.usuario=it.usuario 

            docs << documento
        }
        return docs

    }
    
    
    def borrarArchivo(def name){
        println "name:::::::::$name"
        def consulta = Documento.executeUpdate("delete from Documento where nombre='"+name+"'")
        //def consulta = Documento.executeUpdate("delete from Documento where nombre='Achivo_Incidente_7_Red_Hat_JBoss_Fuse-6.2.1-Fabric_Guide-en-US.pdf'")
        println "consulta::::::::::::::::::::::::::::...."+consulta

    }
    
}
