package spotlight.content

class Report {
	static belongsTo = [reportsite: ReportSite]
	static hasMany = [tags: ReportTag]
	
	String reportName
	String reportcontent
	Date publisheddate = new Date()
	String published
	Date dateCreated
	Date lastUpdated
	

	static mapping ={
		reportcontent type:'text'
		
	}
	
	static constraints = {
		reportName (blank: false, unique: true, size: 8..100)
		reportcontent (blank: true)
		published (blank: false, inList: ["y","n"])
		publisheddate (blank: false)
    }
	
/*	String toString() {
		return ReportName
	}*/
	
	String toString() {
		return reportName
	}
}
