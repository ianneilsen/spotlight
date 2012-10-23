<%@ page import="spotlight.content.Profile" %>



<div class="fieldcontain ${hasErrors(bean: reportProfileInstance, field: 'portfolioAdmin', 'error')} required">
	<label for="portfolioAdmin">
		<g:message code="reportProfile.portfolioAdmin.label" default="Site Administrator" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="portfolioAdmin" maxlength="80" required="" value="${profileInstance?.portfolioAdmin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfolioEmail', 'error')} required">
	<label for="portfolioEmail">
		<g:message code="reportProfile.portfolioEmail.label" default="Portfolio Email" />
		
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="portfolioEmail" required="" value="${profileInstance?.portfolioEmail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfoliocc', 'error')} ">
	<label for="portfoliocc">
		<g:message code="profile.portfoliocc.label" default="Portfolio CC Email" />
		
	</label>
	<g:field type="email" name="portfoliocc" value="${profileInstance?.portfoliocc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfolioFilestore', 'error')} ">
	<label for="portfolioFilestore">
		<g:message code="profile.portfolioFilestore.label" default="Site file store dir" />
		
	</label>
	<g:textField name="portfolioFilestore" value="${profileInstance?.portfolioFilestore}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'siteupload', 'error')} required">
	<label for="siteupload">
		<g:message code="profile.siteupload.label" default="Allow site uploads" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="siteupload" from="${profileInstance.constraints.siteupload.inList}" required="" value="${fieldValue(bean: profileInstance, field: 'siteupload')}" valueMessagePrefix="profile.siteupload"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfolioColor', 'error')} ">
	<label for="portfolioColor">
		<g:message code="profile.sitecolor.label" default="Site CSS file name" />
		
	</label>
	<g:textField name="portfolioColor" value="${profileInstance?.portfolioColor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfoliohtml', 'error')} ">
	<label for="portfoliohtml">
		<g:message code="profile.portfoliohtml.label" default="Allow html reports" />
		
	</label>
	<g:select name="portfoliohtml" from="${profileInstance.constraints.portfoliohtml.inList}" value="${profileInstance?.portfoliohtml}" valueMessagePrefix="profile.portfoliohtml" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'bugzillaproduct', 'error')} ">
	<label for="bugzillaproduct">
		<g:message code="profile.bugzillaproduct.label" default="Bugzilla Product" />
		
	</label>
	<g:textField name="bugzillaproduct" value="${profileInstance?.bugzillaproduct}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'bugzillacomponent', 'error')} ">
	<label for="bugzillacomponent">
		<g:message code="profile.bugzillacomponent.label" default="Bugzilla Component" />
		
	</label>
	<g:textField name="bugzillacomponent" value="${profileInstance?.bugzillacomponent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'rtqueue', 'error')} ">
	<label for="rtqueue">
		<g:message code="profile.rtqueue.label" default="RT Queue" />
		
	</label>
	<g:textField name="rtqueue" value="${profileInstance?.rtqueue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'teamqueueemail', 'error')} ">
	<label for="teamqueueemail">
		<g:message code="profile.teamqueueemail.label" default="RT team queue email" />
		
	</label>
	<g:field type="email" name="teamqueueemail" value="${profileInstance?.teamqueueemail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'etherpadurl', 'error')} ">
	<label for="etherpadurl">
		<g:message code="profile.etherpadurl.label" default="Etherpad URL for reports" />
		
	</label>
	<g:field type="url" name="etherpadurl" value="${profileInstance?.etherpadurl}"/>
</div>

