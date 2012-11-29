package spotlight.content

class PublicationTag {

    static belongsTo = [publications: Publication]

	String pubtagname

    static constraints = {
		pubtagname (blank: true, unique: true, size: 4..100)
    }
/*    static mapping = {
        autoTimestamp(true)
    }*/
	
	String toString() {
		pubtagname
	}
}
