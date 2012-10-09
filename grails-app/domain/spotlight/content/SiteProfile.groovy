package spotlight.content


class SiteProfile {
	static belongsTo = SiteDetail
		
	String sitehtml
	String siteemail
	String sitecc
	String siteadmin
	String sitefilestore
	String sitecolor
	String bugzillaproduct
	String bugzillacomponent
	String rtqueue
	String teamqueueemail
	String etherpadurl
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
		sitehtml (blank: true, inList: ["yes","no"])
		bugzillaproduct(blank: true, unique: true)
		bugzillacomponent(blank: true, unique: true)
		rtqueue (blank: true)
		teamqueueemail(blank: true,email: true)
		etherpadurl (nullable: true, url: true)
		
    }
	
	String toString() {
		return siteadmin
	}
}
