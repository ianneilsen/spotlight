package spotlight.content

class Pubcategory {

    static belongsTo = [Publication]

    String pubCategory

    static constraints = {
        pubCategory(blank: true)
    }
}
