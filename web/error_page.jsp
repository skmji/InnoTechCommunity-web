<%-- 
    Document   : error_page
    Created on : 22-Jun-2024, 10:31:31 am
    Author     : Sanjay maurya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>somthing went worng...</title>
          <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <!--bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--icon-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .mybanner{
             clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 79%, 81% 89%, 30% 91%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" alt="alt"/>
            <h3  class="display-3">Something went worng...</h3>
            <%= exception %>
            <br>
            
            <a href="index.jsp" class="btn myprimary text-white p-2 mt-3">Go to home page </a>
            
        </div>
        
    </body>
</html>
