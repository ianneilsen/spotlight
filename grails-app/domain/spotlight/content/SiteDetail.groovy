package spotlight.content

class SiteDetail {
	static hasMany = [sitereports: SiteReport]
	SiteProfile siteprofile
		
	String sitename
	String sdescription
	Integer spublished
	Date dateCreated
	Date lastUpdated

    static constraints = {
		sitename (blank: false, size: 5..170, unique: true)
		sdescription (blank: false, size: 5..200)
		spublished (blank: false, inList:[1,0])
    }
	
	String toString() {
		sitename;
	}
	
	static mapping = {
		siteadmin lazy:false
		sitereport sort:"publisheddate"
	}
}
