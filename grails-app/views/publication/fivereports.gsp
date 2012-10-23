<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
 <br>
 <br>
 <br>
<div>
<g:link controller="SiteReport" action="fivereports">Report Name</g:link>

<ul>
<g:each var="r" in="${SiteReport }">
<li>Report Name ${r.reportName }</li>
</g:each>
</ul>
  
  </div>
  </div>
</body>
</html>