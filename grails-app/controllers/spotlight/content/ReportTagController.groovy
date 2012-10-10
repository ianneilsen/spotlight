package spotlight.content

import org.springframework.dao.DataIntegrityViolationException

class ReportTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [reportTagInstanceList: ReportTag.list(params), reportTagInstanceTotal: ReportTag.count()]
    }

    def create() {
        [reportTagInstance: new ReportTag(params)]
    }

    def save() {
        def reportTagInstance = new ReportTag(params)
        if (!reportTagInstance.save(flush: true)) {
            render(view: "create", model: [reportTagInstance: reportTagInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'reportTag.label', default: 'ReportTag'), reportTagInstance.id])
        redirect(action: "show", id: reportTagInstance.id)
    }

    def show(Long id) {
        def reportTagInstance = ReportTag.get(id)
        if (!reportTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportTag.label', default: 'ReportTag'), id])
            redirect(action: "list")
            return
        }

        [reportTagInstance: reportTagInstance]
    }

    def edit(Long id) {
        def reportTagInstance = ReportTag.get(id)
        if (!reportTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportTag.label', default: 'ReportTag'), id])
            redirect(action: "list")
            return
        }

        [reportTagInstance: reportTagInstance]
    }

    def update(Long id, Long version) {
        def reportTagInstance = ReportTag.get(id)
        if (!reportTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportTag.label', default: 'ReportTag'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (reportTagInstance.version > version) {
                reportTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'reportTag.label', default: 'ReportTag')] as Object[],
                          "Another user has updated this ReportTag while you were editing")
                render(view: "edit", model: [reportTagInstance: reportTagInstance])
                return
            }
        }

        reportTagInstance.properties = params

        if (!reportTagInstance.save(flush: true)) {
            render(view: "edit", model: [reportTagInstance: reportTagInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'reportTag.label', default: 'ReportTag'), reportTagInstance.id])
        redirect(action: "show", id: reportTagInstance.id)
    }

    def delete(Long id) {
        def reportTagInstance = ReportTag.get(id)
        if (!reportTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'reportTag.label', default: 'ReportTag'), id])
            redirect(action: "list")
            return
        }

        try {
            reportTagInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'reportTag.label', default: 'ReportTag'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'reportTag.label', default: 'ReportTag'), id])
            redirect(action: "show", id: id)
        }
    }
}
