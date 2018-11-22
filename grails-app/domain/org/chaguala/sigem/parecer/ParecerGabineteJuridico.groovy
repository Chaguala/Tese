package org.chaguala.sigem.parecer

import org.chaguala.sigem.nivel.Nivel
import org.chaguala.sigem.pedido.Pedido

class ParecerGabineteJuridico {

    int numero
    String parecer
    String obs
    String aprovado

    static belongsTo = [pedido:Pedido, nivel:Nivel]

    static constraints = {
        aprovado blank: false, inList: ['','SIM','NAO']
    }
}
