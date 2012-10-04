<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Report Results</title>
</head>
<body>
  <div class="body">
  <h1>Results</h1>
   
    <p>Searched ${spotlight.content.SiteReport.count()} records for items matching <em>${term}</em>.
       Found <strong>${reports.size()}</strong> hits.
    </p>

    
    <ul>
  	<g:each var="reportName" in="${reports}">
  		<li>${SiteReport.reportName}</li>
    </g:each>
  	</ul>
  	<g:link> action="searchreports">${searchreports}</g:link>
  	  </div>
</body>
</html>