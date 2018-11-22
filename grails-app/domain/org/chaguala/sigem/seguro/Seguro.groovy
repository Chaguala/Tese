package org.chaguala.sigem.seguro

class Seguro {
    String designacao

    static constraints = {
        designacao(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
