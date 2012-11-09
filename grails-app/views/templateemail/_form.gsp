<%@ page import="spotlight.pubtemplates.Templateemail" %>



<div class="fieldcontain ${hasErrors(bean: templateemailInstance, field: 'tplnameemail', 'error')} required">
	<label for="tplnameemail">
		<g:message code="templateemail.tplnameemail.label" default="Template Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tplnameemail" maxlength="100" required="" value="${templateemailInstance?.tplnameemail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templateemailInstance, field: 'tplcontentemail', 'error')} ">
	<label for="tplcontentemail">
		<g:message code="templateemail.tplcontentemail.label" default="Template Layout" />
		
	</label>
	<g:textArea name="tplcontentemail" cols="40" rows="5" maxlength="1000" value="${templateemailInstance?.tplcontentemail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: templateemailInstance, field: 'portfolio', 'error')} required">
	<label for="portfolio">
		<g:message code="templateemail.portfolio.label" default="Attached to" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="portfolio" name="portfolio.id" from="${spotlight.content.Portfolio.list()}" optionKey="id" required="" value="${templateemailInstance?.portfolio?.id}" class="many-to-one"/>
</div>

