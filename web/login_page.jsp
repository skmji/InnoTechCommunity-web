

<%@page import="com.tech.blog.entities.Messages"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
<!--        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        bootstrap
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        icon
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->

          <%@include file="header-script.jsp" %>
        <style>
            .mybanner{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 79%, 81% 89%, 30% 91%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <!--incluede navbar in this page-->
        <%@include file="mynavbar.jsp" %>


        <main class="d-flex align-items-center myprimary mybanner" style="height:80vh">
            <div class="container ">

                <div class="row ">
                    <div class="col-md-4 offset-md-4 ">
                        <div class="card ">
                            <div class="card-header myprimary text-center text-light">
                                <span class="far fa-user-circle fa-3x"></span>
                                <p>login here</p>
                                <!--message-->
                                
                                <%
                                    Messages mgs = (Messages) session.getAttribute("mgs");
                                    if(mgs!=null){
                                    
                                    
                                    
                                    %>
                                
                                    <div class="alert <%= mgs.getCssClass() %> " role="alert">
                                        
                                        <%= mgs.getContent() %>
                                   
                                    
                                </div>
                                    
                                    <% }  session.removeAttribute("mgs");%>

                            </div>
                            <div class="card-body mytext">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label  for="exampleInputPassword1">Password</label>
                                        <input name="user_pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                    </div>
                                    
                                    <div class="container text-center mt-2"> 
                                        <button type="submit" class="btn myprimary text-light">Login</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div> 
                </div>
            </div>

        </main>





        <!--javaScript file-->

<!--        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>-->
<%@include file="footer-script.jsp" %>

        <script>
            $(document).ready(function () {
                console.log("page is ready for you");
            });
        </script>
    </body>
</html>
