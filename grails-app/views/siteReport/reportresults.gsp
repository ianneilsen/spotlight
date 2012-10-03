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
  <p>Searched ${spotlight.content.SiteReport.reportname.count() } records
  for items matching <em>${term}</em>.
  Found <strong>${SiteReport.reportname.size()}</strong> hits.
  </p>
    
    <ul>
  	<g:each var="reportresults" in="${reportresults}">
  		<li>${SiteReport.reportname}</li>
    </g:each>
  	</ul>
  	<g:link> action='searchreports'>Search Again</g:link>
  	  </div>
</body>
</html>