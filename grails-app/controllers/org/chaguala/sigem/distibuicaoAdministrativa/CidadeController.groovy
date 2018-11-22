package org.chaguala.sigem.distibuicaoAdministrativa

class CidadeController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [cidadeInstanceList: Cidade.list(params), cidadeInstanceTotal: Cidade.count()]
    }

    def create = {
        def cidadeInstance = new Cidade()
        cidadeInstance.properties = params
        return [cidadeInstance: cidadeInstance]
    }

    def save = {
        def cidadeInstance = new Cidade(params)
        if (!cidadeInstance.hasErrors() && cidadeInstance.save()) {
            flash.message = "cidade.created"
            flash.args = [cidadeInstance.id]
            flash.defaultMessage = "Cidade ${cidadeInstance.id} created"
            redirect(action: "show", id: cidadeInstance.id)
        }
        else {
            render(view: "create", model: [cidadeInstance: cidadeInstance])
        }
    }

    def show = {
        def cidadeInstance = Cidade.get(params.id)
        if (!cidadeInstance) {
            flash.message = "cidade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Cidade not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [cidadeInstance: cidadeInstance]
        }
    }

    def edit = {
        def cidadeInstance = Cidade.get(params.id)
        if (!cidadeInstance) {
            flash.message = "cidade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Cidade not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [cidadeInstance: cidadeInstance]
        }
    }

    def update = {
        def cidadeInstance = Cidade.get(params.id)
        if (cidadeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cidadeInstance.version > version) {
                    
                    cidadeInstance.errors.rejectValue("version", "cidade.optimistic.locking.failure", "Another user has updated this Cidade while you were editing")
                    render(view: "edit", model: [cidadeInstance: cidadeInstance])
                    return
                }
            }
            cidadeInstance.properties = params
            if (!cidadeInstance.hasErrors() && cidadeInstance.save()) {
                flash.message = "cidade.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Cidade ${params.id} updated"
                redirect(action: "show", id: cidadeInstance.id)
            }
            else {
                render(view: "edit", model: [cidadeInstance: cidadeInstance])
            }
        }
        else {
            flash.message = "cidade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Cidade not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def cidadeInstance = Cidade.get(params.id)
        if (cidadeInstance) {
            try {
                cidadeInstance.delete()
                flash.message = "cidade.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Cidade ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "cidade.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Cidade ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "cidade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Cidade not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
