package org.chaguala.sigem.despachopresidente

import org.chaguala.sigem.despacho.Despacho
import org.chaguala.sigem.pedido.Pedido

class DespachoPresidente {

    int numero
    String obs
    //String aprovado

    static belongsTo = [pedido:Pedido,despacho:Despacho]

    static constraints = {
//        aprovado blank: false, inList: ['','SIM','NAO']
    }
}
