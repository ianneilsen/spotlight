<!-- weblist partial showing list of reporting sites and last 5 reports ordered by lastupdated in asc order-->
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
 <body>

<div class="well well-small">
		<h3>Available sites for external consumption:</h3>
		</div>
			
			<div class="alert alert-info">Permissions apply to <strong>editing</strong> reports or documents.<br>
			<p>Click site name to read or edit reports.</p>
			</div>
	<br>
<div id="show-reportSite" class="content scaffold-show" role="main">
     <ol class="property-list reportSite">
        <ul>
		   <g:each in="${webLists}" status="i" var="rsl">
			<li>Site Name: <g:link action="show" id="${rsl.id }">${rsl.siteName}</g:link></li>
-			<li>Site Description: ${rsl.sdescription }</li>
-			<li>Site Administrator: ${rsl.reportprofile.siteadmin }</li>
<h6>Number of reports: ${reportscount}</h6>
<p>Report count is: ${webreports?.size()}</p>

            					
			<g:if test="${rsl?.reports}">
                <li class="fieldcontain">
					<span id="reports-label" class="property-label"><g:message code="reportSite.reports.label" default="Last 5 Reports:" /></span>
					<g:each in="${rsl.reports}" var="r">
                      	<span class="property-value" aria-labelledby="reports-label"><g:link controller="report" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
			        </g:each>
			    </li>
                </g:if>
---------------------------------------------------------			
			</g:each>
          </ul>
       </ol>

    </div>
  </body>
</html>
