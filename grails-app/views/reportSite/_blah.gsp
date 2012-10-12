<div class="well well-small">
		<h3>blah info:</h3>
		</div>
			

<ol >
<ul>
		<g:each in="${blah}" status="i" var="rsl">
			<li>Site Name: ${rsl.siteName}</li>
-			<li>Site Description: ${rsl.sdescription }</li>
-			<li>Site Administrator: ${rsl.reportprofile.siteadmin }</li>
<li> reports: ${rsl.reports.reportName?.encodeAsHTML() }</li>
					

---------------------------------------------------------			
			
	   </g:each>
</ul>
</ol>

