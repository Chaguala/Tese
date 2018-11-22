package org.chaguala.sigem.pedido

import org.chaguala.sigem.distibuicaoAdministrativa.Localidade
import org.chaguala.sigem.distibuicaoAdministrativa.PostoAdministrativo
import org.chaguala.sigem.pedido.PrePedido

class Pedido {

    String numero
    String numparcela
    String dimessoes
    String latitude
    String longitude
    String z
    String w
    String u
    String obs

    static belongsTo = [prepedido: PrePedido,posto :PostoAdministrativo, localidade:Localidade]

    static constraints = {
        numero(blank: false, unique: true)
        numparcela(blank: false, maxSize: 200, unique: true)

    }

    String toString(){
        return "${numero}"
    }
}
