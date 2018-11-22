package org.chaguala.sigem.tipodocumento

class TipoDocumentoController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [tipoDocumentoInstanceList: TipoDocumento.list(params), tipoDocumentoInstanceTotal: TipoDocumento.count()]
    }

    def create = {
        def tipoDocumentoInstance = new TipoDocumento()
        tipoDocumentoInstance.properties = params
        return [tipoDocumentoInstance: tipoDocumentoInstance]
    }

    def save = {
        def tipoDocumentoInstance = new TipoDocumento(params)
        if (!tipoDocumentoInstance.hasErrors() && tipoDocumentoInstance.save()) {
            flash.message = "tipoDocumento.created"
            flash.args = [tipoDocumentoInstance.id]
            flash.defaultMessage = "TipoDocumento ${tipoDocumentoInstance.id} created"
            redirect(action: "show", id: tipoDocumentoInstance.id)
        }
        else {
            render(view: "create", model: [tipoDocumentoInstance: tipoDocumentoInstance])
        }
    }

    def show = {
        def tipoDocumentoInstance = TipoDocumento.get(params.id)
        if (!tipoDocumentoInstance) {
            flash.message = "tipoDocumento.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "TipoDocumento not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [tipoDocumentoInstance: tipoDocumentoInstance]
        }
    }

    def edit = {
        def tipoDocumentoInstance = TipoDocumento.get(params.id)
        if (!tipoDocumentoInstance) {
            flash.message = "tipoDocumento.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "TipoDocumento not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [tipoDocumentoInstance: tipoDocumentoInstance]
        }
    }

    def update = {
        def tipoDocumentoInstance = TipoDocumento.get(params.id)
        if (tipoDocumentoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tipoDocumentoInstance.version > version) {
                    
                    tipoDocumentoInstance.errors.rejectValue("version", "tipoDocumento.optimistic.locking.failure", "Another user has updated this TipoDocumento while you were editing")
                    render(view: "edit", model: [tipoDocumentoInstance: tipoDocumentoInstance])
                    return
                }
            }
            tipoDocumentoInstance.properties = params
            if (!tipoDocumentoInstance.hasErrors() && tipoDocumentoInstance.save()) {
                flash.message = "tipoDocumento.updated"
                flash.args = [params.id]
                flash.defaultMessage = "TipoDocumento ${params.id} updated"
                redirect(action: "show", id: tipoDocumentoInstance.id)
            }
            else {
                render(view: "edit", model: [tipoDocumentoInstance: tipoDocumentoInstance])
            }
        }
        else {
            flash.message = "tipoDocumento.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "TipoDocumento not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def tipoDocumentoInstance = TipoDocumento.get(params.id)
        if (tipoDocumentoInstance) {
            try {
                tipoDocumentoInstance.delete()
                flash.message = "tipoDocumento.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "TipoDocumento ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "tipoDocumento.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "TipoDocumento ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "tipoDocumento.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "TipoDocumento not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
