package org.chaguala.sigem.proprietario

class Proprietario {


    String numero
    String nome
    Date datanasc
    String sexo
    String tipoidentificacao
    String identificacao
    String endereco
    int contacto
    String email
    String tipoproprietario

    static constraints = {
        sexo inList: ['', 'Masculino', 'Feminino']
        tipoidentificacao inList: ['','BI','PASSAPORT','BOLENTIN','DIRE']
        tipoproprietario inList: ['','Residente','Proprietario']
        nome(blank: false, maxSize: 200, unique: true)
    }

    String toString() {
        return "${nome}"
    }
}
