
package spotlight.pubtemplates

import spotlight.content.Portfolio

class Templatepublication {

    static belongsTo = [portfolio: Portfolio]

    String tplnamepub
    String tplcontentpub

    static constraints = {
        tplnamepub(blank: false, size: 4..100)
        tplcontentpub(blank: true, size: 2..2000)
    }
    String toString() {
        tplnamepub
    }
}