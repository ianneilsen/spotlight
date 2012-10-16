package spotlight.content

class Report {
	static belongsTo = [reportsite: ReportSite]
	static hasMany = [tags: ReportTag]
	
	String reportName
	String reportcontent
	Date publisheddate = new Date()
	String published
	Date dateCreated
	Date lastUpdated
	                    //TODO: check why content mapping not producing a text box - possibly twitter-bootstrap issue in report.controller

	static mapping ={
		reportcontent type: 'text'
        table 'Report'
        reportSite_Id column: 'Report_Site_Id'
		
	}
	
	static constraints = {
		reportName (blank: false, unique: true, size: 8..100)
		reportcontent (blank: true)
		published (blank: false, inList: ["Yes","No"])
		publisheddate (blank: false)
        
    }

    String toString(){
        reportName
    }
//return a substring of the reports content in the list view and show	
//	String toString() {
//		if(reportcontent.size()>20){
//            return reportcontent.substring(0,19);
//                   } else
//          return reportcontent;
//    }
    
}
