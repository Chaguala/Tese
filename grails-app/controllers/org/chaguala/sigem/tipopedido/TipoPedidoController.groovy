package org.chaguala.sigem.tipopedido

class TipoPedidoController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [tipoPedidoInstanceList: TipoPedido.list(params), tipoPedidoInstanceTotal: TipoPedido.count()]
    }

    def create = {
        def tipoPedidoInstance = new TipoPedido()
        tipoPedidoInstance.properties = params
        return [tipoPedidoInstance: tipoPedidoInstance]
    }

    def save = {
        def tipoPedidoInstance = new TipoPedido(params)
        if (!tipoPedidoInstance.hasErrors() && tipoPedidoInstance.save()) {
            flash.message = "tipoPedido.created"
            flash.args = [tipoPedidoInstance.id]
            flash.defaultMessage = "TipoPedido ${tipoPedidoInstance.id} created"
            redirect(action: "show", id: tipoPedidoInstance.id)
        }
        else {
            render(view: "create", model: [tipoPedidoInstance: tipoPedidoInstance])
        }
    }

    def show = {
        def tipoPedidoInstance = TipoPedido.get(params.id)
        if (!tipoPedidoInstance) {
            flash.message = "tipoPedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "TipoPedido not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [tipoPedidoInstance: tipoPedidoInstance]
        }
    }

    def edit = {
        def tipoPedidoInstance = TipoPedido.get(params.id)
        if (!tipoPedidoInstance) {
            flash.message = "tipoPedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "TipoPedido not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [tipoPedidoInstance: tipoPedidoInstance]
        }
    }

    def update = {
        def tipoPedidoInstance = TipoPedido.get(params.id)
        if (tipoPedidoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tipoPedidoInstance.version > version) {
                    
                    tipoPedidoInstance.errors.rejectValue("version", "tipoPedido.optimistic.locking.failure", "Another user has updated this TipoPedido while you were editing")
                    render(view: "edit", model: [tipoPedidoInstance: tipoPedidoInstance])
                    return
                }
            }
            tipoPedidoInstance.properties = params
            if (!tipoPedidoInstance.hasErrors() && tipoPedidoInstance.save()) {
                flash.message = "tipoPedido.updated"
                flash.args = [params.id]
                flash.defaultMessage = "TipoPedido ${params.id} updated"
                redirect(action: "show", id: tipoPedidoInstance.id)
            }
            else {
                render(view: "edit", model: [tipoPedidoInstance: tipoPedidoInstance])
            }
        }
        else {
            flash.message = "tipoPedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "TipoPedido not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def tipoPedidoInstance = TipoPedido.get(params.id)
        if (tipoPedidoInstance) {
            try {
                tipoPedidoInstance.delete()
                flash.message = "tipoPedido.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "TipoPedido ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "tipoPedido.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "TipoPedido ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "tipoPedido.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "TipoPedido not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
