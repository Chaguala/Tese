package org.chaguala.sigem.pedido

import org.chaguala.sigem.actividade.Actividade
import org.chaguala.sigem.distibuicaoAdministrativa.Bairro
import org.chaguala.sigem.distibuicaoAdministrativa.Distrito

import org.chaguala.sigem.distibuicaoAdministrativa.Provincia
import org.chaguala.sigem.requerente.Requerente
import org.chaguala.sigem.tipodocumento.TipoDocumento
import org.chaguala.sigem.tipopedido.TipoPedido

class PrePedido {

    Date datapedido
    String tipoproprietario
    TipoPedido tipopedido
    static belongsTo = [bairro:Bairro,distrito  :Distrito, provincia:Provincia, actidade:Actividade,
                        requerente:Requerente,tipodocumento:TipoDocumento]

    static constraints = {
        tipoproprietario inList: ['Proprio']//,'Proprio','Terceiro'
    }

    String toString(){
        return "${requerente}"
    }
}
