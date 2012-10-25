<%@ page import="spotlight.content.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfolioAdmin', 'error')} required">
	<label for="portfolioAdmin">
		<g:message code="profile.portfolioAdmin.label" default="Portfolio Admin" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="portfolioAdmin" maxlength="80" required="" value="${profileInstance?.portfolioAdmin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfolioEmail', 'error')} required">
	<label for="portfolioEmail">
		<g:message code="profile.portfolioEmail.label" default="Portfolio Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="portfolioEmail" required="" value="${profileInstance?.portfolioEmail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfoliocc', 'error')} ">
	<label for="portfoliocc">
		<g:message code="profile.portfoliocc.label" default="Portfoliocc" />
		
	</label>
	<g:field type="email" name="portfoliocc" value="${profileInstance?.portfoliocc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfolioColor', 'error')} ">
	<label for="portfolioColor">
		<g:message code="profile.portfolioColor.label" default="Portfolio Color" />
		
	</label>
	<g:textField name="portfolioColor" value="${profileInstance?.portfolioColor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfoliohtml', 'error')} ">
	<label for="portfoliohtml">
		<g:message code="profile.portfoliohtml.label" default="Portfoliohtml" />
		
	</label>
	<g:select name="portfoliohtml" from="${profileInstance.constraints.portfoliohtml.inList}" value="${profileInstance?.portfoliohtml}" valueMessagePrefix="profile.portfoliohtml" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'siteupload', 'error')} required">
	<label for="siteupload">
		<g:message code="profile.siteupload.label" default="Siteupload" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="siteupload" from="${profileInstance.constraints.siteupload.inList}" required="" value="${fieldValue(bean: profileInstance, field: 'siteupload')}" valueMessagePrefix="profile.siteupload"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfolioFilestore', 'error')} ">
	<label for="portfolioFilestore">
		<g:message code="profile.portfolioFilestore.label" default="Portfolio Filestore" />
		
	</label>
	<g:textField name="portfolioFilestore" value="${profileInstance?.portfolioFilestore}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'bugzillaproduct', 'error')} ">
	<label for="bugzillaproduct">
		<g:message code="profile.bugzillaproduct.label" default="Bugzillaproduct" />
		
	</label>
	<g:textField name="bugzillaproduct" value="${profileInstance?.bugzillaproduct}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'bugzillacomponent', 'error')} ">
	<label for="bugzillacomponent">
		<g:message code="profile.bugzillacomponent.label" default="Bugzillacomponent" />
		
	</label>
	<g:textField name="bugzillacomponent" value="${profileInstance?.bugzillacomponent}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'rtqueue', 'error')} ">
	<label for="rtqueue">
		<g:message code="profile.rtqueue.label" default="Rtqueue" />
		
	</label>
	<g:textField name="rtqueue" value="${profileInstance?.rtqueue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'teamqueueemail', 'error')} ">
	<label for="teamqueueemail">
		<g:message code="profile.teamqueueemail.label" default="Teamqueueemail" />
		
	</label>
	<g:field type="email" name="teamqueueemail" value="${profileInstance?.teamqueueemail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'etherpadurl', 'error')} ">
	<label for="etherpadurl">
		<g:message code="profile.etherpadurl.label" default="Etherpadurl" />
		
	</label>
	<g:field type="url" name="etherpadurl" value="${profileInstance?.etherpadurl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'portfolio', 'error')} required">
	<label for="portfolio">
		<g:message code="profile.portfolio.label" default="Portfolio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="portfolio" name="portfolio.id" from="${spotlight.content.Portfolio.list()}" optionKey="id" required="" value="${profileInstance?.portfolio?.id}" class="many-to-one"/>
</div>
