package spotlight

class SiteSummary {
	static belongsTo = [sitedetail: SiteDetail]
	
	String adminaddr
	String ccaddr
	Integer htmlflag
	String siteadmin
	String sitepad
	

    static constraints = {
		adminaddr (blank: false, email: true)
		ccaddr (blank: false, email: true )
		htmlflag (blank: false, attributes: [onof: 0..1])
		siteadmin (blank: false, size: 4..50)
		sitepad (url: true)
    }
}
