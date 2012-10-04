package spotlight.content

class SiteReport {
	static belongsTo = [sitedetail: SiteDetail]
	static hasMany = [tags: Tag]
	
	String reportName
	String reportcontent
	Date dateCreated
	Date lastUpdated
	Date publisheddate = new Date()
	

	static mapping ={
		reportcontent (type:"text")
		sort lastUpdated:"desc"
	}
	
	static constraints = {
		reportName (blank: false, unique: true, size: 8..100)
		reportcontent (blank: true)
		publisheddate (blank: false)
    }
	
/*	String toString() {
		return ReportName
	}*/
	
	String toString() {
		"Profile for ${reportName}"
	}
}
