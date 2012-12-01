<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.content.Pubproduct" %>
<%@ page import="spotlight.pubtemplates.Templatepublication" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'publication.label', default: 'Publication')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <script type="text/javascript" src="http://www.google.com/jsapi"></script>
	</head>
	<body>
		<a href="#show-publication" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-publication" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /> for
                <g:if test="${publicationInstance?.portfolio}">
                            <span class="property-value" aria-labelledby="portfolio-label">
                                <g:link controller="portfolio" action="show" id="${publicationInstance?.portfolio?.id}">${publicationInstance?.portfolio?.encodeAsHTML()}</g:link>
                            </span>

                </g:if>
            </h1>
        <!--- error reporting ------------->
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

            <!-- publication nav --------------->
           %{-- <g:render template="emailmodal" />--}%

            <fieldset class="buttons">
                <g:hiddenField name="id" value="${publicationInstance?.id}" />
                <g:link class="edit" action="edit" id="${publicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this publication?')}');" />
                <g:render template="navshow"/>
            </fieldset>

            <!-- publication nav --------------->
      <ol class="property-list publication">
				<g:if test="${publicationInstance?.publicationName}">
				<li class="fieldcontain">
					<span id="publicationName-label" class="property-label"><g:message code="publication.publicationName.label" default="Publication name" /></span>
					
						<span class="property-value" aria-labelledby="publicationName-label"><g:fieldValue bean="${publicationInstance}" field="publicationName"/></span>
					
				</li>
				</g:if>

                <g:if test="${publicationInstance?.pubproduct}">
                    <li class="fieldcontain">
                        <span id="pubproduct-label" class="property-label"><g:message code="pubproduct.pubproduct.label" default="Product" /></span>

                        <g:each in="${publicationInstance.pubproduct}" var="p">
                            <span class="property-value" aria-labelledby="pubtags-label"><g:link controller="pubproduct" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                        </g:each>

                    </li>
                </g:if>


				<g:if test="${publicationInstance?.published}">
				<li class="fieldcontain">
					<span id="published-label" class="property-label"><g:message code="publication.published.label" default="Is Published" /></span>
					
						<span class="property-value" aria-labelledby="published-label"><g:fieldValue bean="${publicationInstance}" field="published"/></span>
					
				</li>
				</g:if>

          <g:if test="${publicationInstance?.publishedemail}">
              <li class="fieldcontain">
                  <span id="publishedemail-label" class="property-label"><g:message code="publication.publishedemail.label" default="Publication emailed" /></span>

                  <span class="property-value" aria-labelledby="publishedemail-label"><g:fieldValue bean="${publicationInstance}" field="publishedemail"/></span>

              </li>
          </g:if>
			
				<g:if test="${publicationInstance?.publisheddate}">
				<li class="fieldcontain">
					<span id="publisheddate-label" class="property-label"><g:message code="publication.publisheddate.label" default="Published date" /></span>
					
						<span class="property-value" aria-labelledby="publisheddate-label"><g:formatDate date="${publicationInstance?.publisheddate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="publication.dateCreated.label" default="Date created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${publicationInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${publicationInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="publication.lastUpdated.label" default="Last updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${publicationInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>



                <g:if test="${publicationInstance?.publicationContent}">
                    <li class="fieldcontain">
                        <span id="publicationContent-label" class="property-label"><g:message code="publication.publicationContent.label" default="Publication content" /></span>

                        <span class="property-value" aria-labelledby="publicationContent-label"><markdown:renderHtml><%=publicationInstance?.publicationContent%></markdown:renderHtml></span>

                    </li>
                </g:if>


				<g:if test="${publicationInstance?.pubtags}">
				<li class="fieldcontain">
					<span id="pubtags-label" class="property-label"><g:message code="publication.pubtags.label" default="Publication tags" /></span>
					
						<g:each in="${publicationInstance.pubtags}" var="p">
						<span class="property-value" aria-labelledby="pubtags-label"><g:link controller="publicationTag" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>


			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${publicationInstance?.id}" />
					<g:link class="edit" action="edit" id="${publicationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you want to delete this publication?')}');" />
                    <a href="#top">Back To Top</a>
                </fieldset>
			</g:form>
		</div>
                              <!-- todo - fix redirect on delete action to redirect to portfolio/show/$id  not list-->
	</body>                   <!-- todo - add in url shortener and published url when user is not logged in based on published flag set to yes. -->
                              <!-- todo - insert document version to show page -maybe aloow a link through to history page -->
</html>                       <!-- todo - http://aehlke.github.com/tag-it/ for jquery tag form field-->
