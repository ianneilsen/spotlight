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
        sort(lastUpdated: 'desc')

    }

    String toString() {
		portfolioName
	}


/*    static final String path = "web-app/portfolioImages"; //<-- generic path on your SERVER!
//Conf.config.rootPath+"images"

static{
    //static initializer to make sure directory gets created.  Better ways to do this but this will work!

    File pathAsFile = new File(path).mkdirs()

    if (pathAsFile.exists()){
        println("CREATED REPORT DIRECTORY @ ${pathAsFile.absolutePath}");
    }else{
        println("FAILED TO CREATE REPORT DIRECTORY @ ${pathAsFile.absolutePath}");
    }

}*/
}
