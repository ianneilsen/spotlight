<%@ page import="spotlight.content.SiteDetail" %>



<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'sitename', 'error')} required">
	<label for="sitename">
		<g:message code="siteDetail.sitename.label" default="Sitename" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sitename" maxlength="170" required="" value="${siteDetailInstance?.sitename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'sdescription', 'error')} required">
	<label for="sdescription">
		<g:message code="siteDetail.sdescription.label" default="Sdescription" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sdescription" maxlength="200" required="" value="${siteDetailInstance?.sdescription}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'spublished', 'error')} required">
	<label for="spublished">
		<g:message code="siteDetail.spublished.label" default="Spublished" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="spublished" from="${siteDetailInstance.constraints.spublished.inList}" required="" value="${fieldValue(bean: siteDetailInstance, field: 'spublished')}" valueMessagePrefix="siteDetail.spublished"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'siteprofile', 'error')} required">
	<label for="siteprofile">
		<g:message code="siteDetail.siteprofile.label" default="Siteprofile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="siteprofile" name="siteprofile.id" from="${spotlight.content.SiteProfile.list()}" optionKey="id" required="" value="${siteDetailInstance?.siteprofile?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'sitereports', 'error')} ">
	<label for="sitereports">
		<g:message code="siteDetail.sitereports.label" default="Sitereports" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${siteDetailInstance?.sitereports?}" var="s">
    <li><g:link controller="siteReport" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="siteReport" action="create" params="['siteDetail.id': siteDetailInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'siteReport.label', default: 'SiteReport')])}</g:link>
</li>
</ul>

</div>

