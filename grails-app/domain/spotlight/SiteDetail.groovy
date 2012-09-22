package spotlight

class SiteDetail {
	static hasOne = [sitesummary: SiteSummary]
	
	String sitename
	String sitedescrip
	Integer sitepublished

    static constraints = {
		sitename (blank: false, size: 5..170)
		sitedescrip (blank: false, size: 5..200)
		sitepublished (nullable: false)
    }
}
