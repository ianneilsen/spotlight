<%@ page import="spotlight.content.ReportSite" %>



<div class="fieldcontain ${hasErrors(bean: reportSiteInstance, field: 'siteName', 'error')} required">
	<label for="siteName">
		<g:message code="reportSite.siteName.label" default="Site Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="siteName" maxlength="170" required="" value="${reportSiteInstance?.siteName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportSiteInstance, field: 'sdescription', 'error')} required">
	<label for="sdescription">
		<g:message code="reportSite.sdescription.label" default="Report Site Descrip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sdescription" maxlength="200" required="" value="${reportSiteInstance?.sdescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportSiteInstance, field: 'spublished', 'error')} required">
	<label for="spublished">
		<g:message code="reportSite.spublished.label" default="Site is published" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="spublished" from="${reportSiteInstance.constraints.spublished.inList}" required="" value="${fieldValue(bean: reportSiteInstance, field: 'spublished')}" valueMessagePrefix="reportSite.spublished"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportSiteInstance, field: 'reportprofile', 'error')} required">
	<label for="reportprofile">
		<g:message code="reportSite.reportprofile.label" default="Report Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="reportprofile" name="reportprofile.id" from="${spotlight.content.ReportProfile.list()}" optionKey="id" required="" value="${reportSiteInstance?.reportprofile?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportSiteInstance, field: 'reports', 'error')} ">
	<label for="reports">
		<g:message code="reportSite.reports.label" default="Linked Reports" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${reportSiteInstance?.reports?}" var="r">
    <li><g:link controller="report" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="report" action="create" params="['reportSite.id': reportSiteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'report.label', default: 'Report')])}</g:link>
</li>
</ul>

</div>

