<%--
  Created by IntelliJ IDEA.
  User: ineilsen
  Date: 1/8/13
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>

<xwiki:render inputSyntax="html/4.01" outputSyntax="docbook/4.4"><%=publicationInstance?.publicationContent%></xwiki:render>

</body>
</html>