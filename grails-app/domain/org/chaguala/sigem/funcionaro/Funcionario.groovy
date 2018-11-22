package org.chaguala.sigem.funcionaro

class Funcionario {


    String numero
    String nome
    Date datanasc
    String sexo
    String tipoidentificacao
    String identificacao
    String endereco
    int contacto
    String email

    static constraints = {
        sexo inList: ['', 'Masculino', 'Feminino']
        tipoidentificacao inList: ['','BI','PASSAPORT','BOLENTIN','DIRE']

        nome(blank: false, maxSize: 200, unique: true)
    }

    String toString() {
        return "${nome}"
    }
}
