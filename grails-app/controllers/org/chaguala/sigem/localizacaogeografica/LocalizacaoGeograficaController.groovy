package org.chaguala.sigem.localizacaogeografica

class LocalizacaoGeograficaController {

    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [localizacaoGeograficaInstanceList: LocalizacaoGeografica.list(params), localizacaoGeograficaInstanceTotal: LocalizacaoGeografica.count()]
    }

    def create = {
        def localizacaoGeograficaInstance = new LocalizacaoGeografica()
        localizacaoGeograficaInstance.properties = params
        return [localizacaoGeograficaInstance: localizacaoGeograficaInstance]
    }

    def save = {
        def localizacaoGeograficaInstance = new LocalizacaoGeografica(params)
        if (!localizacaoGeograficaInstance.hasErrors() && localizacaoGeograficaInstance.save()) {
            flash.message = "localizacaoGeografica.created"
            flash.args = [localizacaoGeograficaInstance.id]
            flash.defaultMessage = "LocalizacaoGeografica ${localizacaoGeograficaInstance.id} created"
            redirect(action: "show", id: localizacaoGeograficaInstance.id)
        }
        else {
            render(view: "create", model: [localizacaoGeograficaInstance: localizacaoGeograficaInstance])
        }
    }

    def show = {
        def localizacaoGeograficaInstance = LocalizacaoGeografica.get(params.id)
        if (!localizacaoGeograficaInstance) {
            flash.message = "localizacaoGeografica.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LocalizacaoGeografica not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [localizacaoGeograficaInstance: localizacaoGeograficaInstance]
        }
    }

    def edit = {
        def localizacaoGeograficaInstance = LocalizacaoGeografica.get(params.id)
        if (!localizacaoGeograficaInstance) {
            flash.message = "localizacaoGeografica.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LocalizacaoGeografica not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [localizacaoGeograficaInstance: localizacaoGeograficaInstance]
        }
    }

    def update = {
        def localizacaoGeograficaInstance = LocalizacaoGeografica.get(params.id)
        if (localizacaoGeograficaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (localizacaoGeograficaInstance.version > version) {
                    
                    localizacaoGeograficaInstance.errors.rejectValue("version", "localizacaoGeografica.optimistic.locking.failure", "Another user has updated this LocalizacaoGeografica while you were editing")
                    render(view: "edit", model: [localizacaoGeograficaInstance: localizacaoGeograficaInstance])
                    return
                }
            }
            localizacaoGeograficaInstance.properties = params
            if (!localizacaoGeograficaInstance.hasErrors() && localizacaoGeograficaInstance.save()) {
                flash.message = "localizacaoGeografica.updated"
                flash.args = [params.id]
                flash.defaultMessage = "LocalizacaoGeografica ${params.id} updated"
                redirect(action: "show", id: localizacaoGeograficaInstance.id)
            }
            else {
                render(view: "edit", model: [localizacaoGeograficaInstance: localizacaoGeograficaInstance])
            }
        }
        else {
            flash.message = "localizacaoGeografica.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LocalizacaoGeografica not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    def delete = {
        def localizacaoGeograficaInstance = LocalizacaoGeografica.get(params.id)
        if (localizacaoGeograficaInstance) {
            try {
                localizacaoGeograficaInstance.delete()
                flash.message = "localizacaoGeografica.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "LocalizacaoGeografica ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "localizacaoGeografica.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "LocalizacaoGeografica ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "localizacaoGeografica.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "LocalizacaoGeografica not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
