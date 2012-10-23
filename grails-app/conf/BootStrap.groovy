import java.util.Date;

import spotlight.content.Profile
import spotlight.content.Portfolio
import spotlight.content.Publication



class BootStrap {

    def init = { servletContext ->

        def profile1 = new Profile(portfoliohtml:"Yes",portfolioEmail:"ian@ian.com",portfoliocc:"ian@ian.com",portfolioAdmin:"Ian Neilsen",
                portfolioFilestore:"home folder",portfolioColor:"red",bugzillaproduct:"bugzilla product",bugzillacomponent:"bz component",
                rtqueue:"hss-rap",teamqueueemail:"hss-rap-list@redhat.com",etherpadurl:"http://url.com",siteupload:1).save(failOnError: true)

        def detail1 = new Portfolio(portfolioName:"Site 1",portdescrip:"Site information about site",portpublished:1,portfolioprofile:  profile1).save(failOnError: true)

        def reportcontent1 = new Publication(publicationName:"Week 70 - Report 1", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"Yes",portfolio:detail1).save()
        def reportcontent2 = new Publication(publicationName:"Week 70 - Report 2", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"Yes",portfolio:detail1).save()
        def reportcontent3 = new Publication(publicationName:"Week 70 - Report 3", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"Yes",portfolio:detail1).save()
        def reportcontent4 = new Publication(publicationName:"Week 70 - Report 4", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"Yes",portfolio:detail1).save()
        def reportcontent5 = new Publication(publicationName:"Week 70 - Report 5", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"Yes",portfolio:detail1).save()
        def reportcontent6 = new Publication(publicationName:"Week 70 - Report 6", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"Yes",portfolio:detail1).save()
        def reportcontent7 = new Publication(publicationName:"Week 70 - Report 7", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"Yes",portfolio:detail1).save()

        def profile2 = new Profile(portfoliohtml:"No",portfolioEmail:"ian@ian.com",portfoliocc:"ian@ian.com",portfolioAdmin:"RAP Team",
                portfolioFilestore:"a folder",portfolioColor:"blue",bugzillaproduct:"product",bugzillacomponent:"component",
                rtqueue:"hss",teamqueueemail:"hss-rap@redhat.com",etherpadurl:"http://someurl.com",siteupload:0).save(failOnError: true)

        def detail2 = new Portfolio(portfolioName:"Site 2", portdescrip:"Site information about site 2", portpublished:0, portfolioprofile: profile2).save(failOnError: true)

        def reportcontent8 = new Publication(publicationName:"Report 1", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"No",portfolio:detail2).save()
        def reportcontent9 = new Publication(publicationName:"Report 2", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"No",portfolio:detail2).save()
        def reportcontent10 = new Publication(publicationName:"Report 3", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"No",portfolio:detail2).save()
        def reportcontent11 = new Publication(publicationName:"Report 4", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"No",portfolio:detail2).save()
        def reportcontent12 = new Publication(publicationName:"Report 5", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"No",portfolio:detail2).save()
        def reportcontent13 = new Publication(publicationName:"Report 6", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"No",portfolio:detail2).save()
        def reportcontent14 = new Publication(publicationName:"Report 7", publicationContent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"No",portfolio:detail2).save()

        def profile3 = new Profile(portfoliohtml:"No",portfolioEmail:"ian@redhat.com",portfoliocc:"ian@redhat.com",portfolioAdmin:"Docs QE Team",
                portfolioFilestore:"a folder",portfolioColor:"green",bugzillaproduct:"product2",bugzillacomponent:"component2",
                rtqueue:"hss-rap",teamqueueemail:"hss-rap-list@redhat.com",etherpadurl:"http://someurl.com",siteupload:0).save(failOnError: true)

        def detail3 = new Portfolio(portfolioName:"Site 3 - Entitlement", portdescrip:"Site information about site 3 entitlement", portpublished:1, portfolioprofile: profile3).save(failOnError: true)

        def reportcontent15 = new Publication(publicationName:"Entitlement Weekly Executive Briefing - Week 40", publicationContent: "this is the text of the report for the report but a little longer than the others",publisheddate: new Date('08/10/2012'),published:"No",portfolio:detail3).save()
        def reportcontent16 = new Publication(publicationName:"Entitlement Weekly Executive Briefing - Week 41", publicationContent: "this is the text of the report for the report but a little longer than the others",publisheddate: new Date('09/10/2012'),published:"No",portfolio:detail3).save()
        def reportcontent17 = new Publication(publicationName:"Entitlement Weekly Executive Briefing - Week 42", publicationContent: "this is the text of the report for the report but a little longer than the others",publisheddate: new Date('10/10/2012'),published:"No",portfolio:detail3).save()
        def reportcontent18 = new Publication(publicationName:"Entitlement Weekly Executive Briefing - Week 43", publicationContent: "this is the text of the report for the report but a little longer than the others",publisheddate: new Date('11/10/2012'),published:"No",portfolio:detail3).save()
        def reportcontent19 = new Publication(publicationName:"Entitlement Weekly Executive Briefing - Week 44", publicationContent: "this is the text of the report for the report but a little longer than the others",publisheddate: new Date('12/10/2012'),published:"No",portfolio:detail3).save()
        def reportcontent20 = new Publication(publicationName:"Entitlement Weekly Executive Briefing - Week 45", publicationContent: "this is the text of the report for the report but a little longer than the others",publisheddate: new Date('13/10/2012'),published:"No",portfolio:detail3).save()
        def reportcontent21 = new Publication(publicationName:"Entitlement Weekly Executive Briefing - Week 46", publicationContent: "this is the text of the report for the report but a little longer than the others",publisheddate: new Date('14/10/2012'),published:"No",portfolio:detail3).save()


    }
    
	def destroy = {
    }
}