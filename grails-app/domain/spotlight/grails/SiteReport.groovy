package spotlight.grails

class SiteReport {
	static belongsTo = [sitedetail: SiteDetail]
	
	String reportname
	String reportcontent
	Date dateCreated
	Date lastUpdated

    static constraints = {
		reportname (blank: false, unique: true, size: 8..100)
		reportcontent (blank: true)
    }
	
	static mappings ={
		reportcontent (type: "text")
	}
}
