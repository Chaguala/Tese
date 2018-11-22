package org.chaguala.sigem.parecer

import org.chaguala.sigem.nivel.Nivel
import org.chaguala.sigem.pedido.Pedido

class ParecerController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [parecerInstanceList: Parecer.list(params), parecerInstanceTotal: Parecer.count()]
    }

    // ------------------------------------------------------------------------------------------------------------- //

    def create = {
        def parecerInstance = new Parecer()
        parecerInstance.properties = params

        def pedidoInstance = Pedido.get(params.id)
        session.pedidoId = pedidoInstance.id
        return [parecerInstance: parecerInstance,pedidoInstance:pedidoInstance]
    }

    def listPedidos = {
//        Nivel nivel = Nivel.findById(4.longValue())
//        List<Parecer> parecerList = Parecer.findAllByAprovado('SIM')
        // Niveis de Aprovacao do Pacerecer 1 - , 2 -, 3 -, 4 - Gabinete Juridico
        Nivel nivel = Nivel.findById(4.longValue())
        List<Parecer> parecerList = Parecer.findAllByAprovadoAndNivel('SIM',nivel)

        List<Pedido> pedidoInstanceList = null

        if(parecerList)
            pedidoInstanceList = Pedido.findAllByIdNotInList(parecerList.pedido.toList().id)
        else
            pedidoInstanceList = Pedido.list()
            [pedidoInstanceList: pedidoInstanceList, pedidoInstanceTotal: pedidoInstanceList.size()]
    }


    def save = {
        def parecerInstance = new Parecer(params)
        parecerInstance.pedido = Pedido.get(session.pedidoId)
        if (!parecerInstance.hasErrors() && parecerInstance.save()) {
            flash.message = "parecer.created"
            flash.args = [parecerInstance.id]
            flash.defaultMessage = "Parecer ${parecerInstance.id} created"
            redirect(action: "show", id: parecerInstance.id)
        }
        else {
            def pedidoInstance = Pedido.get(session.pedidoId)
            render(view: "create", model: [pedidoInstance:pedidoInstance,parecerInstance: parecerInstance])
        }
    }
    // ------------------------------------------------------------------------------------------------------------- //
    def show = {
        def parecerInstance = Parecer.get(params.id)
        if (!parecerInstance) {
            flash.message = "parecer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Parecer not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [parecerInstance: parecerInstance]
        }
    }

    def edit = {
        def parecerInstance = Parecer.get(params.id)
        if (!parecerInstance) {
            flash.message = "parecer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Parecer not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [parecerInstance: parecerInstance]
        }
    }

    def update = {
        def parecerInstance = Parecer.get(params.id)
        if (parecerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (parecerInstance.version > version) {
                    
                    parecerInstance.errors.rejectValue("version", "parecer.optimistic.locking.failure", "Another user has updated this Parecer while you were editing")
                    render(view: "edit", model: [parecerInstance: parecerInstance])
                    return
                }
            }
            parecerInstance.properties = params
            if (!parecerInstance.hasErrors() && parecerInstance.save()) {
                flash.message = "parecer.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Parecer ${params.id} updated"
                redirect(action: "show", id: parecerInstance.id)
            }
            else {
                render(view: "edit", model: [parecerInstance: parecerInstance])
            }
        }
        else {
            flash.message = "parecer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Parecer not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def parecerInstance = Parecer.get(params.id)
        if (parecerInstance) {
            try {
                parecerInstance.delete()
                flash.message = "parecer.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Parecer ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "parecer.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Parecer ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "parecer.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Parecer not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
