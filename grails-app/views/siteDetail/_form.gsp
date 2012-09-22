<%@ page import="spotlight.SiteDetail" %>



<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'sitename', 'error')} required">
	<label for="sitename">
		<g:message code="siteDetail.sitename.label" default="Sitename" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sitename" maxlength="170" required="" value="${siteDetailInstance?.sitename}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'sitedescrip', 'error')} required">
	<label for="sitedescrip">
		<g:message code="siteDetail.sitedescrip.label" default="Sitedescrip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sitedescrip" maxlength="200" required="" value="${siteDetailInstance?.sitedescrip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'sitepublished', 'error')} required">
	<label for="sitepublished">
		<g:message code="siteDetail.sitepublished.label" default="Sitepublished" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sitepublished" type="number" value="${siteDetailInstance.sitepublished}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteDetailInstance, field: 'sitesummary', 'error')} required">
	<label for="sitesummary">
		<g:message code="siteDetail.sitesummary.label" default="Sitesummary" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sitesummary" name="sitesummary.id" from="${spotlight.SiteSummary.list()}" optionKey="id" required="" value="${siteDetailInstance?.sitesummary?.id}" class="many-to-one"/>
</div>

