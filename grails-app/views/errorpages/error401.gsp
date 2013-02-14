<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Error 401</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="HSS UX Team">
<link href="../eso-theme/css/eso-theme.css" rel="stylesheet">
<link href="../eso-theme/images/favicon.ico" rel="shortcut icon">

</head>
<body id='eso-body'>
<div class="eso-inner errorpage">
  <header id='eso-topbar'> 
  <a href="../eso-theme/index.html" title="go back home" class="logo nologo">Engineering Services & Operations</a>
  <a href="https://engineering.redhat.com/hss-portal" class="eso-logo">Developed by HSS</a>
  
    <ul class="quick-menu unstyled">
      <li class="dropdown"> <a href="https://engineering.redhat.com/hss-portal/products/" title="Engineering Services">Engineering Services</a> </li>
      <li class="dropdown header-help"> <a class="dropdown-toggle" data-toggle="dropdown" href="#" title="User Guide">Help<b class="caret"></b></a>
        <ul class="dropdown-menu">
        <li><a href="mailto:hss-rap-list@redhat.com">Report Bug</a></li>
        <li><a href="mailto:hss-rap-list@redhat.com">Contact Developers</a></li>
        <li class="divider"></li>
        <li><a href="mailto:hss-rap@redhat.com">Application Request</a></li>
        <li><a href="mailto:hss-rap@redhat.com">RAP Request</a></li>
        
        
      </ul>
      </li>
    </ul>
  </header>
  <div class="content error-content">
    
	<div class="image-area-401">
    <h2>401 — Kerberos Authentication Failed</h2>
    <p>All Engineering Services secure sites require kerberos forwarding in your browser. Please make sure that you have <a href="https://docspace.corp.redhat.com/docs/DOC-55498">valid Kerberos tickets</a> (obtainable via kinit), and that you have <a href="https://docspace.corp.redhat.com/docs/DOC-43518">configured Firefox correctly</a>. If you are still unable to access this, please contact Engineering Services in IRC on #eng-ops for assistance.</p>
    <h4>Users of Google Chrome can use the following procedure to enable kerberos forwarding:</h4>
    <ol>
    	<li>edit /etc/opt/chrome/policies/managed/redhat-corp.json</li>
        <li>add the following content<p>{ "AuthServerWhitelist": "*.redhat.com",
"AuthNegotiateDelegateWhitelist": "*.redhat.com"
}</p></li>
        <li>save changes</li>
		<li>restart chrome</li>

    </ol>
    </div>
	





  </div>
  <footer class="footer">
    <div class="pull-right">

    <div class="hss-logo"></div>
    <div class='copyright padding-top10'>
      <p>Copyright © 2012,2013 Red Hat, Inc. All rights reserved.</p>
      <p>INTERNAL USE ONLY</p>
    </div>
  </footer>
</div>

<script src="js/lib/jquery-1.7.2.js" ></script>
<script src="js/eso-theme.js" ></script>

</body>
</html>
