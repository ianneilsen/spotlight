<%@ page import="spotlight.content.SiteReport" %>



<div class="fieldcontain ${hasErrors(bean: siteReportInstance, field: 'reportname', 'error')} required">
	<label for="reportname">
		<g:message code="siteReport.reportname.label" default="Reportname" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="reportname" maxlength="100" required="" value="${siteReportInstance?.reportname}"/>
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

<div class="fieldcontain ${hasErrors(bean: siteReportInstance, field: 'sitedetail', 'error')} required">
	<label for="sitedetail">
		<g:message code="siteReport.sitedetail.label" default="Sitedetail" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="sitedetail" name="sitedetail.id" from="${spotlight.content.SiteDetail.list()}" optionKey="id" required="" value="${siteReportInstance?.sitedetail?.id}" class="many-to-one"/>
</div>

