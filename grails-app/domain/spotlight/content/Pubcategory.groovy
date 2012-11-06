package spotlight.content

class Pubcategory {

    String pubcategory

 Publication publication

    static constraints = {
        pubcategory(blank: true, size: 2..100)
    }
}
