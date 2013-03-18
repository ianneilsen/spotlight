<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Portfolio" %>
<%@ page import="spotlight.pubtemplates.Templatepublication" %>
<%@ page import="spotlight.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
        <r:require modules="uploadr"/>
    		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>

        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
        <script type="text/javascript" src="js/livepreview/markdown.js"></script>
        <script type="text/javascript" src="js/livepreview/main.js"></script>
        <link rel="stylesheet" type="text/css" href="css/livepreview/style.css">
        <link rel="stylesheet" type="text/css" href="css/livepreview/github.css">
        <script type="text/javascript" src="js/livepreview/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" src="js/livepreview/jquery.autosize-min.js"></script>

<g:javascript>/****************************************
         * Floating Navigation jQuery feature
         ****************************************/
        $(function() {

            // get initial top offset of navigation
            var floating_navigation_offset_top = $('#slidenav').offset().top;

            // define the floating navigation function
            var floating_navigation = function(){
                // current vertical position from the top
                var scroll_top = $(window).scrollTop();

                // if scrolled more than the navigation, change its
                // position to fixed to float to top, otherwise change
                // it back to relative
                if (scroll_top > floating_navigation_offset_top) {
                    $('#slidenav').css({ 'position': 'fixed', 'top':0});
                } else {
                    $('#slidenav').css({ 'position': 'relative' });
                }
            };
            // run function on load
            floating_navigation();
            // run function every time you scroll
            $(window).scroll(function() {
                floating_navigation();
            });

        });</g:javascript>

</head>
<body>
<!-- TOP NAV ---->
<a href="#edit-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="navbar1">
            <ul class="nav1">
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
						</ul>
		</div>
<div id="edit-publication" class="content scaffold-edit" role="main">
    <h4><g:message code="Edit publication" args="[entityName]" /></h4>

<!-- ERROR msg---->
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${publicationInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${publicationInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

<!-- page NAV edit-delete----------------->
<div id="slidenav" style="z-index: 9999">
    <g:form method="post" >
        <g:hiddenField name="id" value="${publicationInstance?.id}" />
        <g:hiddenField name="version" value="${publicationInstance?.version}" />
            <fieldset class="buttons">
                <g:actionSubmit id="contentform" class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                <g:actionSubmit id="contentform" class="delete" action="delete" value="delete" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                <g:render template="navedit"/>
            </fieldset>
 </div>
<!-- footer form buttons ------>
        <div id="contentform">
        <fieldset class="form">
		    <g:render template="form"/>
		</fieldset>
           <fieldset class="buttons">
                <a href="#top"> Back To Top</a>
            </fieldset>
        </div>
    </g:form>
</div>

</body>

</html>
