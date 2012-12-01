package spotlight.content

import spotlight.pubtemplates.Templatepublication
import spotlight.pubtemplates.Emailtemplate
import java.sql.Timestamp

class Portfolio {

/*    SortedSet publications*/
//    List publications //= new ArrayList();
    static hasMany = [publications: Publication, emailtemplates: Emailtemplate, publicationtemplates: Templatepublication]
    Profile profile
		
	String portfolioName
	String portdescrip
	String portpublished
	Date dateCreated
	Date lastUpdated
    String status
                      
    static constraints = {
        portfolioName (blank: false, size: 5..170, unique: true)
        portdescrip (blank: false, size: 5..200)
        portpublished (blank: false, inList:["No", "Yes"])
        status(blank: false, inList: ["Active","Closed"])
        //Profile (unique: true)
    }

    static mapping = {
        portfolioAdmin lazy:false
        autoTimestamp(true)

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
