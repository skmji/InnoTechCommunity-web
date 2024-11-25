<%-- 
    Document   : post_show
    Created on : Aug 13, 2024, 8:23:16 PM
    Author     : skm
--%>
<%@page import="com.tech.blog.entities.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.CommentDao"%>
<%@page import="com.tech.blog.dao.LikedDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.entities.Messages"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.bolgs.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%--<%@page errorPage="error_page.jsp" %>--%>

<%  User myuser = (User) session.getAttribute("currentUser");
    if (myuser == null) {
        response.sendRedirect("login_page.jsp");
        return;

    }

%>

<%
    int postid= Integer.parseInt(request.getParameter("postId"));
    
    PostDao d1= new PostDao(ConnectionProvider.getCon());
      Post p2= d1.getPostUseId(postid);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%= p2.getpTitle()%> </title>
         
        <%@include file="header-script.jsp" %>
        
        <style>
            body{
/*                background:  url(img/blue-light2.jpg);
                background-size:cover;*/
                background-attachment: fixed;
            }
            
            .post-title{
                /*font-weight: 100;*/
                font-size:30px;
                
            }
            
            .user-row{
                border:1px solid #e2e2e2;
                padding-top: 15px;
                
            }
            
            .post-content{
                /*font-weight: 400;*/
                font-size: 20px;
            }
            .post-user-info{
                /*font-weight: 100;*/
                font-size: 20px;
            }
            .post-user-date{
                
                font-weight:bold;
               font-style:italic;
            }
            
            
            
            
            
            
        </style>
        <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v20.0" nonce="MCtLeRnI"></script>

    </head>
    <body>
        
        <!--navbar start-->
         <div class="fixed-top mb-5">
     <%@include file="components/user-navbar.jsp" %>
         </div>
        <!--navbar end-->
        
        
        
        <%  Messages m = (Messages) session.getAttribute("mgs");
            if (m != null) {


        %>
        <div class="alert <%=  m.getCssClass()%>" role="alert">
            <%=m.getContent()%>

        </div>
        <%  session.removeAttribute("mgs");

            }%>

        <!--model-->

        <!-- Modal -->
        <%@include file="components/profile-model.jsp" %>
        <!--end profile edit model-->
        <!-- Button trigger modal -->

        <!-- Modal for post-->
        <%@include file="components/post-model.jsp" %>


        <!--end model for add post-->
        
        
        <main>
            
            
             <div class="card custom-card container post-body">
                <div class="card-body">
                    <div class="d-flex align-items-center p-3">
                        <img src="./pics/<%=myuser.getProfile()%>" alt="Profile Picture" style="max-width:40px ;  border-radius:50%" class="">
                        <input type="button" data-bs-toggle="modal" data-bs-target="#add-post-modal"  class="custom-input ml-3" value="What's on your mind, <%=myuser.getName()%>?">
                    </div>
<!--                    <div class="action-buttons mt-3">
                        <button type="button">
                            <i class="fas fa-video"></i> Live video
                        </button>
                        <button type="button">
                            <i class="fas fa-image"></i> Photo/video
                        </button>
                        <button type="button">
                            <i class="fas fa-smile"></i> Feeling/activity
                        </button>
                    </div>-->
                </div>
            </div>
            
            
            
            
            
            
            
            
            <div class="container  my-4">
                <div class="" >
                    <div class=" post-body  card">
                        <div class="card-header  d-flex justify-content-between align-items-center">
                            <a href="profile_page.jsp"> <i class="fa fa-arrow-left"></i></a>
                            <h4 class="post-title mb-0 mx-auto text-center "> <%= p2.getpTitle()%> </h4>
                        </div>

                        <div class="card-body">
                            
                             
                            <% if (p2.getpPics() != null) {

                            %>
                            <img class="card-img-top my-2" src="./blog_pics/<%=p2.getpPics()%>"  style="max-height: 400px;" alt="Card image cap">

                            <% }%>
                            
                            <div class="row user-row my-3">
                                <% User postuser=d1.getUserByPostId(postid); %>
                                <div class="col-1"> <a href="user-page.jsp?userId=<%=postuser.getId()%>"> <img src="pics/<%=postuser.getProfile()%>" style="max-width:40px ;  border-radius:50%"></a></div>
                                <div class="col-7">
                                    
                                    <p class="post-user-info"><a href="user-page.jsp?userId=<%=postuser.getId()%>" class="no-under"><%= postuser.getName() %></a> </p>
                                </div>
                                <div class="col-4">
                                    <!--<p class="post-user-date" ><%= DateFormat.getDateTimeInstance().format( p2.getpDate()) %></p>-->
                                    <p class="post-user-date" ><%= p2.getFormattedTime() %></p>
                                </div>
                            </div>
                            
                                
                                
                            <p class="post-content"><%=p2.getpContent() %></p>
                            <pre><%= p2.getpCode() %></pre>
                            
                        </div>
                            <div class="card-footer ">
                                
                                
                                 <% LikedDao likedDao= new LikedDao(ConnectionProvider.getCon()); %>
                                 
                                 <% CommentDao commentDao1= new CommentDao(ConnectionProvider.getCon());
                                
                                 %>
                                 
                                
                                 
                                   <a id="like-el"  class="mx-2 no-under" onclick="doLike(<%= p2.getpId()%>, <%= myuser.getId()%>, this)" > <i
                                        class=" <% if (likedDao.isLikedByUser(p2.getpId(), myuser.getId())) {
                                        %>fas fa-heart  liked 
                                        <%} else {%>

                                        far fa-heart 
                                        <%}%>

                                        like-thumb 
                                        " 

                                        style="font-size: 30px"></i> 
                                        <small> likes <small class="like-counts "><%= likedDao.countLikeOnPost(p2.getpId())%></small></small> </a>

                                        
                                 
     <a class="mx-2 text-dark no-under" href="post_show.jsp?postId=<%= p2.getpId()%>&focus=comment-box" class=" text-dark"> <i class="far fa-comment"  style="font-size: 30px; color: gray"></i> <span id="cno"><%= commentDao1.countComment(p2.getpId())%></span> </a>

                                 
                                 <!--<a href="#" id="focus-comment-box" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span class="comment-count"><%= commentDao1.countComment(p2.getpId())%></span> </a>-->


                            </div>
                             
                                <div class="card-footer">
                                    <div class="container">
                                        <form id="add-comment"  action="CommentServlet" method="POST">
                                            <div class="form-group">
                                                <input type="text" name="mypid" value="<%=p2.getpId() %>"  hidden  />
                                                <input type="text" name="myuserId"  value="<%=myuser.getId()%>" hidden  />
                                                
                                                <input type="text" id="comment-box" name="mycomment" placeholder="write a comment.." required class="form-control"/>
                                            </div>
                                                <br><!-- comment -->
                                            <div class="d-flex justify-content-end pb-2">
                                                <button type="reset" class="btn btn-outline-primary ml-5">Cancel</button>
                                                <button type="submit" class="btn btn-outline-primary mr-5 ">Comment</button>
                                            </div>
                                         
                                        </form>
                                        
                                                <div>
                                                    <div class="card">
                                                        <div class="card-body comment-body">

                                                           
                                                           <!--this body content ..comment-->

                                                           

                                                           

                                                        </div>
                                                        
                                                        <small class="comment-mgs text-center p-2"></small>
                                                        
                                                        
                                                        <!--this is loader start-->
                                                        <div class="text-center cloader">
                                                            <div class="spinner-border" role="status">
                                                                <span class="sr-only">Loading...</span>
                                                            </div>
                                                        </div>
                                                        <!--loder end-->
                                                        
                                                       
                                                        
                                                        
                                                        
                                                    </div>

                                                </div>
                                    </div>
                                </div>
                                
                             
                        
                       
                    </div>
                    
                </div>
                
            </div>
                                                
                                                
                                                
                                                
                                                
                                                <!--test-->
                                                
                                                
                                                <!--test-->
            
        </main>
        
        
        <!--javaScript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                console.log("page is ready for you");

                var status = false;
                $("#profile-btn").click(function () {
                    if (status == false) {
                        $("#profile-detail").hide();
                        $("#profile-edit").show();
                        status = true;
                        $(this).text("Back")
                    } else {
                        $("#profile-detail").show();
                        $("#profile-edit").hide();
                        status = false;
                        $(this).text("Edit")
                    }

                })


            });
        </script>


        <!-- script for add post -->

        <script>
            $(document).ready(function () {
                $("#add-post").on("submit", function (event) {
                    event.preventDefault();
                    var fdata = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        data: fdata,
                        type: "post",
                        processData: false,
                        contentType: false,

                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() == "done") {
                                console.log("insert");
                                window.location.href = "user_page.jsp";
                                swal("Good job!", "data insert Successfully", "success");
                                
                                
                                
                            } else if (data.trim() == "file_error") {
                                console.log("file not upload");
                                swal("Opps..", "file not upload", "error");

                            } else {
                                swal("Opps..", "something went worng", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Opps..", "something went worng", "error");
                        }
                    })
                })

            })
        </script>
        
        <!--this ajax for save comment system-->
        
        <script>
        $(document).ready(function(){
            console.log("comment ready...");
            $("#add-comment").on("submit", function(event){
                event.preventDefault();
                var fdata= $(this).serialize();
                console.log(fdata);
                console.log("maine comment ko roka");
                
                $.ajax({
                    url:"CommentServlet",
                    data: fdata,
                    success: function(data,textStatus,jqXHR){
                        console.log("comment sent to  CommentServlet page");
                        
                        $("#cno").html(data.trim());
                        
                        $(document).ready(function(){
               getComment(<%=p2.getpId()%>);
           })
                          
                          console.log("comment data...."+data);
                         
                        
                            $("#add-comment")[0].reset();
                        
                        
                    },
                    error: function(jqXHR, textStatus, errorThrown){
                        console.log("something went worng");
                    }
                    
                })
            })
            
            
        })
        </script>

        <!--this ajax for reload comment-->
        <script>
            let pOffset=0;
            const pMaxrow=2;
            let dataStatus= true;
            
             function getComment(pid , scrolling= false){
                 if(!scrolling){
                     pOffset=0;
                     console.log("pOffset is reset");
                 }
                 
                 $.ajax({
                     
                     url:"comment-box.jsp",
                     data:{pid:pid, pOffset:pOffset, pMaxrow: pMaxrow},
                     
                     success:function(data,textStatus,jqXHR){
                         console.log("get Comment is success ajax is call");
                          console.log("comment data: "+data);
                         if(data.trim()==="<h1 hidden >empty</h1>"){
                             dataStatus=false;
                             console.log("data not found");
                             $(".cloader").hide();
                             $(".comment-mgs").html("more comment not available")
                         }
                         else{
                         $(".cloader").hide();
                          $("#add-comment")[0].reset();
                          
                          if(pOffset==0){
                              $(".comment-body").html(data);
                              dataStatus= true;
                          }
                          else{
                         $(".comment-body").append(data)
                          }
                         
                         
                         
                          console.log("before pOffset value: "+ pOffset);
                         pOffset += pMaxrow;
                         console.log("updated pOffset value: "+ pOffset);
                         
                        }
                         
                          
                     },
                     error: function(jqXHR, textStatus, errorThrown){
                         console.log("some thing went wrong");
                     }
                     
                 })
                 
        }
        
//        scrole reload comment

$(window).scroll(function(){
            console.log("scroll continue..");
            console.log( "window scrollTop: "+ $(window).scrollTop());
            console.log( "window height: "+ $(window).height());
            console.log("document height: "+ $(document).height());
            console.log("---------------");
            
            console.log($(window).scrollTop()+$(window).height());
          console.log($(document).height()-100);
            
           if(dataStatus){
               
           if($(window).scrollTop()+$(window).height() >  $(document).height()-50){
                 $(".cloader").show(); 
               setTimeout(()=>{
                 
                      getComment(<%=p2.getpId()%> ,true); 
              
                  
               },1000);
               
               console.log("current data status: "+ dataStatus);
              
               console.log(" yes i'm bottom");
           }
           
           }
            
            
        })
        
        
        
        
        
        
            
        </script>
        
        
        <script>
           $(document).ready(function(){
               getComment(<%=p2.getpId() %>);
           })
        </script>
        
        <!--script form focus comment box-->
        
        <script>
            $(document).ready(function(){
                
                 $("#focus-comment-box").click(function(e){
                e.preventDefault();
                $("#comment-box").focus();
               
            })
                
            })
                
           
        </script>
        
       
        <script>
    $(document).ready(function() {
        // Get URL parameters
        const urlParams = new URLSearchParams(window.location.search);
        const focusElement = urlParams.get('focus');

        // Focus the input box if the parameter 'focus' is 'comment-box'
        if (focusElement === 'comment-box') {
            $('#comment-box').focus();
        }
    });
        </script>
        
        
        
        
        
     
        

        <!--scroll comment load-->
        <script>
            
        
        
        
        </script>
        
        
        
        
        
        
        
    </body>
</html>
