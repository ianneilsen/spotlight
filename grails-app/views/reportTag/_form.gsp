<%@ page import="spotlight.content.ReportTag" %>



<div class="fieldcontain ${hasErrors(bean: reportTagInstance, field: 'tagname', 'error')} ">
	<label for="tagname">
		<g:message code="reportTag.tagname.label" default="Tagname" />
		
	</label>
	<g:textField name="tagname" maxlength="100" value="${reportTagInstance?.tagname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportTagInstance, field: 'reports', 'error')} required">
	<label for="reports">
		<g:message code="reportTag.reports.label" default="Reports" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reports" name="reports.id" from="${spotlight.content.Report.list()}" optionKey="id" required="" value="${reportTagInstance?.reports?.id}" class="many-to-one"/>
</div>

