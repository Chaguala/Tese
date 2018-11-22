package org.chaguala.sigem.pedido

import org.chaguala.sigem.pedido.Pedido
import org.chaguala.sigem.pedido.PrePedido

class PedidoController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
        [pedidoInstanceList: Pedido.list(params), pedidoInstanceTotal: Pedido.count()]
    }

    // ------------------------------------------------------------------------------------------------------------- //
    def create = {
        def pedidoInstance = new Pedido()
        pedidoInstance.properties = params

        def prePedidoInstance = PrePedido.get(params.id)
        session.prepedidoId = prePedidoInstance.id
        return [pedidoInstance: pedidoInstance, prePedidoInstance: prePedidoInstance]
    }

    def listPedidos = {
        List<Pedido> pedidoList = Pedido.findAll()
        List<PrePedido> prePedidoInstanceList = null
        if (pedidoList)
//            prePedidoInstanceList = PrePedido.list()
            prePedidoInstanceList = PrePedido.findAllByIdNotInList(pedidoList.prepedido.toList().id)

        else
            prePedidoInstanceList = PrePedido.list()
            [prePedidoInstanceList: prePedidoInstanceList, prePedidoInstanceTotal: prePedidoInstanceList.size()]
    }

    def save = {
        def pedidoInstance = new Pedido(params)
        pedidoInstance.prepedido = PrePedido.get(session.prepedidoId)
        if (!pedidoInstance.hasErrors() && pedidoInstance.save()) {
            flash.message = "pedido.created"
            flash.args = [pedidoInstance.id]
            flash.defaultMessage = "Pedido ${pedidoInstance.id} created"
            redirect(action: "show", id: pedidoInstance.id)
        } else {
            def prePedidoInstance = PrePedido.get(session.prepedidoId)
            render(view: "create", model: [prePedidoInstance: prePedidoInstance, pedidoInstance: pedidoInstance])
        }
    }
    // ------------------------------------------------------------------------------------------------------------- //
    def show = {
        def pedidoInstance = Pedido.get(params.id)
        if (!pedidoInstance) {
            flash.message = "pedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Pedido not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [pedidoInstance: pedidoInstance]
        }
    }

    def edit = {
        def pedidoInstance = Pedido.get(params.id)
        if (!pedidoInstance) {
            flash.message = "pedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Pedido not found with id ${params.id}"
            redirect(action: "list")
        } else {
            return [pedidoInstance: pedidoInstance]
        }
    }

    def update = {
        def pedidoInstance = Pedido.get(params.id)
        if (pedidoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pedidoInstance.version > version) {

                    pedidoInstance.errors.rejectValue("version", "pedido.optimistic.locking.failure", "Another user has updated this Pedido while you were editing")
                    render(view: "edit", model: [pedidoInstance: pedidoInstance])
                    return
                }
            }
            pedidoInstance.properties = params
            if (!pedidoInstance.hasErrors() && pedidoInstance.save()) {
                flash.message = "pedido.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Pedido ${params.id} updated"
                redirect(action: "show", id: pedidoInstance.id)
            } else {
                render(view: "edit", model: [pedidoInstance: pedidoInstance])
            }
        } else {
            flash.message = "pedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Pedido not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def pedidoInstance = Pedido.get(params.id)
        if (pedidoInstance) {
            try {
                pedidoInstance.delete()
                flash.message = "pedido.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Pedido ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "pedido.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Pedido ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "pedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Pedido not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
