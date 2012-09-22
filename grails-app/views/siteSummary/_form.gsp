<%@ page import="spotlight.SiteSummary" %>



<div class="fieldcontain ${hasErrors(bean: siteSummaryInstance, field: 'adminaddr', 'error')} required">
	<label for="adminaddr">
		<g:message code="siteSummary.adminaddr.label" default="Adminaddr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="adminaddr" required="" value="${siteSummaryInstance?.adminaddr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteSummaryInstance, field: 'ccaddr', 'error')} required">
	<label for="ccaddr">
		<g:message code="siteSummary.ccaddr.label" default="Ccaddr" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="ccaddr" required="" value="${siteSummaryInstance?.ccaddr}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteSummaryInstance, field: 'htmlflag', 'error')} required">
	<label for="htmlflag">
		<g:message code="siteSummary.htmlflag.label" default="Htmlflag" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="htmlflag" type="number" value="${siteSummaryInstance.htmlflag}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteSummaryInstance, field: 'siteadmin', 'error')} required">
	<label for="siteadmin">
		<g:message code="siteSummary.siteadmin.label" default="Siteadmin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="siteadmin" maxlength="50" required="" value="${siteSummaryInstance?.siteadmin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteSummaryInstance, field: 'sitepad', 'error')} ">
	<label for="sitepad">
		<g:message code="siteSummary.sitepad.label" default="Sitepad" />
		
	</label>
	<g:field type="url" name="sitepad" value="${siteSummaryInstance?.sitepad}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteSummaryInstance, field: 'sitedetail', 'error')} required">
	<label for="sitedetail">
		<g:message code="siteSummary.sitedetail.label" default="Sitedetail" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sitedetail" name="sitedetail.id" from="${spotlight.SiteDetail.list()}" optionKey="id" required="" value="${siteSummaryInstance?.sitedetail?.id}" class="many-to-one"/>
</div>

