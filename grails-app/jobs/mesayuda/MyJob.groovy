package mesayuda



class MyJob {
    def MailService
    static triggers = {
      simple repeatInterval: 5000 // execute job once in 5 seconds
    }

    def execute() {
        // execute job
//        MailService.sendMail {
//            to "jonathan.g.o.itt@gmail.com"
//            multipart true
//            from "neli1124.sc@gmail.com"
//            subject "correo quartz cada 5 s"
//            html "<h1>iquartz   </h1>"
//        }
        print "Job run!"
    }
}
