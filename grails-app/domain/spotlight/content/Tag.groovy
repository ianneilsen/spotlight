package spotlight.content

class Tag {
	
	String tagname
	
	static belongsTo = [reports: SiteReport]
	
	

    static constraints = {
		tagname (blank: true, unique: true, size: 4..100)
    }
	
	String toString() {
		return tagname
	}
}
