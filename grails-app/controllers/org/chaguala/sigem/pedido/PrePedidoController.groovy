package org.chaguala.sigem.pedido

import org.chaguala.sigem.requerente.Requerente

class PrePedidoController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [prePedidoInstanceList: PrePedido.list(params), prePedidoInstanceTotal: PrePedido.count()]
    }

    // ---------------------------------------------------------------------------------------------------------
//    def create = {
//        def prePedidoInstance = new PrePedido()
//        prePedidoInstance.properties = params
//        return [prePedidoInstance: prePedidoInstance]
//    }

    def create = {
        def prePedidoInstance = new PrePedido()
        prePedidoInstance.properties = params

        def requerenteInstance = Requerente.get(params.id)
        session.requerenteId = requerenteInstance.id
        return [prePedidoInstance: prePedidoInstance, requerenteInstance: requerenteInstance]
    }

    def listRequerentes = {
        List<PrePedido> prePedidoList = PrePedido.findAll()
        List<Requerente> requerenteInstanceList = null
        if (prePedidoList)
            requerenteInstanceList = Requerente.findAllByIdNotInList(prePedidoList.requerente.toList().id)
//            requerenteInstanceList = Requerente.list()
        else
            requerenteInstanceList = Requerente.list()
        [requerenteInstanceList: requerenteInstanceList, requerenteInstanceTotal: requerenteInstanceList.size()]
    }

//    def save = {
//        def prePedidoInstance = new PrePedido(params)
//        if (!prePedidoInstance.hasErrors() && prePedidoInstance.save()) {
//            flash.message = "prePedido.created"
//            flash.args = [prePedidoInstance.id]
//            flash.defaultMessage = "PrePedido ${prePedidoInstance.id} created"
//            redirect(action: "show", id: prePedidoInstance.id)
//        }
//        else {
//            render(view: "create", model: [prePedidoInstance: prePedidoInstance])
//        }
//    }

    def save = {
        def prePedidoInstance = new PrePedido(params)
        prePedidoInstance.requerente = Requerente.get(session.requerenteId)
        if (!prePedidoInstance.hasErrors() && prePedidoInstance.save()) {
            flash.message = "prepedido.created"
            flash.args = [prePedidoInstance.id]
            flash.defaultMessage = "PrePedido ${prePedidoInstance.id} created"
            redirect(action: "show", id: prePedidoInstance.id)
        } else {
            def requerenteInstance = Requerente.get(session.requerenteId)
            render(view: "create", model: [requerenteInstance: requerenteInstance, prePedidoInstance: prePedidoInstance])
        }
    }

    // -----------------------------------------------------------------------------------------------------------------
    def show = {
        def prePedidoInstance = PrePedido.get(params.id)
        if (!prePedidoInstance) {
            flash.message = "prePedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PrePedido not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [prePedidoInstance: prePedidoInstance]
        }
    }

    def edit = {
        def prePedidoInstance = PrePedido.get(params.id)
        if (!prePedidoInstance) {
            flash.message = "prePedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PrePedido not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [prePedidoInstance: prePedidoInstance]
        }
    }

    def update = {
        def prePedidoInstance = PrePedido.get(params.id)
        if (prePedidoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (prePedidoInstance.version > version) {
                    
                    prePedidoInstance.errors.rejectValue("version", "prePedido.optimistic.locking.failure", "Another user has updated this PrePedido while you were editing")
                    render(view: "edit", model: [prePedidoInstance: prePedidoInstance])
                    return
                }
            }
            prePedidoInstance.properties = params
            if (!prePedidoInstance.hasErrors() && prePedidoInstance.save()) {
                flash.message = "prePedido.updated"
                flash.args = [params.id]
                flash.defaultMessage = "PrePedido ${params.id} updated"
                redirect(action: "show", id: prePedidoInstance.id)
            }
            else {
                render(view: "edit", model: [prePedidoInstance: prePedidoInstance])
            }
        }
        else {
            flash.message = "prePedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PrePedido not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def prePedidoInstance = PrePedido.get(params.id)
        if (prePedidoInstance) {
            try {
                prePedidoInstance.delete()
                flash.message = "prePedido.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PrePedido ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "prePedido.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PrePedido ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "prePedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PrePedido not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
