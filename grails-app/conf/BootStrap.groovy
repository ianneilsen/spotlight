import java.util.Date;

import spotlight.content.ReportSite
import spotlight.content.ReportProfile
import spotlight.content.Report


class BootStrap {

    def init = { servletContext ->
	
	def profile1 = new ReportProfile(sitehtml:"yes",siteemail:"ian@ian.com",sitecc:"ian@ian.com",siteadmin:"Ian Neilsen",
												sitefilestore:"home folder",sitecolor:"red",bugzillaproduct:"bugzilla product",bugzillacomponent:"bz component",
												rtqueue:"hss-rap",teamqueueemail:"hss-rap-list@redhat.com",etherpadurl:"http://url.com",siteupload:1).save(failOnError: true)
												
	def detail1 = new ReportSite(siteName:"Site 1",sdescription:"Site information about site",spublished:1,reportprofile:profile1)
		
	detail1.save(failOnError: true)
		
	def reportcontent1 = new Report(reportName:"Week 70 - Report 1", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"y",reportsite:detail1).save()
	def reportcontent2 = new Report(reportName:"Week 70 - Report 2", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"y",reportsite:detail1).save()
	def reportcontent3 = new Report(reportName:"Week 70 - Report 3", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"y",reportsite:detail1).save()
	def reportcontent4 = new Report(reportName:"Week 70 - Report 4", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"y",reportsite:detail1).save()
	def reportcontent5 = new Report(reportName:"Week 70 - Report 5", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"y",reportsite:detail1).save()
	def reportcontent6 = new Report(reportName:"Week 70 - Report 6", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"y",reportsite:detail1).save()
	def reportcontent7 = new Report(reportName:"Week 70 - Report 7", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"y",reportsite:detail1).save()
		
	def profile2 = new ReportProfile(sitehtml:"yes",siteemail:"ian@ian.com",sitecc:"ian@ian.com",siteadmin:"RAP Team",
			sitefilestore:"a folder",sitecolor:"blue",bugzillaproduct:"product",bugzillacomponent:"component",
			rtqueue:"hss",teamqueueemail:"hss-rap@redhat.com",etherpadurl:"http://someurl.com",siteupload:0).save(failOnError: true)
			
	def detail2 = new ReportSite(siteName:"Site 2", sdescription:"Site information about site 2", spublished:0, reportprofile:profile2)

	detail2.save(failOnError: true)

	def reportcontent8 = new Report(reportName:"Report 1", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"n",reportsite:detail2).save()
	def reportcontent9 = new Report(reportName:"Report 2", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"n",reportsite:detail2).save()
	def reportcontent10 = new Report(reportName:"Report 3", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"n",reportsite:detail2).save()
	def reportcontent11 = new Report(reportName:"Report 4", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"n",reportsite:detail2).save()
	def reportcontent12 = new Report(reportName:"Report 5", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"n",reportsite:detail2).save()
	def reportcontent13 = new Report(reportName:"Report 6", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"n",reportsite:detail2).save()
	def reportcontent14 = new Report(reportName:"Report 7", reportcontent: "this is the text of the report",publisheddate: new Date('08/10/2012'),published:"n",reportsite:detail2).save()
	
		}
    
	def destroy = {
    }
}