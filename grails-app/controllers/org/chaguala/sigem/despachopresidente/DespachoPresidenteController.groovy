package org.chaguala.sigem.despachopresidente

import org.chaguala.sigem.nivel.Nivel
import org.chaguala.sigem.parecer.Parecer
import org.chaguala.sigem.pedido.Pedido

class DespachoPresidenteController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [despachoPresidenteInstanceList: DespachoPresidente.list(params), despachoPresidenteInstanceTotal: DespachoPresidente.count()]
    }

    // -- Alterado por Chaguala -------------------------
    def listPedidosComPareceres = {
        // Niveis de Aprovacao do Pacerecer 1 - , 2 -, 3 -, 4 - Gabinete Juridico
        Nivel nivel = Nivel.findById(4.longValue())
        List<Parecer> parecerList = Parecer.findAllByAprovadoAndNivel('SIM',nivel)
//        List<Parecer> parecerList = Parecer.findAllByAprovado('SIM')

//        DespachoPresidente despachoPositivo=DespachoPresidente.findAllById(1.longValue())
//        DespachoPresidente despachoNegativo=DespachoPresidente.findAllById(2.longValue())
//        List<Parecer> parecerList=Parecer.findAllByAprovadoAndDespachoPresidente('SIM',despachoPositivo)

        List<Pedido> pedidoInstanceList = null

        if(parecerList)
//            parecerList =DespachoPresidente.findAllByPedidoInListAndDespachoNotIsNotNull(parecerList.pedido.toList())
//            pedidoInstanceList = DespachoPresidente.findAllByIdNotInList(parecerList.pedido.toList().id)
            pedidoInstanceList = Pedido.list()
        else
            pedidoInstanceList = Pedido.list()
            [pedidoInstanceList: pedidoInstanceList, pedidoInstanceTotal: pedidoInstanceList?.size()]
    }

    def create = {
        def despachoPresidenteInstance = new DespachoPresidente()
        despachoPresidenteInstance.properties = params
        def pedidoInstance = Pedido.get(params.id)
        def parecerInstance = Parecer.findByPedido(pedidoInstance)
        session.pedidoId = pedidoInstance.id
        return [despachoPresidenteInstance: despachoPresidenteInstance,pedidoInstance:pedidoInstance,parecerInstance:parecerInstance]
    }

    def save = {
        def despachoPresidenteInstance = new DespachoPresidente(params)
        def pedidoInstance = Pedido.get(session.pedidoId)
        despachoPresidenteInstance.pedido = pedidoInstance

        if (!despachoPresidenteInstance.hasErrors() && despachoPresidenteInstance.save()) {
            flash.message = "despachoPresidente.created"
            flash.args = [despachoPresidenteInstance.id]
            flash.defaultMessage = "DespachoPresidente ${despachoPresidenteInstance.id} created"
            redirect(action: "show", id: despachoPresidenteInstance.id)
        }
        else {
            render(view: "create", model: [despachoPresidenteInstance: despachoPresidenteInstance, pedidoInstance:pedidoInstance])
        }
    }
    // --------------------------------------------------------------------------

    def show = {
        def despachoPresidenteInstance = DespachoPresidente.get(params.id)
        if (!despachoPresidenteInstance) {
            flash.message = "despachoPresidente.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DespachoPresidente not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [despachoPresidenteInstance: despachoPresidenteInstance]
        }
    }

    def edit = {
        def despachoPresidenteInstance = DespachoPresidente.get(params.id)
        if (!despachoPresidenteInstance) {
            flash.message = "despachoPresidente.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DespachoPresidente not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [despachoPresidenteInstance: despachoPresidenteInstance]
        }
    }

    def update = {
        def despachoPresidenteInstance = DespachoPresidente.get(params.id)
        if (despachoPresidenteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (despachoPresidenteInstance.version > version) {
                    
                    despachoPresidenteInstance.errors.rejectValue("version", "despachoPresidente.optimistic.locking.failure", "Another user has updated this DespachoPresidente while you were editing")
                    render(view: "edit", model: [despachoPresidenteInstance: despachoPresidenteInstance])
                    return
                }
            }
            despachoPresidenteInstance.properties = params
            if (!despachoPresidenteInstance.hasErrors() && despachoPresidenteInstance.save()) {
                flash.message = "despachoPresidente.updated"
                flash.args = [params.id]
                flash.defaultMessage = "DespachoPresidente ${params.id} updated"
                redirect(action: "show", id: despachoPresidenteInstance.id)
            }
            else {
                render(view: "edit", model: [despachoPresidenteInstance: despachoPresidenteInstance])
            }
        }
        else {
            flash.message = "despachoPresidente.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DespachoPresidente not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def despachoPresidenteInstance = DespachoPresidente.get(params.id)
        if (despachoPresidenteInstance) {
            try {
                despachoPresidenteInstance.delete()
                flash.message = "despachoPresidente.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "DespachoPresidente ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "despachoPresidente.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "DespachoPresidente ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "despachoPresidente.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "DespachoPresidente not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
