package spotlight.content

class ReportSite {
	static hasMany = [reports: Report]
	ReportProfile reportprofile
		
	String siteName
	String sdescription
	Integer spublished
	Date dateCreated
	Date lastUpdated
                      //TODO: check name mapping of sitename best practice
    static constraints = {
		siteName (blank: false, size: 5..170, unique: true)
		sdescription (blank: false, size: 5..200)
		spublished (blank: false, inList:[1,0])
        //ReportProfile unique: true - says to system that site can only have one unqiue profile
    }
	
	static mapping = {
		siteadmin lazy:false
        table 'ReportSite'
            siteName column: 'Site_Name'
		
	}
	
	String toString() {
		return siteName
	}

}
