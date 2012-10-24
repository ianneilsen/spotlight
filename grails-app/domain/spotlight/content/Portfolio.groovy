package spotlight.content

import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;
import spotlight.content.Publication

class Portfolio {
//    List publications = new ArrayList()
	static hasMany = [publications:Publication]
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
		portfolioName
	}

/*    def getPublicationsList() {
        return LazyList.decorate(
                publications,
                FactoryUtils.instantiateFactory(Publication.class))
    }*/
}
