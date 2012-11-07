<%@ page import="spotlight.content.Pubproduct" %>



<div class="fieldcontain ${hasErrors(bean: pubproductInstance, field: 'pubproduct', 'error')} ">
	<label for="pubproduct">
		<g:message code="pubproduct.pubproduct.label" default="Pubproduct" />
		
	</label>
	<g:textField name="pubproduct" maxlength="100" value="${pubproductInstance?.pubproduct}"/>
</div>

