package spotlight

import spotlight.content.Publication

class User {

    transient springSecurityService

    static hasMany = [documents: Publication]
    static belongsTo = Publication


    String username
    String password
    String useremail
    String userfullname
    boolean enabled
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    static constraints = {
        username (blank: false, unique: true/*, matches: "[a-zA-Z0-9_]+"*/)
        password (blank: false, minSize: 5)
        useremail(blank: false, unique: true, email: true)
        userfullname(size: 2..70/*, matches: "[a-zA-Z_]+"*/)
    }

    static mapping = {
        password column: '`password`'
    }

    String toString(){
        username
    }

    Set<Role> getAuthorities() {
        UserRole.findAllByUser(this).collect { it.role } as Set
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
    }
}
