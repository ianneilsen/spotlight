<%@ page import="spotlight.content.Publication" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
   <!-- markItUp! skin -->
        <link rel="stylesheet" href="${resource(dir: 'markitup/skins/markitup/', file: 'style.css')}" type="text/css">
   <!--  markItUp! toolbar skin -->
        <link rel="stylesheet" href="${resource(dir: 'markitup/sets/default/', file: 'style.css')}" type="text/css">
   <!-- markItUp! -->
        <g:javascript src="markitup/jquery.markitup.js"/>
   <!-- markItUp! toolbar settings -->
        <g:javascript src="markitup/sets/default/set.js"/>
	</head>
	<body>
<!-- top  main navigation --------------------------->
		<a href="#edit-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>                                      <!-- todo- top update button not saving changes??  -->
		</div>
<!-- top menu path for edit and delete of docs -->
    <g:form method="post" >
        <g:hiddenField name="id" value="${publicationInstance?.id}" />
        <g:hiddenField name="version" value="${publicationInstance?.version}" />
        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            <a href="#bottom">To Bottom page</a>
<!--markuphelp  partial page in inner navigation to use twitter javascript to produce a pop-up to show mark help through partial view gsp -->
            <a href="/publication/markdownHelp" role="button" class="btn btn-info" data-toggle="modal">Markdown Help</a>
        </fieldset>
    </g:form>
<!-- error spring stuff -------------------->
		<div id="edit-publication" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
<!----------- footer form buttons ------>
			<g:form method="post" >
				<g:hiddenField name="id" value="${publicationInstance?.id}" />
				<g:hiddenField name="version" value="${publicationInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <a href="#top">Back To Top</a>
                </fieldset>
			</g:form>
		</div>
<!------js for makritup  jquery script --------------->
    <g:javascript>
        $(function() {
            // Add markItUp! to your textarea in one line
            // $('textarea').markItUp( { Settings }, { OptionalExtraSettings } );
            $('#markituptext').markItUp(mySettings);



            // You can add content from anywhere in your page
            // $.markItUp( { Settings } );
            $('.add').click(function() {
                $('#markituptext').markItUp('insert',
                        { 	openWith:'<opening tag>',
                            closeWith:'<\/closing tag>',
                            placeHolder:"New content"
                        }
                );
                return false;
            });

            // And you can add/remove markItUp! whenever you want
            // $(textarea).markItUpRemove();
            $('.toggle').click(function() {
                if ($("#markituptext.markItUpEditor").length === 1) {
                    $("#markituptext").markItUp('remove');
                    $("span", this).text("get markItUp! back");
                } else {
                    $('#markituptext').markItUp(mySettings);
                    $("span", this).text("remove markItUp!");
                }
                return false;
            });
        });
    </g:javascript>
	</body>
</html>
