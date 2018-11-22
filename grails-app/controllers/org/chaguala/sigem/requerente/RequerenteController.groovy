package org.chaguala.sigem.requerente

class RequerenteController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [requerenteInstanceList: Requerente.list(params), requerenteInstanceTotal: Requerente.count()]
    }

    def create = {
        def requerenteInstance = new Requerente()
        requerenteInstance.properties = params
        return [requerenteInstance: requerenteInstance]
    }

    def save = {
        def requerenteInstance = new Requerente(params)
        if (!requerenteInstance.hasErrors() && requerenteInstance.save()) {
            flash.message = "requerente.created"
            flash.args = [requerenteInstance.id]
            flash.defaultMessage = "Requerente ${requerenteInstance.id} created"
            redirect(action: "show", id: requerenteInstance.id)
        }
        else {
            render(view: "create", model: [requerenteInstance: requerenteInstance])
        }
    }

    def show = {
        def requerenteInstance = Requerente.get(params.id)
        if (!requerenteInstance) {
            flash.message = "requerente.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Requerente not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [requerenteInstance: requerenteInstance]
        }
    }

    def edit = {
        def requerenteInstance = Requerente.get(params.id)
        if (!requerenteInstance) {
            flash.message = "requerente.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Requerente not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [requerenteInstance: requerenteInstance]
        }
    }

    def update = {
        def requerenteInstance = Requerente.get(params.id)
        if (requerenteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (requerenteInstance.version > version) {
                    
                    requerenteInstance.errors.rejectValue("version", "requerente.optimistic.locking.failure", "Another user has updated this Requerente while you were editing")
                    render(view: "edit", model: [requerenteInstance: requerenteInstance])
                    return
                }
            }
            requerenteInstance.properties = params
            if (!requerenteInstance.hasErrors() && requerenteInstance.save()) {
                flash.message = "requerente.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Requerente ${params.id} updated"
                redirect(action: "show", id: requerenteInstance.id)
            }
            else {
                render(view: "edit", model: [requerenteInstance: requerenteInstance])
            }
        }
        else {
            flash.message = "requerente.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Requerente not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def requerenteInstance = Requerente.get(params.id)
        if (requerenteInstance) {
            try {
                requerenteInstance.delete()
                flash.message = "requerente.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Requerente ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "requerente.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Requerente ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "requerente.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Requerente not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
