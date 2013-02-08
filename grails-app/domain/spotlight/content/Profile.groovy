package spotlight.content


class Profile {
	static belongsTo = [portfolio:Portfolio]

		
/*	String htmlpuballowed*/    //todo find out why a html constraint will not load in a bidirectional relationship in another controller-view ie portfolio create action
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
/*	String siteupload*/
	Date dateCreated
	Date lastUpdated

    static constraints = {
		portfolioAdmin (blank: false, size: 4..80)
		portfolioEmail (blank: false, email: true)
		portfoliocc (blank: true, email: true)
		portfolioColor (blank: true)
/*        htmlpuballowed (blank: true, inList:["Yes","No"])*/
/*        siteupload (blank: true, inList:["Yes","No"])*/
        portfolioFilestore (blank: true)
		bugzillaproduct(blank: true)
		bugzillacomponent(blank: true)
		rtqueue (blank: true)
		teamqueueemail(blank: true,email: true)
		etherpadurl (blank: true, url: true)
		
    }
    static mapping = {
        autoTimestamp(true)
    }
	
	String toString() {
		portfolioAdmin
	}
}
