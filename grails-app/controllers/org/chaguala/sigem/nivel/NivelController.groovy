package org.chaguala.sigem.nivel

class NivelController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [nivelInstanceList: Nivel.list(params), nivelInstanceTotal: Nivel.count()]
    }

    def create = {
        def nivelInstance = new Nivel()
        nivelInstance.properties = params
        return [nivelInstance: nivelInstance]
    }

    def save = {
        def nivelInstance = new Nivel(params)
        if (!nivelInstance.hasErrors() && nivelInstance.save()) {
            flash.message = "nivel.created"
            flash.args = [nivelInstance.id]
            flash.defaultMessage = "Nivel ${nivelInstance.id} created"
            redirect(action: "show", id: nivelInstance.id)
        }
        else {
            render(view: "create", model: [nivelInstance: nivelInstance])
        }
    }

    def show = {
        def nivelInstance = Nivel.get(params.id)
        if (!nivelInstance) {
            flash.message = "nivel.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Nivel not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [nivelInstance: nivelInstance]
        }
    }

    def edit = {
        def nivelInstance = Nivel.get(params.id)
        if (!nivelInstance) {
            flash.message = "nivel.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Nivel not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [nivelInstance: nivelInstance]
        }
    }

    def update = {
        def nivelInstance = Nivel.get(params.id)
        if (nivelInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (nivelInstance.version > version) {
                    
                    nivelInstance.errors.rejectValue("version", "nivel.optimistic.locking.failure", "Another user has updated this Nivel while you were editing")
                    render(view: "edit", model: [nivelInstance: nivelInstance])
                    return
                }
            }
            nivelInstance.properties = params
            if (!nivelInstance.hasErrors() && nivelInstance.save()) {
                flash.message = "nivel.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Nivel ${params.id} updated"
                redirect(action: "show", id: nivelInstance.id)
            }
            else {
                render(view: "edit", model: [nivelInstance: nivelInstance])
            }
        }
        else {
            flash.message = "nivel.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Nivel not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def nivelInstance = Nivel.get(params.id)
        if (nivelInstance) {
            try {
                nivelInstance.delete()
                flash.message = "nivel.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Nivel ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "nivel.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Nivel ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "nivel.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Nivel not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
