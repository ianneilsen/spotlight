package spotlight.content

class SiteReport {
	static belongsTo = [sitedetail: SiteDetail]
	static hasMany = [tags: Tag]
	
	String reportName
	String reportcontent
	Date publisheddate = new Date()
	String published
	Date dateCreated
	Date lastUpdated
	

	static mapping ={
		reportcontent (type:"text")
		

	}
	
	static constraints = {
		reportName (blank: false, unique: true, size: 8..100)
		reportcontent (blank: true)
		published (blank: false, inList: ["yes","no"])
		publisheddate (blank: false)
    }
	
/*	String toString() {
		return ReportName
	}*/
	
	String toString() {
		return reportName
	}
}
