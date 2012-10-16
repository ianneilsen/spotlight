<%@ page import="spotlight.content.Portfolio; spotlight.content.portfolio; spotlight.content.Report" %>



<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'reportName', 'error')} required">
	<label for="reportName">
		<g:message code="report.reportName.label" default="Report Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="reportName" maxlength="100" required="" value="${reportInstance?.reportName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'reportcontent', 'error')} ">
	<label for="reportcontent">
		<g:message code="report.reportcontent.label" default="Report Content" />
		
	</label>
	<div class="textArea">
	<g:textArea name="reportcontent" value="${reportInstance?.reportcontent}" rows="50" cols="600"/>
    </div>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'published', 'error')} required">
	<label for="published">
		<g:message code="report.published.label" default="Is Published" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="published" from="${reportInstance.constraints.published.inList}" required="" value="${reportInstance?.published}" valueMessagePrefix="report.published"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'publisheddate', 'error')} required">
	<label for="publisheddate">
		<g:message code="report.publisheddate.label" default="Publish Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="publisheddate" precision="day"  value="${reportInstance?.publisheddate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'reportsite', 'error')} required">
	<label for="reportsite">
		<g:message code="report.reportsite.label" default="Linked to Report Site" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reportsite" name="reportsite.id" from="${Portfolio.list()}" optionKey="id" required="" value="${reportInstance?.reportsite?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="report.tags.label" default="Tags" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${reportInstance?.tags?}" var="t">
    <li><g:link controller="reportTag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="reportTag" action="create" params="['report.id': reportInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'reportTag.label', default: 'ReportTag')])}</g:link>
</li>
</ul>

</div>

