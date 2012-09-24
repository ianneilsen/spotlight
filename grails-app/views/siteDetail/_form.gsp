<%@ page import="spotlight.grails.SiteDetail" %>



<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'sitename', 'error')} required">
	<label for="sitename">
		<g:message code="siteDetail.sitename.label" default="Sitename" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sitename" maxlength="150" required="" value="${siteDetailInstance?.sitename}"/>
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
	<g:field name="spublished" type="number" value="${siteDetailInstance.spublished}" required=""/>
</div>

