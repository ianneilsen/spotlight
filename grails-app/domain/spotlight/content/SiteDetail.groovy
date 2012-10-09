package spotlight.content

class SiteDetail {
	static hasMany = [reports: SiteReport]
	SiteProfile siteprofile
		
	String siteName
	String sdescription
	Integer spublished
	Date dateCreated
	Date lastUpdated

    static constraints = {
		siteName (blank: false, size: 5..170, unique: true)
		sdescription (blank: false, size: 5..200)
		spublished (blank: false, inList:[1,0])
    }
	
	static mapping = {
		siteadmin lazy:false
		
	}
	
	String toString() {
		return siteName
	}
}
