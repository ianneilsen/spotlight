<%@ page import="spotlight.content.Pubcategory" %>



<div class="fieldcontain ${hasErrors(bean: pubcategoryInstance, field: 'pubcategory', 'error')} ">
	<label for="pubcategory">
		<g:message code="pubcategory.pubcategory.label" default="Pubcategory" />
		
	</label>
	<g:textField name="pubcategory" maxlength="100" value="${pubcategoryInstance?.pubcategory}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pubcategoryInstance, field: 'publication', 'error')} required">
	<label for="publication">
		<g:message code="pubcategory.publication.label" default="Publication" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="publication" name="publication.id" from="${spotlight.content.Publication.list()}" optionKey="id" required="" value="${pubcategoryInstance?.publication?.id}" class="many-to-one"/>
</div>

