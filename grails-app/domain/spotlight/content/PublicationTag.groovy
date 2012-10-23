package spotlight.content

class PublicationTag {
	
	String pubtagname
	
	static belongsTo = [publications: Publication]
	
    static constraints = {
		pubtagname (blank: true, unique: true, size: 4..100)
    }
	
	String toString() {
		pubtagname
	}
}
