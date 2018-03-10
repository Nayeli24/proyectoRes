<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Simple Ajax</title>
    <g:javascript library="jquery"/>
  </head>
  <body>
    <div id="greetingsBox"></div>
    <g:remoteField controller="greetings" 
       action="welcome" update="greetingsBox"/>
  </body>
</html>