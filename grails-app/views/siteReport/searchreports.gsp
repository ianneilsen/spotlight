<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Search Reports]</title>
</head>
<body>
  <div class="body">
  <formset>
  <legend>Search Reports within</legend>
  
  <g:form action="searchreports">
  		<label for="reportname">Report Name</label>
  		<g:textField name="reportname"/>
  		
  	<g:submitButton name="reportresults" value="reportresults"/>
  	</g:form>
  	
  <formset>
  
  </div>
</body>
</html>