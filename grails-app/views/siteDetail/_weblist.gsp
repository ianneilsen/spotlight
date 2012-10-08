
 <html>
 <meta name="layout" content="main"/>
 <body>
 <br>
  <h1>Site List for app.name TODO - why isnt app.name working from grails app.conf.</h1>
	<p>Click site name to read or edit reports.</p>
		<h6>Permissions apply to <strong>editing</strong> reports or documents.</h6>
	<br>
		<h3>Available sites for internal or external consumption:</h3>
		<br>
<div id="list-siteDetail">
		<g:each in="${weblist}">
			<li>${it.siteName}</li>
		</g:each>
	</ul>
</div>
	
	</body>
</html>
