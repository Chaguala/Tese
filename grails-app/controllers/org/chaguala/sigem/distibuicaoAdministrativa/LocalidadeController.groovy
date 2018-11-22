package org.chaguala.sigem.distibuicaoAdministrativa

class LocalidadeController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [localidadeInstanceList: Localidade.list(params), localidadeInstanceTotal: Localidade.count()]
    }

    def create = {
        def localidadeInstance = new Localidade()
        localidadeInstance.properties = params
        return [localidadeInstance: localidadeInstance]
    }

    def save = {
        def localidadeInstance = new Localidade(params)
        if (!localidadeInstance.hasErrors() && localidadeInstance.save()) {
            flash.message = "localidade.created"
            flash.args = [localidadeInstance.id]
            flash.defaultMessage = "Localidade ${localidadeInstance.id} created"
            redirect(action: "show", id: localidadeInstance.id)
        }
        else {
            render(view: "create", model: [localidadeInstance: localidadeInstance])
        }
    }

    def show = {
        def localidadeInstance = Localidade.get(params.id)
        if (!localidadeInstance) {
            flash.message = "localidade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Localidade not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [localidadeInstance: localidadeInstance]
        }
    }

    def edit = {
        def localidadeInstance = Localidade.get(params.id)
        if (!localidadeInstance) {
            flash.message = "localidade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Localidade not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [localidadeInstance: localidadeInstance]
        }
    }

    def update = {
        def localidadeInstance = Localidade.get(params.id)
        if (localidadeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (localidadeInstance.version > version) {
                    
                    localidadeInstance.errors.rejectValue("version", "localidade.optimistic.locking.failure", "Another user has updated this Localidade while you were editing")
                    render(view: "edit", model: [localidadeInstance: localidadeInstance])
                    return
                }
            }
            localidadeInstance.properties = params
            if (!localidadeInstance.hasErrors() && localidadeInstance.save()) {
                flash.message = "localidade.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Localidade ${params.id} updated"
                redirect(action: "show", id: localidadeInstance.id)
            }
            else {
                render(view: "edit", model: [localidadeInstance: localidadeInstance])
            }
        }
        else {
            flash.message = "localidade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Localidade not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def localidadeInstance = Localidade.get(params.id)
        if (localidadeInstance) {
            try {
                localidadeInstance.delete()
                flash.message = "localidade.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Localidade ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "localidade.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Localidade ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "localidade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Localidade not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
