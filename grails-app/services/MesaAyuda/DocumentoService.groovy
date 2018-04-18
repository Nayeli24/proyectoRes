package MesaAyuda

import grails.transaction.Transactional
import static org.springframework.http.HttpStatus.*
import pruebaSeguridad.*
import groovy.sql.Sql

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
            docs << documento
        }
        return docs

    }
    
    
      def borrarArchivo(def name,def id){
          def nombre="Archivo_Incidente_"+id+"_"+name
          println "nombre archiv     o"    +nombre
        println Documento.executeUpdate("delete from Documento where nombre=':nombre'")
     
        def consulta = Documento.executeUpdate("delete from Documento where nombre='$nombre'")
        println "consulta::::::::::::::::::::::::::::...."+consulta

    }
    
}
