package org.chaguala.sigem.actividade

class Actividade {

    String designacao
    String estado

    static constraints = {
        estado inList: ['', 'Activo', 'Inactivo']
        designacao(blank: false, maxSize: 200, unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
