import java.util.Date;

import spotlight.content.SiteDetail
import spotlight.content.SiteProfile
import spotlight.content.SiteReport


class BootStrap {

    def init = { servletContext ->
		def firstsitedetail = new SiteDetail(sitename:"Entitlement",
										sdescription:"some text about site keep it brief",
										spublished:1).save()
																			
		def firstsiteadmin= new SiteProfile(sitehtml:"yes",
			siteemail:"ian.neilsen@redhat.com",
			sitecc:"ian.neilsen@redhat.com",
			siteadmin:"Ian Neilsen",
			sitefilestore:"dir location",
			sitecolor:"AA0006",
			siteupload:1).save()
			
		def reportcontent = new SiteReport(reportname:"Week 70 - Report 1", reportcontent: "this is the text of the report").save()
    }
    
	def destroy = {
    }
}