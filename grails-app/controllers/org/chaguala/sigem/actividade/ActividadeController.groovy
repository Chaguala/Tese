package org.chaguala.sigem.actividade

class ActividadeController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [actividadeInstanceList: Actividade.list(params), actividadeInstanceTotal: Actividade.count()]
    }

    def create = {
        def actividadeInstance = new Actividade()
        actividadeInstance.properties = params
        return [actividadeInstance: actividadeInstance]
    }

    def save = {
        def actividadeInstance = new Actividade(params)
        if (!actividadeInstance.hasErrors() && actividadeInstance.save()) {
            flash.message = "actividade.created"
            flash.args = [actividadeInstance.id]
            flash.defaultMessage = "Actividade ${actividadeInstance.id} created"
            redirect(action: "show", id: actividadeInstance.id)
        }
        else {
            render(view: "create", model: [actividadeInstance: actividadeInstance])
        }
    }

    def show = {
        def actividadeInstance = Actividade.get(params.id)
        if (!actividadeInstance) {
            flash.message = "actividade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Actividade not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [actividadeInstance: actividadeInstance]
        }
    }

    def edit = {
        def actividadeInstance = Actividade.get(params.id)
        if (!actividadeInstance) {
            flash.message = "actividade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Actividade not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [actividadeInstance: actividadeInstance]
        }
    }

    def update = {
        def actividadeInstance = Actividade.get(params.id)
        if (actividadeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (actividadeInstance.version > version) {
                    
                    actividadeInstance.errors.rejectValue("version", "actividade.optimistic.locking.failure", "Another user has updated this Actividade while you were editing")
                    render(view: "edit", model: [actividadeInstance: actividadeInstance])
                    return
                }
            }
            actividadeInstance.properties = params
            if (!actividadeInstance.hasErrors() && actividadeInstance.save()) {
                flash.message = "actividade.updated"
                flash.args = [params.id]
                flash.defaultMessage = "Actividade ${params.id} updated"
                redirect(action: "show", id: actividadeInstance.id)
            }
            else {
                render(view: "edit", model: [actividadeInstance: actividadeInstance])
            }
        }
        else {
            flash.message = "actividade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Actividade not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def actividadeInstance = Actividade.get(params.id)
        if (actividadeInstance) {
            try {
                actividadeInstance.delete()
                flash.message = "actividade.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Actividade ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "actividade.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "Actividade ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "actividade.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "Actividade not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
