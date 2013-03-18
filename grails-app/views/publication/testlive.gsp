
<!doctype html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
      xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main">

    <title>test makrdown live preview</title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    %{--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>--}%
    <script type="text/javascript" src="js/showdown.js"></script>
    <script type="text/javascript" src="js/highlight.js"></script>
    <script type="text/javascript">
        $(function() {
            var converter = new Showdown.converter();
            $("#user_input").keyup(function(){
                var txt = $("#user_input").val();
                var html = converter.makeHtml(txt);
                $(".wikistyle").html(html)
                $("#entry-container, #user_input").css({
                    height: $(".wikistyle").outerHeight()+40
                })
            });
        });
    </script>
    <style>
    #entry-container {
        float:left;
        width:39%;
        height:100%;
    }
    #entry-container textarea {
        width: 100%;
        height: 100%;
    }
    body #content.site {
        width:auto;
        margin:10px;
    }
    body #preview-container {
        float:right;
        width: 60%;
    }
    body {
        height:100%;
    }
    .info {
        background: black;
        color:white;
        font-size: 0.8em;
        padding: 0.3em;
        margin-bottom:20px;
    }
    .info a {
        color: yellow;
    }
    </style>
</head>
<body>
<div class="navbar1">
    <ul class="nav1">
        <li><a class="home" href="${createLink(uri: '/portfolio/list')}"><g:message code="default.home.label"/></a></li>
        <li><g:link  action="show" controller="portfolio" id="${publicationInstance?.portfolio?.id}"><g:message code="Back to ${publicationInstance?.portfolio?.encodeAsHTML()}" args="[entityName]" /></g:link></li>
        <div id="show-publication" class="content scaffold-show" role="main">
    </ul>
</div>
ian was here
<div id="show-publication" class="content scaffold-show" role="main">
<div id="content" class="site">
    <div id="entry-container">
        <em>Enter Markdown</em>
        <p><textarea id="user_input"></textarea></p>
    </div>
    <div id="preview-container">
        <em>Live preview</em>
        <div id="readme" class="announce md" data-path="/"><div class="wikistyle content-body markdown-body"></div></div>
    </div>
</div>
    </div>
<section>
</body>
</html> 