package org.chaguala.sigem.nivel

class Nivel {

    String nivel

    static constraints = {
        nivel(blank: false, maxSize: 200, unique: true)
    }

    String toString() {
        return "${nivel}"
    }
}
