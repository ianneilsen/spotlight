<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: '')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: '')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: '')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
        <r:require modules="bootstrap"/>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
	  <div id="header-wrapper">
          <div id="inner">
              <div id="left"></div>
 <!--TODO: add in inner right hand log in option , css broken on header inner left and right-->
	    	    <div id="right"></div>
		<div id="spotlightLogo" role="banner"><a href="https://dart.qe.lab.eng.bne.redhat.com/RAP/en-US/Spot_Light/1.0/html-single/Admin_Guide/index.html"><img src="${resource(dir: 'images', file: 'spotlight2_sml.png')}" alt="Red Hat"/></a></div>
		</div>
		</div>

		<div id="maincontent-wrapper">

		<div id="inner-maincontent">

		<g:layoutBody/>
		</div>
		</div>
		<div class="footer" role="contentinfo">
		<div class="footer-inner">
		<div class="footer-left">
		RAP Reporting Tool - Spotlight <g:meta name="app.version"/> on Grails <g:meta name="app.grails.version"/>
		<br>
		Copyright 2012 Red Hat, Inc. All rights reserved.
		<br>INTERNAL USE ONLY</div>
            <div class="footer-right"><a href="https://dart.qe.lab.eng.bne.redhat.com/RAP/en-US/Spot_Light/1.0/html-single/Admin_Guide/index.html"><img src="${resource(dir: 'images', file: 'RAP_logo_col_sml_w.png')}" alt="RAP Team home page"/></a>
		%{--<div class="footer-right">--}%<a href="http://redhat.com"><img style="margin-left: 50px" src="${resource(dir: 'images', file: 'redhatlogofooter.png')}" alt="Red Hat website"/></a>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		</div>
		%{--</div>--}%
		</div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>