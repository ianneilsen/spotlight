package spotlight.content

import spotlight.pubtemplates.Templatepublication
import spotlight.pubtemplates.Emailtemplate

class Portfolio {
//    List publications = new ArrayList()
/*    SortedSet publications*/
	static hasMany = [publications:Publication, emailtemplates: Emailtemplate, publicationtemplates: Templatepublication]
    Profile profile
		
	String portfolioName
	String portdescrip
	String portpublished
	Date dateCreated
	Date lastUpdated
                      
    static constraints = {
        portfolioName (blank: false, size: 5..170, unique: true)
        portdescrip (blank: false, size: 5..200)
        portpublished (blank: false, inList:["No", "Yes"])
        //Profile (unique: true)
    }

    static mapping = {
        portfolioAdmin lazy:false
    }

    String toString() {
		portfolioName
	}

/*    def getPublicationsList() {
        return LazyList.decorate(
                publications,
                FactoryUtils.instantiateFactory(Publication.class))
    }*/
}
