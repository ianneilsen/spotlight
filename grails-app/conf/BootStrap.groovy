import java.util.Date;
import spotlight.content.Profile;
import spotlight.content.Portfolio;
import spotlight.content.Publication;
import spotlight.content.PublicationTag;
import spotlight.content.Pubcategory;
import spotlight.content.Pubproduct;


class BootStrap {

    def init = { servletContext ->

        def portfolio = new Portfolio(portfolioName:"Portfolio 1", portdescrip:"portfolio descrition field", portpublished:1)
        portfolio.profile =  new Profile(portfoliohtml:"No",
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"Ian Neilsen",
                bugzillaproduct:"bz prod name",
                bugzillacomponent:"comp name",
                siteupload:1,
                portfoliocc: "ian@ian.com",
                portfolioColor:"red",
                portfolioFilestore:"blah",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://url.com",)
        portfolio.save(failOnError: true)

        def portfolio2 = new Portfolio(portfolioName:"Portfolio 2", portdescrip:"portfolio2 descrition field", portpublished:1)
        portfolio2.profile =  new Profile(portfoliohtml:"Yes",
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo",
                bugzillaproduct:"bz name",
                bugzillacomponent:"component name",
                siteupload:1,
                portfoliocc: "ian@ian.com",
                portfolioColor:"blue",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio2.save(failOnError: true)

        def portfolio3 = new Portfolio(portfolioName:"Portfolio 3", portdescrip:"portfolio3 descrition field", portpublished:0)
        portfolio3.profile =  new Profile(portfoliohtml:"No",
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo",
                bugzillaproduct:"bugzilla prod",
                bugzillacomponent:"1",
                siteupload:1,
                portfoliocc: "ian@ian.com",
                portfolioColor:"pink",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio3.save(failOnError: true)

        def portfolio4 = new Portfolio(portfolioName:"Portfolio 4", portdescrip:"portfolio4 descrition field", portpublished:1)
        portfolio4.profile =  new Profile(portfoliohtml:"Yes",
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo",
                bugzillaproduct:"12378",
                bugzillacomponent:"999987",
                siteupload:1,
                portfoliocc: "ian@ian.com",
                portfolioColor:"black",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio4.save(failOnError: true)

        def r1 = new Publication(publicationName:"RAP Weekly Executive Briefing -1", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio).save(failOnError: true)
        def r2 = new Publication(publicationName:"RAP Weekly Executive Briefing -2", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio).save(failOnError: true)
        def r3 = new Publication(publicationName:"RAP Weekly Executive Briefing -3", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio).save(failOnError: true)
        def r4 = new Publication(publicationName:"RAP Weekly Executive Briefing -4", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio).save(failOnError: true)
        def r5 = new Publication(publicationName:"RAP Weekly Executive Briefing -5", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio).save(failOnError: true)
        def r6 = new Publication(publicationName:"RAP Weekly Executive Briefing -6", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio).save(failOnError: true)
        def r7 = new Publication(publicationName:"RAP Weekly Executive Briefing -7", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2).save(failOnError: true)
        def r8 = new Publication(publicationName:"RAP Weekly Executive Briefing -8", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2).save(failOnError: true)
        def r9 = new Publication(publicationName:"RAP Weekly Executive Briefing -9", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2).save(failOnError: true)
        def r10 = new Publication(publicationName:"RAP Weekly Executive Briefing -10", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2).save(failOnError: true)
        def r11 = new Publication(publicationName:"RAP Weekly Executive Briefing -11", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2).save(failOnError: true)
        def r12 = new Publication(publicationName:"RAP Weekly Executive Briefing -12", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2).save(failOnError: true)
        def r13 = new Publication(publicationName:"RAP Weekly Executive Briefing -13", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3).save(failOnError: true)
        def r14 = new Publication(publicationName:"RAP Weekly Executive Briefing -14", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3).save(failOnError: true)
        def r15 = new Publication(publicationName:"RAP Weekly Executive Briefing -15", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3).save(failOnError: true)
        def r16 = new Publication(publicationName:"RAP Weekly Executive Briefing -16", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3).save(failOnError: true)
        def r17 = new Publication(publicationName:"RAP Weekly Executive Briefing -17", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3).save(failOnError: true)
        def r18 = new Publication(publicationName:"RAP Weekly Executive Briefing -18", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3).save(failOnError: true)



    }


    def destroy = {
    }
}