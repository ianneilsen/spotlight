package spotlight.comments

import spotlight.content.Publication
import spotlight.User

class Authorcomment {

    static belongsTo = [publications:Publication]
    static hasMany = [authors: User]

    String authorcomments
    Date dateCreated

    static constraints = {
        authorcomments()
        dateCreated()
    }

    String toString(){
        authorcomments
    }
}

