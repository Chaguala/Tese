package org.chaguala.sigem.requerente

import org.chaguala.sigem.distibuicaoAdministrativa.Bairro
import org.chaguala.sigem.distibuicaoAdministrativa.Pais
import org.chaguala.sigem.distibuicaoAdministrativa.Provincia


class Requerente {

    String nome
    Date datanasc
    String sexo
    String tipoidentificacao
    String identificacao
    String endereco
    int contacto
    String email

    static belongsTo = [pais  :Pais,provincia:Provincia,bairro:Bairro]

    static constraints = {
        sexo inList: ['', 'Masculino', 'Feminino']
        tipoidentificacao inList: ['','BI','PASSAPORT','BOLENTIN','DIRE']

        nome(blank: true, maxSize: 200, unique: true)
    }

    String toString() {
        return "${nome}"
    }
}
