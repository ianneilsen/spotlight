<%@ page import="spotlight.content.Publication" %>
<%@ page import="spotlight.comments.Authorcomment" %>


    <g:each in="${publicationInstance.comments}" status="i" var="publicantioncomments">
        <ol>
        <li><${publicationInstance.comments.authorcomments}</br>Comment by:${publicantioncomments.authors}</li>
        </ol>

    </g:each>
