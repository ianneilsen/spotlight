package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class ReportProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reportProfileInstanceList: ReportProfile.list(params), reportProfileInstanceTotal: ReportProfile.count()]
    }

    def create() {
        [reportProfileInstance: new ReportProfile(params)]
    }

    def save() {
        def reportProfileInstance = new ReportProfile(params)
        if (!reportProfileInstance.save(flush: true)) {
            render(view: "create", model: [reportProfileInstance: reportProfileInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reportProfile.label', default: 'ReportProfile'), reportProfileInstance.id])
        redirect(action: "show", id: reportProfileInstance.id)
    }

    def show(Long id) {
        def reportProfileInstance = ReportProfile.get(id)
        if (!reportProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportProfile.label', default: 'ReportProfile'), id])
            redirect(action: "list")
            return
        }

        [reportProfileInstance: reportProfileInstance]
    }

    def edit(Long id) {
        def reportProfileInstance = ReportProfile.get(id)
        if (!reportProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportProfile.label', default: 'ReportProfile'), id])
            redirect(action: "list")
            return
        }

        [reportProfileInstance: reportProfileInstance]
    }

    def update(Long id, Long version) {
        def reportProfileInstance = ReportProfile.get(id)
        if (!reportProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportProfile.label', default: 'ReportProfile'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reportProfileInstance.version > version) {
                reportProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reportProfile.label', default: 'ReportProfile')] as Object[],
                          "Another user has updated this ReportProfile while you were editing")
                render(view: "edit", model: [reportProfileInstance: reportProfileInstance])
                return
            }
        }

        reportProfileInstance.properties = params

        if (!reportProfileInstance.save(flush: true)) {
            render(view: "edit", model: [reportProfileInstance: reportProfileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reportProfile.label', default: 'ReportProfile'), reportProfileInstance.id])
        redirect(action: "show", id: reportProfileInstance.id)
    }

    def delete(Long id) {
        def reportProfileInstance = ReportProfile.get(id)
        if (!reportProfileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportProfile.label', default: 'ReportProfile'), id])
            redirect(action: "list")
            return
        }

        try {
            reportProfileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reportProfile.label', default: 'ReportProfile'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reportProfile.label', default: 'ReportProfile'), id])
            redirect(action: "show", id: id)
        }
    }
}
