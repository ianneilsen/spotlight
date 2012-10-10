<%@ page import="spotlight.content.ReportProfile" %>



<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'siteadmin', 'error')} required">
	<label for="siteadmin">
		<g:message code="reportProfile.siteadmin.label" default="Siteadmin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="siteadmin" maxlength="80" required="" value="${reportProfileInstance?.siteadmin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'siteemail', 'error')} required">
	<label for="siteemail">
		<g:message code="reportProfile.siteemail.label" default="Siteemail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="siteemail" required="" value="${reportProfileInstance?.siteemail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'sitecc', 'error')} ">
	<label for="sitecc">
		<g:message code="reportProfile.sitecc.label" default="Sitecc" />
		
	</label>
	<g:field type="email" name="sitecc" value="${reportProfileInstance?.sitecc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'sitefilestore', 'error')} ">
	<label for="sitefilestore">
		<g:message code="reportProfile.sitefilestore.label" default="Sitefilestore" />
		
	</label>
	<g:textField name="sitefilestore" value="${reportProfileInstance?.sitefilestore}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'siteupload', 'error')} required">
	<label for="siteupload">
		<g:message code="reportProfile.siteupload.label" default="Siteupload" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="siteupload" from="${reportProfileInstance.constraints.siteupload.inList}" required="" value="${fieldValue(bean: reportProfileInstance, field: 'siteupload')}" valueMessagePrefix="reportProfile.siteupload"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'sitecolor', 'error')} ">
	<label for="sitecolor">
		<g:message code="reportProfile.sitecolor.label" default="Sitecolor" />
		
	</label>
	<g:textField name="sitecolor" value="${reportProfileInstance?.sitecolor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'sitehtml', 'error')} ">
	<label for="sitehtml">
		<g:message code="reportProfile.sitehtml.label" default="Sitehtml" />
		
	</label>
	<g:select name="sitehtml" from="${reportProfileInstance.constraints.sitehtml.inList}" value="${reportProfileInstance?.sitehtml}" valueMessagePrefix="reportProfile.sitehtml" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'bugzillaproduct', 'error')} ">
	<label for="bugzillaproduct">
		<g:message code="reportProfile.bugzillaproduct.label" default="Bugzillaproduct" />
		
	</label>
	<g:textField name="bugzillaproduct" value="${reportProfileInstance?.bugzillaproduct}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'bugzillacomponent', 'error')} ">
	<label for="bugzillacomponent">
		<g:message code="reportProfile.bugzillacomponent.label" default="Bugzillacomponent" />
		
	</label>
	<g:textField name="bugzillacomponent" value="${reportProfileInstance?.bugzillacomponent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'rtqueue', 'error')} ">
	<label for="rtqueue">
		<g:message code="reportProfile.rtqueue.label" default="Rtqueue" />
		
	</label>
	<g:textField name="rtqueue" value="${reportProfileInstance?.rtqueue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'teamqueueemail', 'error')} ">
	<label for="teamqueueemail">
		<g:message code="reportProfile.teamqueueemail.label" default="Teamqueueemail" />
		
	</label>
	<g:field type="email" name="teamqueueemail" value="${reportProfileInstance?.teamqueueemail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'etherpadurl', 'error')} ">
	<label for="etherpadurl">
		<g:message code="reportProfile.etherpadurl.label" default="Etherpadurl" />
		
	</label>
	<g:field type="url" name="etherpadurl" value="${reportProfileInstance?.etherpadurl}"/>
</div>

