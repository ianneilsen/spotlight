<%@ page import="spotlight.pubtemplates.Emailtemplate" %>



<div class="fieldcontain ${hasErrors(bean: emailtemplateInstance, field: 'nameemailtemplate', 'error')} required">
	<label for="nameemailtemplate">
		<g:message code="emailtemplate.nameemailtemplate.label" default="Template Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField style="width: 400px;" name="nameemailtemplate" maxlength="100" required="" value="${emailtemplateInstance?.nameemailtemplate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailtemplateInstance, field: 'toemailtemplate', 'error')} required">
	<label for="toemailtemplate">
		<g:message code="emailtemplate.toemailtemplate.label" default="Email To:" />
		<span class="required-indicator">*</span>
	</label>
	<g:field style="width: 400px;" type="string" name="toemailtemplate" maxlength="250" required="" value="${emailtemplateInstance?.toemailtemplate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailtemplateInstance, field: 'ccemailtemplate', 'error')} ">
	<label for="ccemailtemplate">
		<g:message code="emailtemplate.ccemailtemplate.label" default="Email CC:" />
		
	</label>
	<g:field style="width: 400px;" type="string" name="ccemailtemplate" maxlength="250" value="${emailtemplateInstance?.ccemailtemplate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailtemplateInstance, field: 'contentemailtemplate', 'error')} ">
	<label for="contentemailtemplate">
		<g:message code="emailtemplate.contentemailtemplate.label" default="Header of email" />
		
	</label>
	<g:textArea style="width: 400px;" name="contentemailtemplate" cols="70" rows="5" maxlength="500" value="${emailtemplateInstance?.contentemailtemplate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailtemplateInstance, field: 'footeremailtemplate', 'error')} ">
	<label for="footeremailtemplate">
		<g:message code="emailtemplate.footeremailtemplate.label" default="Footer of email" />
		
	</label>
	<g:textArea style="width: 400px;" name="footeremailtemplate" cols="40" rows="5" maxlength="500" value="${emailtemplateInstance?.footeremailtemplate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailtemplateInstance, field: 'portfolio', 'error')} required">
	<label for="portfolio">
		<g:message code="emailtemplate.portfolio.label" default="Portfolio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="portfolio" name="portfolio.id" from="${spotlight.content.Portfolio.list()}" optionKey="id" required="" value="${emailtemplateInstance?.portfolio?.id}" class="many-to-one"/>
</div>

