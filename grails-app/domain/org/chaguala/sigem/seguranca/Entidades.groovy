package org.chaguala.sigem.seguranca

class Entidades {

     static auditable = true
    //static searchable = true

    String designacao
    String nomeClasse
    ClassificacaoEntidade classificacaoEntidade

    static constraints = {
        designacao(blank: false,unique: true)
        nomeClasse(blank: false,unique: true)
    }

    String toString(){
        return "${designacao}"
    }
}
