<%@ page import="spotlight.User" %>
<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="SpotLight"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${resource(dir: 'images', file: '')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${resource(dir: 'images', file: '')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: '')}">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    %{--<link rel="stylesheet" href="${resource(dir: 'eso-theme/css', file:'eso-theme.css')}" type="text/css">--}%
    <r:require modules="bootstrap"/>
    <g:layoutHead/>
		<r:layoutResources />
</head>
	<body>
        <div id="eso-body">
            <div class="eso-inner">
                <header id="eso-topbar">
                    %{--<a class="logo" title="Home" href="/index.gsp">SpotLight</a>--}%
                    <div class="logo"><img src="${resource(dir: 'images', file: 'test-logo2.png')}"/><a title="Home" href="${createLink(uri: '/portfolio/list')}">Light</a></div>
                   %{-- <a class="eso-logo" href="https://engineering.redhat.com/hss-portal" style="max-width: 100%;"> <img src="${resource(dir: 'images', file: 'header-logo-eso-developed.png')}"/> </a>--}%
                    <ul class="quick-menu unstyled">
                        <li class="dropdown"><a title="HSS RAP Services" href="https://dart.qe.lab.eng.bne.redhat.com/">HSS RAP Services</a> </li>
                            <li class="dropdown header-help">
                                <a class="dropdown-toggle" title="User Guide" href="#" data-toggle="dropdown">Help<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="https://dart.qe.lab.eng.bne.redhat.com/RAP/en-US/Spot_Light/1.0/html-single/Admin_Guide/index.html" title="User Guide"></a> </li>
                                <li class="divider"></li>
                                <li><a href="https://engineering.redhat.com/rt/Ticket/Create.html?Queue=88" target="_blank">RAP Request</a> </li>
                                <li><a href="mailto:hss-rap-list@redhat.com">App Request</a></li>
                                <li class="divider"></li>
                                <li><a href="mailto:hss-rap-list@redhat.com">Contact Dev Team</a></li>
                            </ul>
                        </li>
                        <li class="dropdown header-user"><a class="dropdown-toggle" title="User Info" href="../userprofile"> Hi<a><sec:ifLoggedIn><sec:username/> |<g:link controller="logout" title="Logout">Logout</g:link></sec:ifLoggedIn>
                           <g:link controller="login" action="auth"><sec:ifNotLoggedIn><g:message code="springSecurity.login.header"/></sec:ifNotLoggedIn></g:link></a></li>
                    </ul>
                </header>
            </div>
	  %{--<div id="header-wrapper">--}%
%{--          <div id="inner">
              <div id="left"></div>
	    	    <div id="right"></div>
		<div id="spotlightLogo" role="banner"><a href="https://dart.qe.lab.eng.bne.redhat.com/RAP/en-US/Spot_Light/1.0/html-single/Admin_Guide/index.html"><img src="${resource(dir: 'images', file: 'spotlight2_sml.png')}" alt="Red Hat"/></a></div>
		</div>
		</div>--}%

		<div id="maincontent-wrapper">

		<div id="inner-maincontent">

            <g:layoutBody/>
		</div>
		</div>

		<div class="footer" role="contentinfo">
            <div class="footer-inner">
		        <div class="footer-left">
                    <div class="hss-logo"></div>
                        <div class="copyright">
		                    <p>RAP Reporting Tool - Spotlight <g:meta name="app.version"/></p>
		                    <p> Copyright 2012,2013 Red Hat, Inc. All rights reserved.</p>
                            <p>INTERNAL USE ONLY</p>
                        </div>
                    </div>
                <div class="footer-right"><a href="https://dart.qe.lab.eng.bne.redhat.com/"><img src="${resource(dir: 'images', file: 'RAP_logo_col_sml_w.png')}" alt="RAP Team home page"/></a>
		                                  <a href="http://redhat.com"><img style="margin-left: 50px" src="${resource(dir: 'images', file: 'redhatlogofooter.png')}" alt="Red Hat website"/></a>
                                          <a href="../register/index">Register</a>|<a href="../register/resetPassword">Change Password</a>|


                <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		   </div>
    	  </div>
        </div>
         <g:javascript library="application"/>
        <r:layoutResources/>
	</body>
</html>