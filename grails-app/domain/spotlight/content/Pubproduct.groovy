package spotlight.content

class Pubproduct {

    String pubproduct

Publication publication

    static constraints = {
        pubproduct(blank: true, size: 2..100)
    }
}
