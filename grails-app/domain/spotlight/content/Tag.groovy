package spotlight.content

class Tag {
	
	String tagname
	
	static hasMany = [sitereports: SiteReport]
	static belongsTo = [SiteReport]
	

    static constraints = {
		tagname (blank: true, unique: true, size: 4..100)
    }
	
	String toString() {
		return tagname
	}
}
