<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.bolgs.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.UserDao"%>

<%  User myuser = (User) session.getAttribute("currentUser");
    if (myuser == null) {
        response.sendRedirect("login_page.jsp");
        return;

    }

%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="header-script.jsp" %>
    <title>Profile</title>
    
    <style>
        /* Custom Navbar Styling */
        .navbar-custom {
            background-color: #1565c0;
            height: 100px;
            position: relative;
        }

        /* Profile Section Styling */
        .profile-header {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-top: -40px; /* Negative margin to overlap the navbar */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            z-index: 1;
            position: relative;
        }

        .profile-header img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 3px solid white;
            position: absolute;
            top: -60px; /* This pushes half the profile picture into the navbar */
            left: 50%;
            transform: translateX(-50%);
            z-index: 10; /* Ensures the profile picture stays on top */
        }

        .profile-header h2 {
            margin-top: 60px; /* Adjusted to accommodate profile picture */
            font-size: 24px;
        }

        .badges .badge {
            margin: 10px;
        }

        /* Comment Styling */
        .comments-section {
            margin-top: 20px;
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .card-link{
            text-decoration: none;
              color: inherit;
        }

/*        .comment {
            border-bottom: 1px solid #eee;
            padding: 15px 0;
        }*/

        .comment:last-child {
            border-bottom: none;
        }

       
    </style>
</head>
<body>
    <!--include navbar-->
    <%@include file="components/user-navbar.jsp" %>

    <!-- Navbar -->
    <nav class="navbar navbar-custom"></nav>

    <!-- Main Container -->
    <div class="container">
        <!-- Profile Section -->
        <div class="profile-header">
            <% int userId = Integer.parseInt(request.getParameter("userId")) ;
                UserDao userDao= new UserDao(ConnectionProvider.getCon());
           User user= userDao.getUserById(userId);
           System.out.println(user);
            %>
            
             <img src="pics/<%=user.getProfile()%>" alt="Profile Picture">
            <h2><%= user.getName()%></h2>
            <p><%=user.getAbout()%></p>
            <p><small>Joined on <%=user.getDatetime()%></small></p>
            <!--<button class="btn btn-primary">Follow</button>-->
        </div>

       
      
           

        <!-- Recent Comments Section -->
        <div class="comments-section  mt-5">
            <!--<h3>Recent Post</h3>-->
            
            <div class="all-user-post">
                
                
            </div>
            
            
             <!--loader-->
        <div class="text-center post-loader">
            <div class="spinner-border" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!--loader end-->
        <h3 class="text-center post-data-mgs"></h3>
            
        </div>
        
       
        
    </div>

    <!-- Bootstrap JS -->
    <%@include file="footer-script.jsp" %>
    
    
    <script>
        
        $(document).ready(function(){
            console.log("script of user page.jsp")
        })
        
        
        let offset=0;
        const maxrow=2;
        let postStatus= true;
        
        function getPostByuserId(userId , scrolling= false){
            
            
            $.ajax({
                url:"post_content.jsp",
                data: {userId: userId, offset:offset,maxrow:maxrow},
                
                success:function(data, textStatus, jqXHR){
                    
                     $(".post-data-mgs").hide();
                    
                    if(!scrolling){
                         $(".all-user-post").html(data);
                    }
                    
                    else{
                        
                        if(data.includes("postEmpties")){
                        postStatus=false;
                        $(".post-loader").hide();
                        $(".post-data-mgs").show();
                        $(".post-data-mgs").html("no more post available")
                    }
                    else{
                        $(".all-user-post").append(data);
                        
                    }
                        
                         
                    }
                        
                   
                    console.log("data fetch successfully")
                    offset +=maxrow;
                    
                    
                },
                error:function(jqXHR, textStatus, errorThrown){
                   // console.log(jqXHR.responseText); 
                   // console.log(data);
                        console.log("somthing went to wrong...");
                        console.error("Error occurred:", textStatus, errorThrown);
            console.log("Full response:", jqXHR.responseText);
                        
                    }
            })
            
        }
        
        let isScrolling;
        
        $(window).scroll(function(){
            console.log("i'm bottom");
            
            window.clearTimeout(isScrolling);
    isScrolling = setTimeout(function() {
        if (postStatus) {
            if ($(window).scrollTop() + $(window).height() > $(document).height() - 50) {
                getPostByuserId(<%=userId%>, true);
            }
        }
    }, 200); // 200ms debounce
            
        })
        
        
        
        
        
        $(document).ready(function(){
            getPostByuserId(<%=userId%>);
        })
    
    </script>
    
    </body>
</html>
