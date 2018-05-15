package mesayuda
import twitter4j.DirectMessage;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.Status;
import twitter4j.auth.AccessToken;
import pruebaSeguridad.IncidenteController;
import pruebaSeguridad.Incidente;
import pruebaSeguridad.Estatus;
import pruebaSeguridad.Usuario;


class MyJob {
    def MailService
    def grailsApplication
   
    static triggers = {      
        cron name: 'envioMensajeTweet', cronExpression: "0 10 * * * ?" 
    }

    def execute() {
        // execute job
        print "Job run!"
        def incidentes =Incidente.findAll();
        println incidentes
        def userList = []
        incidentes.each {
            def respuesta2 = [:]
            def id = it.id   
            if(it.estatus==Estatus.findByTipoEstatus("Asignado")){
                print"entro condicion incidente asignado"   
                String mensaje="Hola! El incidente con id ${id} que le fue asignado no ha sido atendido \n Darle atención a la brevedad \n Gracias!... http://172.16.0.105:8080/mesayuda/"
                TwitterFactory factory = new TwitterFactory()
                Twitter twitter = factory.getInstance()
                twitter.setOAuthConsumer(grailsApplication.config.twitter4j.default.OAuthConsumerKey,grailsApplication.config.twitter4j.default.OAuthConsumerSecret)
                AccessToken accessToken = new AccessToken(grailsApplication.config.twitter4j.default.OAuthAccessToken, grailsApplication.config.twitter4j.default.OAuthAccessTokenSecret)
                twitter.setOAuthAccessToken(accessToken) 
                def usuario= it.asignadoA.twitterName
        
                println "twitererrrr"+usuario
                try{
                    DirectMessage directMessage2 = twitter.sendDirectMessage(usuario, mensaje);
                    System.out.println("Tweet enviado!");
                } catch(TwitterException e){
                    System.out.println("Erro ao enviar o tweet");
                }
            }
        }
    }
}
