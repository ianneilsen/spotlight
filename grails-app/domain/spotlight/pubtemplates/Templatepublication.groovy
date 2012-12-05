
package spotlight.pubtemplates

import spotlight.content.Portfolio
import spotlight.content.Publication

class Templatepublication {

    static belongsTo = [portfolio: Portfolio]

    String tplnamepub
    String tplcontentpub
    String tplshare

    static constraints = {
        tplnamepub(blank: false, size: 4..100)
        tplcontentpub(blank: true, size: 2..2000)
        tplshare(inList: ["No","Yes"])
    }
    String toString() {
        tplnamepub
    }
}