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
  <legend>Search Reports</legend>
  
  <g:form action="reportresults">
  		<label for="reportName">Report Name</label>
  		<g:textField name="reportName"/>
  		
  	<g:submitButton name="searchreports" value="searchreports"/>
  	</g:form>
  	
  <formset>
  
  </div>
</body>
</html>