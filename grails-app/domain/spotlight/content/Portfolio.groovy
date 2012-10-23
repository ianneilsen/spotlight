package spotlight.content

class Portfolio {
	static hasMany = [publications: Publication]
	Profile profile
		
	String portfolioName
	String portdescrip
	Integer portpublished
	Date dateCreated
	Date lastUpdated
                      
    static constraints = {
        portfolioName (blank: false, size: 5..170, unique: true)
        portdescrip (blank: false, size: 5..200)
        portpublished (blank: false, inList:[1,0])
        //Profile (unique: true)
    }

    static mapping = {
        portfolioAdmin lazy:false
    }
	
	String toString() {
		PortfolioName
	}

}
