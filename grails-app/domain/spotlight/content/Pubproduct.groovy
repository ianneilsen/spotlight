package spotlight.content

class Pubproduct {

    String pubproduct

    static constraints = {
        pubproduct(blank: false, size: 2..100)
    }

    String toString() {
        pubproduct
    }
}
