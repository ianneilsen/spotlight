package spotlight.content

class Pubproduct {
    static belongsTo = [Publication]

    String pubProduct

    static constraints = {
        pubProduct(blank: true)
    }
}
