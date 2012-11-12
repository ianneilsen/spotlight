import java.util.Date;
import spotlight.content.Profile;
import spotlight.content.Portfolio;
import spotlight.content.Publication;
import spotlight.content.PublicationTag;
//import spotlight.content.Pubcategory;
import spotlight.content.Pubproduct;


class BootStrap {

    def init = { servletContext ->

        def portfolio = new Portfolio(portfolioName:"Project Management", portdescrip:"HSS PA teams project status reports.", portpublished:"Yes")
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
                etherpadurl:"http://url.com",)
        portfolio.save(failOnError: true)

        def portfolio2 = new Portfolio(portfolioName:"QE OpenShift", portdescrip:"OpenShift QE sprint reports.", portpublished:"No")
        portfolio2.profile =  new Profile(/*htmlpuballowed:"Yes",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo",
                bugzillaproduct:"bz name",
                bugzillacomponent:"component name",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"blue",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio2.save(failOnError: true)

        def portfolio3 = new Portfolio(portfolioName:"RAP team", portdescrip:"RAP team weekly status reports.", portpublished:"Yes")
        portfolio3.profile =  new Profile(/*htmlpuballowed:"No",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo",
                bugzillaproduct:"bugzilla prod",
                bugzillacomponent:"1",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"pink",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio3.save(failOnError: true)

        def portfolio4 = new Portfolio(portfolioName:"HSS Product Reports", portdescrip:"HSS product reports delivered weekly every monday.", portpublished:"Yes")
        portfolio4.profile =  new Profile(/*htmlpuballowed:"Yes",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo",
                bugzillaproduct:"12378",
                bugzillacomponent:"999987",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"black",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio4.save(failOnError: true)

        def portfolio5 = new Portfolio(portfolioName:"IED - NAY", portdescrip:"IED team from China, weekly status reports.", portpublished:"Yes")
        portfolio5.profile =  new Profile(/*htmlpuballowed:"Yes",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo",
                bugzillaproduct:"123785",
                bugzillacomponent:"9999587",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"black",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio5.save(failOnError: true)

        def portfolio6 = new Portfolio(portfolioName:"Docs QE", portdescrip:"Weekly status reports by the Docs QE team - Brisbane.", portpublished:"Yes")
        portfolio6.profile =  new Profile(/*htmlpuballowed:"Yes",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neil6o",
                bugzillaproduct:"123768",
                bugzillacomponent:"9997987",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"black",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio6.save(failOnError: true)

        def portfolio7 = new Portfolio(portfolioName:"Eng-Ops", portdescrip:"Weekly engineering operations reports.", portpublished:"Yes")
        portfolio7.profile =  new Profile(/*htmlpuballowed:"Yes",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neil7o",
                bugzillaproduct:"123778",
                bugzillacomponent:"99977987",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"black",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio7.save(failOnError: true)

        def portfolio54 = new Portfolio(portfolioName:"Entitlement QE", portdescrip:"weekly reports by the Entitlement QE team.", portpublished:"Yes")
        portfolio54.profile =  new Profile(/*htmlpuballowed:"Yes",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo5555",
                bugzillaproduct:"12378555",
                bugzillacomponent:"9999875555",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"black",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio54.save(failOnError: true)

        def portfolio24 = new Portfolio(portfolioName:"Product Retrospectives", portdescrip:"Product retrospectives following release cycles by PA team.", portpublished:"Yes")
        portfolio24.profile =  new Profile(/*htmlpuballowed:"Yes",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo22",
                bugzillaproduct:"12378222",
                bugzillacomponent:"999987222",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"black",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio24.save(failOnError: true)

        def portfolio74 = new Portfolio(portfolioName:"SAM QE", portdescrip:"Weekly reports by the SAM QE team.", portpublished:"Yes")
        portfolio74.profile =  new Profile(/*htmlpuballowed:"Yes",*/
                portfolioEmail: "ian@redhat.com",
                portfolioAdmin:"neilo77",
                bugzillaproduct:"1237874",
                bugzillacomponent:"99998747",
                /*siteupload:1,*/
                portfoliocc: "ian@ian.com",
                portfolioColor:"black",
                portfolioFilestore:"where are your files",
                rtqueue:"hss-rap",
                teamqueueemail:"hss-rap@redhat.com",
                etherpadurl:"http://etherpad.url.com",)
        portfolio74.save(failOnError: true)


        def product1 =new Pubproduct(pubproduct: "Request Tracker").save()
        def product2 =new Pubproduct(pubproduct: "Errata Tool").save()
        def product3 =new Pubproduct(pubproduct: "Beaker").save()
        def product4 =new Pubproduct(pubproduct: "TCMS").save()

        def r1 = new Publication(publicationName:"RAP Weekly Executive Briefing -1", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio, pubproduct: product1)

                .save(failOnError: true)
        def r2 = new Publication(publicationName:"RAP Weekly Executive Briefing -2", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio, pubproduct: product1)

                .save(failOnError: true)
        def r3 = new Publication(publicationName:"RAP Weekly Executive Briefing -3", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio, pubproduct: product1)

                .save(failOnError: true)
        def r4 = new Publication(publicationName:"RAP Weekly Executive Briefing -4", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio, pubproduct: product1)
                .save(failOnError: true)
        def r5 = new Publication(publicationName:"RAP Weekly Executive Briefing -5", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio, pubproduct: product2)
                .save(failOnError: true)
        def r6 = new Publication(publicationName:"RAP Weekly Executive Briefing -6", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio, pubproduct: product2).save(failOnError: true)
        def r7 = new Publication(publicationName:"RAP Weekly Executive Briefing -7", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio2, pubproduct: product2).save(failOnError: true)
        def r8 = new Publication(publicationName:"RAP Weekly Executive Briefing -8", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio2, pubproduct: product2).save(failOnError: true)
        def r9 = new Publication(publicationName:"RAP Weekly Executive Briefing -9", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2, pubproduct: product2).save(failOnError: true)
        def r10 = new Publication(publicationName:"RAP Weekly Executive Briefing -10", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2, pubproduct: product3).save(failOnError: true)
        def r11 = new Publication(publicationName:"RAP Weekly Executive Briefing -11", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio2, pubproduct: product3).save(failOnError: true)
        def r12 = new Publication(publicationName:"RAP Weekly Executive Briefing -12", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio2, pubproduct: product3).save(failOnError: true)
        def r13 = new Publication(publicationName:"RAP Weekly Executive Briefing -13", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio3, pubproduct: product3).save(failOnError: true)
        def r14 = new Publication(publicationName:"RAP Weekly Executive Briefing -14", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3, pubproduct: product4).save(failOnError: true)
        def r15 = new Publication(publicationName:"RAP Weekly Executive Briefing -15", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3, pubproduct: product4).save(failOnError: true)
        def r16 = new Publication(publicationName:"RAP Weekly Executive Briefing -16", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio3, pubproduct: product4).save(failOnError: true)
        def r17 = new Publication(publicationName:"RAP Weekly Executive Briefing -17", publicationContent:"report content in markdown **bold** + bullet point",published:"No", publisheddate: new Date (2012-10-24),portfolio: portfolio3, pubproduct: product4).save(failOnError: true)
        def r18 = new Publication(publicationName:"RAP Weekly Executive Briefing -18", publicationContent:"report content in markdown **bold** + bullet point",published:"Yes", publisheddate: new Date (2012-10-24),portfolio: portfolio3, pubproduct: product4).save(failOnError: true)



    }


    def destroy = {
    }
}