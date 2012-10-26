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

	static mapping ={
		publicationContent type: "text"
        sort(lastUpdated: "asc")
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
