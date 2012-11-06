<%@ page import="spotlight.content.Pubproduct" %>



<div class="fieldcontain ${hasErrors(bean: pubproductInstance, field: 'pubproduct', 'error')} ">
	<label for="pubproduct">
		<g:message code="pubproduct.pubproduct.label" default="Pubproduct" />
		
	</label>
	<g:textField name="pubproduct" maxlength="100" value="${pubproductInstance?.pubproduct}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pubproductInstance, field: 'publication', 'error')} required">
	<label for="publication">
		<g:message code="pubproduct.publication.label" default="Publication" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="publication" name="publication.id" from="${spotlight.content.Publication.list()}" optionKey="id" required="" value="${pubproductInstance?.publication?.id}" class="many-to-one"/>
</div>

