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


class MyJob {
    def MailService
    def grailsApplication
   
    static triggers = {      
        cron name: 'envioMensajeTweet', cronExpression: "0 10 10 * * ?" 
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
                String mensaje="Holaa mensaje conQuartz con id ${id} desde el domain de incidente\n Suerte ;)!"
                TwitterFactory factory = new TwitterFactory()
                Twitter twitter = factory.getInstance()
                twitter.setOAuthConsumer(grailsApplication.config.twitter4j.default.OAuthConsumerKey,grailsApplication.config.twitter4j.default.OAuthConsumerSecret)
                AccessToken accessToken = new AccessToken(grailsApplication.config.twitter4j.default.OAuthAccessToken, grailsApplication.config.twitter4j.default.OAuthAccessTokenSecret)
                twitter.setOAuthAccessToken(accessToken) 
                try{
                    DirectMessage directMessage2 = twitter.sendDirectMessage('_B_Lazlo', mensaje);
                    System.out.println("Tweet enviado!");
                } catch(TwitterException e){
                    System.out.println("Erro ao enviar o tweet");
                }
            }
        }
    }
}
