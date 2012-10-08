<%@ page import="spotlight.content.SiteReport" %>



<div class="fieldcontain ${hasErrors(bean: siteReportInstance, field: 'reportName', 'error')} required">
	<label for="reportName">
		<g:message code="siteReport.reportName.label" default="Report Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="reportName" maxlength="100" required="" value="${siteReportInstance?.reportName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteReportInstance, field: 'reportcontent', 'error')} ">
	<label for="reportcontent">
		<g:message code="siteReport.reportcontent.label" default="Reportcontent" />
		
	</label>
	<g:textField name="reportcontent" value="${siteReportInstance?.reportcontent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteReportInstance, field: 'publisheddate', 'error')} required">
	<label for="publisheddate">
		<g:message code="siteReport.publisheddate.label" default="Publisheddate" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="publisheddate" precision="day"  value="${siteReportInstance?.publisheddate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: siteReportInstance, field: 'published', 'error')} required">
	<label for="published">
		<g:message code="siteReport.published.label" default="Published" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="published" required="" value="${siteReportInstance?.published}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteReportInstance, field: 'sitedetail', 'error')} required">
	<label for="sitedetail">
		<g:message code="siteReport.sitedetail.label" default="Sitedetail" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sitedetail" name="sitedetail.id" from="${spotlight.content.SiteDetail.list()}" optionKey="id" required="" value="${siteReportInstance?.sitedetail?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteReportInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="siteReport.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${spotlight.content.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${siteReportInstance?.tags*.id}" class="many-to-many"/>
</div>

