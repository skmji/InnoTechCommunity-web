
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.bolgs.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Messages"%>
<%@page import="com.tech.blog.entities.User" %>
<%  User myuser = (User) session.getAttribute("currentUser");
    if (myuser == null) {
        response.sendRedirect("login_page.jsp");
        return;

    }

%>


<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
       <%@include file="header-script.jsp" %>
  
        <style>
            .mybanner{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 79%, 81% 89%, 30% 91%, 0 100%, 0 0);
            }
        </style>
        
        <style>
            body{
/*                background:  url(img/blue-light2.jpg);
                background-size:cover;
                background-attachment: fixed;*/
            }
            .do-post-card{

                margin-top: 80px; /* Adjust the value as needed */
            }
        </style>
        
        
       

    </head>
    <body class="container mylight">



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

        <!-- profile Modal -->
       
        <%@include file="components/profile-model.jsp" %>
        <!--end profile edit model-->
        

        <!-- Modal for post-->
        <%@include file="components/post-model.jsp" %>


        <!--end model for add post-->




        <main>
            

            <div class="card custom-card container post-body">
                <div class="card-body">
                    <div class="d-flex align-items-center">
                     <a  href="user-page.jsp?userId=<%=myuser.getId()%>" ><img src="./pics/<%=myuser.getProfile()%>" alt="Profile Picture" style="max-width:40px ;  border-radius:50%" class=""></a>
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
                    
                    
                  
            
            
            <div class=" my-5">
                


                <div class=" card container mt-4">
                    <!-- first column -->
                   
                        <div class="list-group p-2 ">
                            <a href="#"  onclick="getPost(0,this)" class="list-group-item  c-link list-group-item-action active">
                                All post
                            </a>
                            <%  PostDao postdao1 = new PostDao(ConnectionProvider.getCon());
                              List <Category> listc = postdao1.getAllCategories();
                              for(Category c: listc){
                              
                            %>
                            <a href="#" onclick="getPost(<%=c.getcId() %>, this)" class="list-group-item c-link list-group-item-action"><%=c.getcName()%></a>
                            
                            <% } %>
                            
                        </div>
                   
                             </div>

                    <!--second column--> 
                  
                           
                            
                            
                        

                    </div>
                            
                            <div  class="container">

                                <div class="container text-center " id="loader">
                                    <i class="fas fa-sync fa-spin fa-4x"> </i>
                                    <h4>loading....</h4>
                                </div>

                                <div  id="post-container">

                                </div>
                                
                                
                                <div class="text-center loader-post">
                                    <div class="spinner-border" role="status">
                                        <span class="sr-only">Loading...</span>
                                    </div>
                                </div>
                                
                                
                                <div class="post-empty-mgs  text-center "></div>


                            </div>




               
            <!--</div>-->



        </main>                    










        <!--javaScript-->
        <%@include  file="footer-script.jsp" %> 
       
        <script>
            $(document).ready(function () {
               

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
        
        
        <script>
            
            let offset=0;
            const maxrow=3;
            let postStatus=true;
            let activeCid=0;
            
                   function getPost(cid,temp, scrolling= false){
                       $(".post-empty-mgs").hide();
                       
                       if(!scrolling){
                           offset=0;
                           activeCid=cid;
                            
                       $("#loader").show();
                      $("#post-container").hide();
                       }
                       
                      
                      
                $.ajax({
                    url: "post_content.jsp",
                    data: {cid: cid, offset:offset, maxrow:maxrow},
                    success:function(data, textStatus, jqXHR){
                        console.log("post come from server");
                        console.log(data);
                       console.log("scrolling status: "+ scrolling)
                        
                        
                        if(data.includes("postEmpties")){
                             $("#loader").hide();
                             $(".loader-post").hide();
                            $(".post-empty-mgs").show();
                          $(".post-empty-mgs").html("no post available");
                            postStatus=false;
                        }
                        else{
                            
                            if(!scrolling){
                                 $("#loader").hide();
                                 $("#post-container").show();
                                 $("#post-container").html(data);
                                 postStatus=true;
                            }
                            else{
                                $("#post-container").append(data);
                            }
                         $(".c-link").removeClass("active");
                  
                        
                        $(temp).addClass("active");
                        offset +=maxrow;
                       
                        
                       console.log("this is my ajax page offset value: "+ offset);
                    }
                    },
                    error:function(jqXHR, textStatus, errorThrown){
                        console.log("somthing went to wrong...");
                        
                    }
                })
                   }
                   
                   
                     // Load more posts when scrolling near the bottom of the page
        let isScrolling;

$(window).scroll(function() {
    window.clearTimeout(isScrolling);
    isScrolling = setTimeout(function() {
        if (postStatus) {
            if ($(window).scrollTop() + $(window).height() > $(document).height() - 50) {
                var myallpostRef = $(".c-link")[0];
                getPost(activeCid, myallpostRef, true);
            }
        }
    }, 200); // 200ms debounce
});

                   
                   
            
        </script>

        <script>
                
            $(document).ready(function(){
                var myallpostRef= $(".c-link")[0];
                getPost(0,myallpostRef);
            })
        </script>


        

    </body>
</html>
