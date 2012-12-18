import java.util.Date;
import spotlight.content.Profile;
import spotlight.content.Portfolio;
import spotlight.content.Publication;
import spotlight.content.PublicationTag;
//import spotlight.content.Pubcategory;
import spotlight.content.Pubproduct
import spotlight.pubtemplates.Templatepublication
import java.sql.Timestamp
import spotlight.pubtemplates.Emailtemplate;


class BootStrap {

    def init = { servletContext ->

        def portfolio = new Portfolio(portfolioName:"Project Management", portdescrip:"HSS PA teams project status reports.", portpublished:"Yes",dateCreated: new Date(),status: "Active")
        portfolio.profile =  new Profile(/*htmlpuballowed:"No",*/
                portfolioEmail: "ian@ian.com",
                portfolioAdmin:"Ian Neilsen",
                bugzillaproduct:"bz prod name",
                bugzillacomponent:"comp name",
                /*siteupload:1,*/
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

        def r1 = new Publication(publicationName:"RAP Weekly Executive Briefing -1", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (),pubproduct: product1)
        portfolio.addToPublications(r1)
        portfolio.save(failOnError: true)

        def r2 = new Publication(publicationName:"RAP Weekly Executive Briefing -2", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product2)
        portfolio.addToPublications(r2)
        portfolio.save(failOnError: true)

        def r3 = new Publication(publicationName:"RAP Weekly Executive Briefing - 3", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product3)
        portfolio.addToPublications(r3)
        portfolio.save(failOnError: true)

        def r4 = new Publication(publicationName:"RAP Weekly Executive Briefing - 4", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product4)
        portfolio.addToPublications(r4)
        portfolio.save(failOnError: true)

        def r5 = new Publication(publicationName:"RAP Weekly Executive Briefing - 5", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product5)
        portfolio.addToPublications(r5)
        portfolio.save(failOnError: true)

        def r6 = new Publication(publicationName:"RAP Weekly Executive Briefing - 6", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product7)
        portfolio.addToPublications(r6)
        portfolio.save(failOnError: true)

        def newEmailTemp = new Emailtemplate(nameemailtemplate:"email template", contentemailtemplate:"header of email\n header second line", toemailtemplate:"ineilsen@ian.com,ineilsen@ian.com",
                                             ccemailtemplate:"ineilsen@ian.com",footeremailtemplate:"footer of email template")
        portfolio.addToEmailtemplates(newEmailTemp)
        portfolio.save(failOnError: true)

    }


    def destroy = {
    }
}
