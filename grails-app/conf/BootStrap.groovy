import java.util.Date;

import spotlight.grails.SiteDetail
import spotlight.grails.SiteAdmin
import spotlight.grails.SiteReport


class BootStrap {

    def init = { servletContext ->
		def firstsitedetail = new SiteDetail(sitename:"First site1 test name",
										sdescription:"some text about site keep it brief",
										spublished:1,
										dateCreated:new Date()).save()
										
		def firstsiteadmin= new SiteAdmin(sitehtml:"yes",
			siteemail:"ian.neilsen@gmail.com",
			sitecc:"ian.neilsen@gmail.com",
			siteadmin:"ianneilsen",
			sitefilestore:"",
			sitecolor:"aaoo6",
			siteupload:1).save()
			
		def reportcontent = new SiteReport(reportname:"Site1- report1",reportcontent:"this is the text of the report").save()
    }
    
	def destroy = {
    }
}