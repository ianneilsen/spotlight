package spotlight.grails


class SiteAdmin {
		
	String sitehtml
	String siteemail
	String sitecc
	String siteadmin
	String sitefilestore
	String sitecolor
	Integer siteupload
	Date dateCreated
	Date lastUpdated
	

    static constraints = {
		siteadmin (blank: false, size: 4..80)
		siteemail (blank: false, email: true)
		sitecc (blank: true, email: true)
		sitefilestore (blank: true)
		siteupload (blank: false, inList:[1,0])
		sitecolor (blank: true)
		sitehtml (blank: true, inlist: ["yes","no"])
		
    }
}
