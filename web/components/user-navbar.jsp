<%-- 
    Document   : user-navbar.jsp
    Created on : Sep 18, 2024, 7:59:31 PM
    Author     : skm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--  <nav class="navbar navbar-expand-lg bg-light ">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>InnoTech Community</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class=" container d-flex justify-content-center  ">
                <center>

            <div  class="collapse navbar-collapse  " id="navbarSupportedContent">
                <ul class="navbar-nav justify-content-center">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile_page.jsp"><span class="fa fa-bell-o"></span><i class="fas fa-home"></i><span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Category
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#"><span class="fa fa-vcard" >&nbsp;</span>Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal" ><span class="fa fa-sticky-note" >&nbsp;</span>Do post</a>
                    </li>


                </ul>
                <ul class="navbar-nav nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link " href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user" ></span> <%= myuser.getName()%> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet"><span class="fas fa-sign-out-alt" ></span>Logout</a>
                    </li>

                </ul>
                    
                </center>
            </div>
  </div>
        </nav>
-->


<!-- Navbar -->
  <nav class="navbar navbar-expand-lg  mylight2 ">
    <div class="container-fluid">
      <!-- Left Side (1 Link) -->
     <a class="navbar-brand" href="index.jsp"><i class="fa fa-asterisk text-primary"></i>InnoTech Community</a>

      <!-- Middle Links (Icons) -->
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav mx-auto ">
          <li class="nav-item mx-5">
            <a class="nav-link active" href="profile_page.jsp"><i class="fas fa-home" style='font-size:18px'></i></a>
          </li>
          
          <li class="nav-item mx-5">
            <a class="nav-link" href="#"><i class="fas fa-store"></i></a>
          </li>
          
          <li class="nav-item mx-5">
            <a class="nav-link" href="user-page.jsp?userId=<%=myuser.getId()%>" ><i class="fas fa-user-circle"  style='font-size:20px'></i></a>
          </li>
          
          
        </ul>
      </div>

      <!-- Right Side (1 Link) -->
      <div class="d-flex justify-content-end">
          
       <ul class="navbar-nav ">
                    <li class="nav-item ">
                        <a class="nav-link " href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><img src="pics/<%= myuser.getProfile() %>" style="max-width:40px ;  border-radius:50%"> </a>
                     
                    </li>
                    <li class="nav-item">
                        <a class="nav-link pt-3" href="LogoutServlet"><span class="fas fa-sign-out-alt" ></span>Logout</a>
                    </li>

                </ul>
      </div>
    </div>
  </nav>
