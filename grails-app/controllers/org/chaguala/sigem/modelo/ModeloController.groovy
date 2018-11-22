package org.chaguala.sigem.modelo

class ModeloController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [modeloInstanceList: Modelo.list(params), modeloInstanceTotal: Modelo.count()]
    }

    def create = {
        def modeloInstance = new Modelo()
        modeloInstance.properties = params
        return [modeloInstance: modeloInstance]
    }

    def save = {
        def modeloInstance = new Modelo(params)
        if (!modeloInstance.hasErrors() && modeloInstance.save()) {
            flash.message = "modelo.created"
            flash.args = [modeloInstance.id]
            flash.defaultMessage = "Modelo ${modeloInstance.id} created"
            redirect(action: "show", id: modeloInstance.id)
        }
        else {
            render(view: "create", model: [modeloInstance: modeloInstance])
        }
    }

    def show = {
        def modeloInstance = Modelo.get(params.id)
        if (!modeloInstance) {
            flash.message = "modelo.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Modelo not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [modeloInstance: modeloInstance]
        }
    }

    def edit = {
        def modeloInstance = Modelo.get(params.id)
        if (!modeloInstance) {
            flash.message = "modelo.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Modelo not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [modeloInstance: modeloInstance]
        }
    }

    def update = {
        def modeloInstance = Modelo.get(params.id)
        if (modeloInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (modeloInstance.version > version) {
                    
                    modeloInstance.errors.rejectValue("version", "modelo.optimistic.locking.failure", "Another user has updated this Modelo while you were editing")
                    render(view: "edit", model: [modeloInstance: modeloInstance])
                    return
                }
            }
            modeloInstance.properties = params
            if (!modeloInstance.hasErrors() && modeloInstance.save()) {
                flash.message = "modelo.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Modelo ${params.id} updated"
                redirect(action: "show", id: modeloInstance.id)
            }
            else {
                render(view: "edit", model: [modeloInstance: modeloInstance])
            }
        }
        else {
            flash.message = "modelo.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Modelo not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def modeloInstance = Modelo.get(params.id)
        if (modeloInstance) {
            try {
                modeloInstance.delete()
                flash.message = "modelo.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Modelo ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "modelo.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Modelo ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "modelo.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Modelo not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
