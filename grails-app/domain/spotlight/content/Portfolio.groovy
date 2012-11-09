package spotlight.content

import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;
import spotlight.content.Publication
import spotlight.pubtemplates.Templateemail
import spotlight.pubtemplates.Templatepublication

class Portfolio {
//    List publications = new ArrayList()
/*    SortedSet publications*/
	static hasMany = [publications:Publication, templatesemail: Templateemail, templatespublications: Templatepublication]
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
