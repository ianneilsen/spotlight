package spotlight.content

class Pubproduct {

    String pubproduct

    static constraints = {
        pubproduct(blank: false, size: 2..100, unique: true)
    }

    String toString() {
        pubproduct
    }
}
