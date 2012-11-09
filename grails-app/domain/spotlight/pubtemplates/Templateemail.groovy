package spotlight.pubtemplates

import spotlight.content.Portfolio

class Templateemail {

    static belongsTo = [portfolio: Portfolio]

    String tplnameemail
    String tplcontentemail

    static constraints = {
        tplnameemail(blank: false, size: 4..100)
        tplcontentemail(blank: true, size: 2..1000)
    }
}
