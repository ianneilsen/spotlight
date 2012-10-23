package spotlight.content


class Profile {
	static belongsTo = [portfolio: Portfolio]
		
	String portfoliohtml
	String portfolioEmail
	String portfoliocc
	String portfolioAdmin
	String portfolioFilestore
	String portfolioColor
	String bugzillaproduct
	String bugzillacomponent
	String rtqueue
	String teamqueueemail
	String etherpadurl
	Integer siteupload
	Date dateCreated
	Date lastUpdated

    static constraints = {
		portfolioAdmin (blank: false, size: 4..80)
		portfolioEmail (blank: false, email: true)
		portfoliocc (blank: true, email: true)
		portfolioColor (blank: true)
		portfoliohtml (blank: true, inList: ["Yes","No"])
        siteupload (blank: false, inList:[1,0])
        portfolioFilestore (blank: true)
		bugzillaproduct(blank: true, unique: true)
		bugzillacomponent(blank: true, unique: true)
		rtqueue (blank: true)
		teamqueueemail(blank: true,email: true)
		etherpadurl (nullable: true, url: true)
		
    }
	
	String toString() {
		portfolioAdmin
	}
}
