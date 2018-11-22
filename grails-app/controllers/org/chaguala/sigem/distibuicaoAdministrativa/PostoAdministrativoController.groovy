package org.chaguala.sigem.distibuicaoAdministrativa

class PostoAdministrativoController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [postoAdministrativoInstanceList: PostoAdministrativo.list(params), postoAdministrativoInstanceTotal: PostoAdministrativo.count()]
    }

    def create = {
        def postoAdministrativoInstance = new PostoAdministrativo()
        postoAdministrativoInstance.properties = params
        return [postoAdministrativoInstance: postoAdministrativoInstance]
    }

    def save = {
        def postoAdministrativoInstance = new PostoAdministrativo(params)
        if (!postoAdministrativoInstance.hasErrors() && postoAdministrativoInstance.save()) {
            flash.message = "postoAdministrativo.created"
            flash.args = [postoAdministrativoInstance.id]
            flash.defaultMessage = "PostoAdministrativo ${postoAdministrativoInstance.id} created"
            redirect(action: "show", id: postoAdministrativoInstance.id)
        }
        else {
            render(view: "create", model: [postoAdministrativoInstance: postoAdministrativoInstance])
        }
    }

    def show = {
        def postoAdministrativoInstance = PostoAdministrativo.get(params.id)
        if (!postoAdministrativoInstance) {
            flash.message = "postoAdministrativo.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PostoAdministrativo not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [postoAdministrativoInstance: postoAdministrativoInstance]
        }
    }

    def edit = {
        def postoAdministrativoInstance = PostoAdministrativo.get(params.id)
        if (!postoAdministrativoInstance) {
            flash.message = "postoAdministrativo.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PostoAdministrativo not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [postoAdministrativoInstance: postoAdministrativoInstance]
        }
    }

    def update = {
        def postoAdministrativoInstance = PostoAdministrativo.get(params.id)
        if (postoAdministrativoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (postoAdministrativoInstance.version > version) {
                    
                    postoAdministrativoInstance.errors.rejectValue("version", "postoAdministrativo.optimistic.locking.failure", "Another user has updated this PostoAdministrativo while you were editing")
                    render(view: "edit", model: [postoAdministrativoInstance: postoAdministrativoInstance])
                    return
                }
            }
            postoAdministrativoInstance.properties = params
            if (!postoAdministrativoInstance.hasErrors() && postoAdministrativoInstance.save()) {
                flash.message = "postoAdministrativo.updated"
                flash.args = [params.id]
                flash.defaultMessage = "PostoAdministrativo ${params.id} updated"
                redirect(action: "show", id: postoAdministrativoInstance.id)
            }
            else {
                render(view: "edit", model: [postoAdministrativoInstance: postoAdministrativoInstance])
            }
        }
        else {
            flash.message = "postoAdministrativo.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PostoAdministrativo not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def postoAdministrativoInstance = PostoAdministrativo.get(params.id)
        if (postoAdministrativoInstance) {
            try {
                postoAdministrativoInstance.delete()
                flash.message = "postoAdministrativo.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PostoAdministrativo ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "postoAdministrativo.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "PostoAdministrativo ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "postoAdministrativo.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "PostoAdministrativo not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
