import java.util.Date;
import spotlight.content.Profile;
import spotlight.content.Portfolio;
import spotlight.content.Publication;
import spotlight.content.PublicationTag;
import spotlight.content.Pubproduct;
import spotlight.pubtemplates.Templatepublication;
import java.sql.Timestamp
import spotlight.pubtemplates.Emailtemplate;
import grails.util.GrailsUtil
import spotlight.Role;
import spotlight.User;
import spotlight.UserRole;


class BootStrap {

    def init = { servletContext ->

       /* environments {

            development {*/

                def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
                def siteRole = new Role(authority: 'ROLE_PORTFOLIOADMIN').save(flush: true)
                def publisherRole = new Role(authority: 'ROLE_PUBLISHER').save(flush: true)
                def userRole = new Role(authority: 'ROLE_USER').save(flush: true)


                def ineilsen = new User(username: 'ineilsen',useremail:'ineilsen@redhat.com',userfullname:'Ian Neilsen', enabled: true, password: 'passwordRH')
                ineilsen.save(flush: true)

               /* def mdoyle = new User(username: 'mdoyle', useremail:'mdoyle@redhat.com',userfullname:'Micheal Doyle',enabled: true, password: 'demomdoyle')
                mdoyle.save(flush:  true)

                def anross = new User(username: 'anross', useremail:'anross@redhat.com',userfullname:'Andrew Ross',enabled: true, password: 'demoanross')
                anross.save(flush: true)

                def alyoung = new User(username:'alyoung', useremail:'alyoung@redhat.com',userfullname: 'Alison Young',enabled: true, password: 'demoalyoung')
                alyoung.save(flush: true)*/

                /*def publisher = new User(username:'demopublisher', useremail:'ineilsen@redhat.com',userfullname: 'demopublisher',enabled: true, password: 'demopassword')
                publisher.save(flush: true)*/


                UserRole.create ineilsen, adminRole, true
              /*  UserRole.create mdoyle, siteRole, true
                UserRole.create anross, userRole, true
                UserRole.create alyoung, userRole, true*/
                /*UserRole.create publisher, publisherRole, true*/
                /*UserRole.create mdoyle, siteRole, true*/

              /*  assert User.count() == 5
                assert Role.count() == 4
                assert UserRole.count() == 6*/

    /*    def portfolio = new Portfolio(portfolioName:"Project Management", portdescrip:"HSS PA teams project status reports.", portpublished:"Yes",dateCreated: new Date(),status: "Active")
        portfolio.profile =  new Profile(*//*htmlpuballowed:"No",*//*
                portfolioEmail: "ian@ian.com",
                portfolioAdmin:"Ian Neilsen",
                bugzillaproduct:"bz prod name",
                bugzillacomponent:"comp name",
                *//*siteupload:1,*//*
                portfoliocc: "ian@ian.com",
                portfolioColor:"red",
                portfolioFilestore:"blah",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@ian.com",
                etherpadurl:"http://url.com",
                dateCreated: new Date())
        portfolio.save(failOnError: true)

        def product1 =new Pubproduct(pubproduct: "NA").save()
        def product2 =new Pubproduct(pubproduct: "Errata Tool").save()
        def product3 =new Pubproduct(pubproduct: "Beaker").save()
        def product4 =new Pubproduct(pubproduct: "RHEL").save()
        def product5 =new Pubproduct(pubproduct: "OpenShift").save()
        def product6 =new Pubproduct(pubproduct: "Mitai").save()
        def product7 =new Pubproduct(pubproduct: "Spotlight").save()
        def product8 =new Pubproduct(pubproduct: "p360").save()
        def product9 =new Pubproduct(pubproduct: "Publican").save()

        def r1 = new Publication(publicationName:"RAP Weekly Executive Briefing -1", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes",publishedemail: "No", publisheddate: new Date (),pubproduct: product1)
        portfolio.addToPublications(r1)
        r1.addToUsers(ineilsen)
        portfolio.save(failOnError: true)*/

      /*  def r2 = new Publication(publicationName:"RAP Weekly Executive Briefing -2", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product2)
        portfolio.addToPublications(r2)
        r2.addToUsers(ineilsen)
        portfolio.save(failOnError: true)

        def r3 = new Publication(publicationName:"RAP Weekly Executive Briefing - 3", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product3)
        portfolio.addToPublications(r3)
        r3.addToUsers(ineilsen)
        portfolio.save(failOnError: true)

        def r4 = new Publication(publicationName:"RAP Weekly Executive Briefing - 4", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes",publishedemail: "No", publisheddate: new Date (), pubproduct: product4)
        portfolio.addToPublications(r4)
        r4.addToUsers(ineilsen)
        portfolio.save(failOnError: true)

        def r5 = new Publication(publicationName:"RAP Weekly Executive Briefing - 5", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product5)
        portfolio.addToPublications(r5)
        r5.addToUsers(ineilsen)
        portfolio.save(failOnError: true)

        def r6 = new Publication(publicationName:"RAP Weekly Executive Briefing - 6", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product7)
        portfolio.addToPublications(r6)
        r6.addToUsers(ineilsen)
        portfolio.save(failOnError: true)*/

       /* def newEmailTemp = new Emailtemplate(nameemailtemplate:"email template", contentemailtemplate:"header of email\n header second line", toemailtemplate:"ineilsen@ian.com,ineilsen@ian.com",
                                             ccemailtemplate:"ineilsen@ian.com",footeremailtemplate:"footer of email template")
        portfolio.addToEmailtemplates(newEmailTemp)
        portfolio.save(failOnError: true)

        def newDocTemplate = new Templatepublication(tplnamepub:"temp 1",tplcontentpub:"content for template 1",tplshare:"No")
            portfolio.addToPublicationtemplates(newDocTemplate)
            portfolio.save(failOnError: true)
        def newDocTemplate2 = new Templatepublication(tplnamepub:"temp 2",tplcontentpub:"content for template 2",tplshare:"No")
        portfolio.addToPublicationtemplates(newDocTemplate2)
        portfolio.save(failOnError: true)
        def newDocTemplate3 = new Templatepublication(tplnamepub:"temp 3",tplcontentpub:"content for template 3",tplshare:"No")
        portfolio.addToPublicationtemplates(newDocTemplate3)
        portfolio.save(failOnError: true)*/


   /*         }//development context

    production {

            }//production context

        }//end of environment*/

    } //end of init serverletcontext


    def destroy = {
    }
}
