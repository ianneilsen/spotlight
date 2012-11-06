package spotlight.content

class Publication {

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

    static belongsTo = [portfolio: Portfolio]
    static hasMany = [pubtags: PublicationTag]
    Pubproduct pubproduct

	static constraints = {
		publicationName (blank: false, unique: true, size: 8..100)
		publicationContent (blank: true)
		published (blank: false, inList: ["No","Yes"])
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
