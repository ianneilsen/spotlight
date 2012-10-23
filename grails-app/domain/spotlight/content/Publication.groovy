package spotlight.content

class Publication {
	static belongsTo = [portfolio: Portfolio]
	static hasMany = [pubtags: PublicationTag]
	
	String publicationName
	String publicationContent
	Date publisheddate = new Date()
	String published
	Date dateCreated
	Date lastUpdated
	                    //TODO: check why content mapping not producing a text box - possibly twitter-bootstrap issue in publication.controller

	static mapping ={
		publicationContent type: "text"
        sort(lastUpdated:"desc")

	}
	
	static constraints = {
		publicationName (blank: false, unique: true, size: 8..100)
		publicationContent (blank: true)
		published (blank: false, inList: ["Yes","No"])
		publisheddate (blank: false)
        
    }

    String toString(){
        publicationName
    }
//return a substring of the publications content in the list view and show	
//	String toString() {
//		if(publicationContent.size()>20){
//            return publicationContent.substring(0,19);
//                   } else
//          return publicationContent;
//    }
    
}
