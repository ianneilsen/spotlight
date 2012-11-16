<%--
  Created by IntelliJ IDEA.
  User: ineilsen
  Date: 11/15/12
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta name="layout" content="main">
  <title>Email Publications for </title>
</head>

<body>

<g:form action="emailpublication">
    email address: <input name="email"/><br/>
    name: <input name="name"/><br/>
    <ol class="property-list publication">
        <g:if test="${publicationInstance?.publicationName}">

            <li class="fieldcontain">
                <span class="property-value" aria-labelledby="publicationName-label"><g:fieldValue bean="${publicationInstance}" field="publicationName"/></span>
            </li>
        </g:if>
        <g:if test="${publicationInstance?.publicationContent}">
            <li class="fieldcontain">
                <span class="property-value" aria-labelledby="publicationContent-label"><%=publicationInstance?.publicationContent%></span>

            </li>
        </g:if>
    </ol>


    <input type="submit"/>
</g:form>
</body>
</html>