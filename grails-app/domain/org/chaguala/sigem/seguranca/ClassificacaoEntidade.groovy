package org.chaguala.sigem.seguranca

class ClassificacaoEntidade {

    static auditable = true

    String designacao
    String descricao

    static constraints = {
        designacao(nullable: false,unique: true)
        descricao(nullable: false)
    }

    String toString(){
        return "${designacao}"
    }
}
