<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Pubproduct" %>
<!doctype html>
<html>
	<head>
        <meta name="layout" content="main">
        <r:require modules="uploadr"/>
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
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
%{--<a href="#create-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
        <div class="navbar1">
            <ul class="nav1">
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
<!-- title -->
<div id="create-publication" class="content scaffold-create" role="main">
    <h1 style="font-size: 20px;"><g:message code="default.create.label" args="[entityName]" /></h1>
<!--ERROR msgs -->
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
<!-- publication nav --------------->
<div id="slidenav" style="z-index: 9999">
    <g:form action="save" >
    <fieldset class="buttons">
        <g:submitButton  name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        <g:render template="navedit"/>
    </fieldset>
</div>

<!-- footer nav ------> <!-- todo set default drop down select for publication product to NA -->
            <div id="create-pubproduct" class="content scaffold-create" role="main">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
              <g:hasErrors bean="${pubproductInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${pubproductInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
              </g:hasErrors>
         <div id="contentform">
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>
            <fieldset class="buttons">

                <a href="#top"> Back To Top</a>
            </fieldset>
    </g:form>
        </div>

  </div>

</body>
</html>
