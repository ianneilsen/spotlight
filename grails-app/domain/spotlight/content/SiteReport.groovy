package spotlight.content

class SiteReport {
	static belongsTo = [sitedetail: SiteDetail]
	
	String reportname
	String reportcontent
	Date dateCreated
	Date lastUpdated
	Date publisheddate = new Date()

    static constraints = {
		reportname (blank: false, unique: true, size: 8..100)
		reportcontent (blank: true)
		publisheddate (blank: false)
    }
	
	static mapping ={
		reportcontent type: "text"
		sort lastUpdated:"desc"
	}
}
