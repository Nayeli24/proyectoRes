package MesaAyuda

import grails.transaction.Transactional

@Transactional
class EmpresaService {
    def lista(){

        def empresa = Empresa.findAll();
        def empresaList = []
        empresa.each {
            if(it.enabled==true){
                def respuesta2 = [:]
                respuesta2.id=it.id
                respuesta2.nombreEmpresa=it.nombreEmpresa
                empresaList << respuesta2
            }       
        }
        println empresaList
     return empresaList
    }
}
