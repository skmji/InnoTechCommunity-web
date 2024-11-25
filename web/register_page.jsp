
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register page</title>
        <!--css link-->
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
        <%@include file="mynavbar.jsp" %>

        <main class=" p-2 myprimary  mybanner  " style="height: 100vh" >
            <div class="container ">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div  class="card-header text-center myprimary" >
                                <span class="fa fa-user-circle-o fa-3x"></span>
                                <p>Sign up</p>
                                
                                
                            </div>
                            <div class="card-body mytext">
                                <form id="reg" action="RegisterServlet" method="post">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" id="username" name="user_name"  placeholder="Enter name">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="user_pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="male">male</label>
                                        <input type="radio" id="male" value="male" name="gender">
                                        <label for="female">female</label>
                                        <input type="radio" id="female" value="female" name="gender">
                                    </div>
                                    
                                    <div class="form-group">
                                        <textarea  name="user_about" class="form-control" placeholder="Enter somthing about yourself
                                                  "></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" name="terms" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">agree terms and condition</label>
                                    </div>
                                    <div class="loader text-center" style="display:none"> 
                                        <span class="fa fa-refresh fa-4x fa-spin"></span>
                                    </div>
                                    <div class="container text-center mt-3 " >
                                    <button type="submit" id="sbtn" class="btn myprimary form-control text-light">Sign Up</button>
                                    </div>
                                </form>

                            </div>
                           
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
        </main>
        
        
        
        <!--java script code-->
        
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--<script src="js/myjs.js" type="text/javascript"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" ></script>

        <script>
           $(document).ready(function(){
               console.log("document is ready for you");
               
               $("#reg").on('submit', function(event){
                   event.preventDefault();
                   //hide button and display loader
                   $(".loader").show();
                   $("#sbtn").hide();
                   
                   var f= new FormData(this);
                  $.ajax({
                      url:"RegisterServlet",
                      data: f,
                      type:"post",
                      success: function(data,testStatus,jqXHR){
                          console.log(data);
                          if(data.trim()==='done'){
                                 //hide button and display loader
                                 $(".loader").hide();
                                  $("#sbtn").show();
                                  swal("Good job!", "Register SuccessfullY.. You are going to loin page", "success").then((value) => {
                                     window.location.assign("login_page.jsp");
                              });
                              
                              
                              console.log("successfully data insert");
                          }
                          else{
                               //hide button and display loader
                                 $(".loader").hide();
                                  $("#sbtn").show();
                                  swal("OOps...", "Something went wrong", "error");
                                  

                                  
                              console.log("somthing went worng try to again");
                              
                          }
                          
                          
                      },
                      error: function(jqXHR,testStatus, errorThrown){
                          console.log("somthin went worng");
                           //hide button and display loader
                                 $(".loader").hide();
                                  $("#sbtn").show();
                      },
                      processData: false,
                      contentType: false
 
                      
                  
                      
                  });
               });
               
               console.log("endfunction");
               
           }); 
        </script>
    </body>
</html>
