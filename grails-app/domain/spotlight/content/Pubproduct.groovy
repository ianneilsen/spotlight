package spotlight.content

class Pubproduct {

    String pubproduct

    static constraints = {
        pubproduct(blank: true, size: 2..100)
    }
}
