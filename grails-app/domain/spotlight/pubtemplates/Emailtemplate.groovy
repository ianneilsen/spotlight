package spotlight.pubtemplates

import spotlight.content.Portfolio

class Emailtemplate {

    static belongsTo = [portfolio: Portfolio]

    String nameemailtemplate
    String contentemailtemplate
    String toemailtemplate
    String ccemailtemplate
    String footeremailtemplate

    static constraints = {
        nameemailtemplate(blank: false, size: 4..100)
        toemailtemplate(blank: false, size: 2..250)
        ccemailtemplate(blank: true, size: 2..250)
        contentemailtemplate(blank: true, size: 2..500)
        footeremailtemplate(blank: true, size: 2..500)
    }
}
