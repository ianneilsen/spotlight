<%--
  Created by IntelliJ IDEA.
  User: ineilsen
  Date: 11/2/12
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <title>markItUp! Universal markup editor</title>
<g:setProvider library="jquery"/>

    <script type="text/javascript" src="jquery.markdown-editor.js"></script>
</head>

<g:javascript>

        jQuery(document).ready(function($){

            $('.editor').MarkdownEditor();

        });

    </g:javascript>

    <style type="text/css">

    body{
        font: 15px Arial;
        background: #f9f9f9;
    }

    .editor{
        max-width: 700px;
        margin: 40px auto;
        background: #fff;
        padding: 40px;
        border: 1px solid #eee;
    }

        /* clearfix */
    .clear-block:after{
        content:".";
        display:block;
        clear:both;
        visibility:hidden;
        line-height:0;
        height:0;
    }


    .editor .control{
        background-color: #ddd;
        background-image: -khtml-gradient(linear, left top, left bottom, from(#eee), to(#ddd));
        background-image: -moz-linear-gradient(top, #eee, #ddd);
        background-image: -ms-linear-gradient(top, #eee, #ddd);
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #eee), color-stop(100%, #ddd));
        background-image: -webkit-linear-gradient(top, #eee, #ddd);
        background-image: -o-linear-gradient(top, #eee, #ddd);
        background-image: linear-gradient(top, #eee, #ddd);
        color: #333;
        text-decoration: none;
        text-shadow:#fff 0 1px 0;
        border: 1px solid #ddd;
        -webkit-box-shadow: inset 0 1px 0 #f9f9f9;
        -moz-box-shadow: inset 0 1px 0 #f9f9f9;
        box-shadow: inset 0 1px 0 #f9f9f9;
    }

    .editor .control{
        font-size: 11px;
        font-family: Helvetica, Arial;
        font-weight: bold;
        float: left;
        padding: 3px 10px;
        margin: 0 4px 4px 0;
        -moz-border-radius:5px;
        -webkit-border-radius:5px;
        border-radius:5px;
    }

    .editor .control span{
        text-decoration: underline;
    }

    .editor .control.c-bold{font-weight:900;}
    .editor .control.c-italic{font-style: italic;}
    .editor .control.c-link{color: #0066CC;}


    .editor .control:hover{
        cursor: pointer;
        background: #fff;
    }


    </style>
</head>
<body>

<div class="editor">


    <div class="controls clear-block hide-if-no-js">
        <a class="control c-bold" accesskey="b"><strong>B</strong></a>
        <a class="control c-italic" accesskey="i"><em>I</em></a>
        <a class="control c-link" accesskey="a">LINK</a>
        <a class="control c-image" accesskey="m">I<span>m</span>age</a>
        <a class="control c-quote" accesskey="q"><span>Q</span>uote</a>
        <a class="control c-code" accesskey="c"><span>C</span>ode</a>
    </div>

    <textarea rows="16" cols="60"></textarea>

</div>

</body>
</html>