package org.chaguala.sigem.localizacaogeografica

import org.chaguala.sigem.pedido.Pedido

class LocalizacaoGeografica {

    String obs

    static belongsTo = [pedido:Pedido]

    static constraints = {
    }

}
