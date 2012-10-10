package spotlight.content

class ReportTag {
	
	String tagname
	
	static belongsTo = [reports: Report]
	
	

    static constraints = {
		tagname (blank: true, unique: true, size: 4..100)
    }
	
	String toString() {
		return tagname
	}
}
