package spotlight.content

import java.sql.Timestamp
import spotlight.User
import spotlight.comments.Authorcomment

class Publication  {

    static belongsTo = [portfolio: Portfolio]
    static hasMany = [pubtags: PublicationTag, authors: User, comments: Authorcomment]
    Pubproduct pubproduct


    String publicationName
	String publicationContent
	Date publisheddate = new Date()
    String publishedemail
	String published
	Date dateCreated
	Date lastUpdated

	static mapping ={
		publicationContent type: "text"
        sort published: "desc"
        autoTimestamp(true)
    }

	static constraints = {
		publicationName (blank: false, unique: true, size: 8..100)
		publicationContent (blank: true)
		published (blank: false, inList: ["Draft","Review","Yes","Shared"])
		publisheddate (blank: false)
        publishedemail(blank: false, inList: ["No","Yes"])
    }

    String toString(){
        publicationName
    }

}
