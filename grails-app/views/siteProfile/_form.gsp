<%@ page import="spotlight.content.SiteProfile" %>



<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'siteadmin', 'error')} required">
	<label for="siteadmin">
		<g:message code="siteProfile.siteadmin.label" default="Siteadmin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="siteadmin" maxlength="80" required="" value="${siteProfileInstance?.siteadmin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'siteemail', 'error')} required">
	<label for="siteemail">
		<g:message code="siteProfile.siteemail.label" default="Siteemail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="siteemail" required="" value="${siteProfileInstance?.siteemail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'sitecc', 'error')} ">
	<label for="sitecc">
		<g:message code="siteProfile.sitecc.label" default="Sitecc" />
		
	</label>
	<g:field type="email" name="sitecc" value="${siteProfileInstance?.sitecc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'sitefilestore', 'error')} ">
	<label for="sitefilestore">
		<g:message code="siteProfile.sitefilestore.label" default="Sitefilestore" />
		
	</label>
	<g:textField name="sitefilestore" value="${siteProfileInstance?.sitefilestore}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'siteupload', 'error')} required">
	<label for="siteupload">
		<g:message code="siteProfile.siteupload.label" default="Siteupload" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="siteupload" from="${siteProfileInstance.constraints.siteupload.inList}" required="" value="${fieldValue(bean: siteProfileInstance, field: 'siteupload')}" valueMessagePrefix="siteProfile.siteupload"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'sitecolor', 'error')} ">
	<label for="sitecolor">
		<g:message code="siteProfile.sitecolor.label" default="Sitecolor" />
		
	</label>
	<g:textField name="sitecolor" value="${siteProfileInstance?.sitecolor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'sitehtml', 'error')} ">
	<label for="sitehtml">
		<g:message code="siteProfile.sitehtml.label" default="Sitehtml" />
		
	</label>
	<g:textField name="sitehtml" value="${siteProfileInstance?.sitehtml}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'bugzillaproduct', 'error')} ">
	<label for="bugzillaproduct">
		<g:message code="siteProfile.bugzillaproduct.label" default="Bugzillaproduct" />
		
	</label>
	<g:textField name="bugzillaproduct" value="${siteProfileInstance?.bugzillaproduct}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'bugzillacomponent', 'error')} ">
	<label for="bugzillacomponent">
		<g:message code="siteProfile.bugzillacomponent.label" default="Bugzillacomponent" />
		
	</label>
	<g:textField name="bugzillacomponent" value="${siteProfileInstance?.bugzillacomponent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'rtqueue', 'error')} ">
	<label for="rtqueue">
		<g:message code="siteProfile.rtqueue.label" default="Rtqueue" />
		
	</label>
	<g:textField name="rtqueue" value="${siteProfileInstance?.rtqueue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: siteProfileInstance, field: 'teamqueueemail', 'error')} ">
	<label for="teamqueueemail">
		<g:message code="siteProfile.teamqueueemail.label" default="Teamqueueemail" />
		
	</label>
	<g:textField name="teamqueueemail" value="${siteProfileInstance?.teamqueueemail}"/>
</div>

