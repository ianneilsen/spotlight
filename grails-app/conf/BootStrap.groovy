import java.util.Date;
import spotlight.content.Profile;
import spotlight.content.Portfolio;
import spotlight.content.Publication;
import spotlight.content.PublicationTag;
//import spotlight.content.Pubcategory;
import spotlight.content.Pubproduct
import spotlight.pubtemplates.Templatepublication
import java.sql.Timestamp;


class BootStrap {

    def init = { servletContext ->

        def portfolio = new Portfolio(portfolioName:"Project Management", portdescrip:"HSS PA teams project status reports.", portpublished:"Yes",dateCreated: new Date())
        portfolio.profile =  new Profile(/*htmlpuballowed:"No",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"Ian Neilsen",
                bugzillaproduct:"bz prod name",
                bugzillacomponent:"comp name",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"red",
                portfolioFilestore:"blah",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://url.com",
                dateCreated: new Date())
        portfolio.save(failOnError: true)

        def product1 =new Pubproduct(pubproduct: "Request Tracker").save()
        def product2 =new Pubproduct(pubproduct: "Errata Tool").save()
        def product3 =new Pubproduct(pubproduct: "Beaker").save()
        def product4 =new Pubproduct(pubproduct: "TCMS").save()

        def r1 = new Publication(publicationName:"RAP Weekly Executive Briefing -1", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (),pubproduct: product1)
        portfolio.addToPublications(r1)
        portfolio.save(failOnError: true)

        def r2 = new Publication(publicationName:"RAP Weekly Executive Briefing -2", publicationContent:"report content in markdown **bold** + bullet point",published:"No",publishedemail: "No", publisheddate: new Date (), pubproduct: product1)
        portfolio.addToPublications(r2)
        portfolio.save(failOnError: true)

    }


    def destroy = {
    }
}