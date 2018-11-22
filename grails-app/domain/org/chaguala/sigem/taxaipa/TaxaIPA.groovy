package org.chaguala.sigem.taxaipa

class TaxaIPA {


    int deidadex
    int aidadey
    int valor
    String observacao

    static constraints = {
        deidadex(blank: false, maxSize: 2, unique: true)
        aidadey(blank: false, maxSize: 2, unique: true)
    }

}
