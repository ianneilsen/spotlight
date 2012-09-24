package spotlight.grails

class SiteDetail {
	static hasOne = SiteAdmin
	
	String sitename
	String sdescription
	Integer spublished

    static constraints = {
		sitename (blank: false, size: 5..170)
		sdescription (blank: false, size: 5..200)
		spublished ()
    }
}
