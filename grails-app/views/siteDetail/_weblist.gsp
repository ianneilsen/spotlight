
 <html>
<meta name="layout" content="main">
 <body>
 <br>
  <h1>Site List for <g:meta name="app.name"/>.</h1>
	<p>Click site name to read or edit reports.</p>
		<h6>Permissions apply to <strong>editing</strong> reports or documents.</h6>
	<br>
		<h3>Available sites for internal or external consumption:</h3>
		<br>
<div class="weblist">
<ul id="double">
		<g:each in="${weblist}">
			<li>Site Name: <g:link action="show" params="siteName: currentSiteDetail.sitename">${it.siteName}</g:link></li>
			<li>Site Description: ${it.sdescription }</li>
			<li>Site Admin: ${it.siteprofile.siteadmin }</li>
			<li>Last Report: <g:link controller="SiteReport" action="show">${it.sitereports.reportName}</g:link></li>
		</g:each>
	</ul>
</div>
	
	</body>
</html>
