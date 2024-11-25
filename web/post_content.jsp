<%@page import="com.tech.blog.dao.CommentDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikedDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.bolgs.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
 <%@include file="/components/update-post.jsp" %>

    
    <%  User myuser = (User) session.getAttribute("currentUser");
    if (myuser == null) {
        response.sendRedirect("login_page.jsp");
        return;

    }

%>




    <% 
       // response.setBufferSize(8192);
        
        Thread.sleep(500);
        PostDao postdao= new PostDao(ConnectionProvider.getCon());
        
       
        int offset = Integer.parseInt(request.getParameter("offset"));
           
            int maxrow = Integer.parseInt(request.getParameter("maxrow"));
          
        
             List <Post> list=null;
             int userId=-1;
             int cid=-1;
       
           if (request.getParameter("cid") != null) {
               cid = Integer.parseInt(request.getParameter("cid"));

           }

           if (request.getParameter("userId") != null) {
               userId = Integer.parseInt(request.getParameter("userId"));
           }
           if(userId > -1){
           System.out.println("post content page  all post fetch by userId");
           list=postdao.getAllPostByUserId(userId,offset,maxrow);
        }
    
          
    //when request through category id
        if (cid > -1) {

                if (cid == 0) {
                    list = postdao.getAllPost(offset, maxrow);

                } else {
                    list = postdao.getPostById(cid, offset, maxrow);
                }
            }
        
        if(list.isEmpty()){
       //out.println("postEmpty");
        // Send "empty" as the plain text response
//        response.setContentType("text/plain");
     response.getWriter().write("postEmpties");
//        response.getWriter().flush();
   
       
        return;
        
        }
        
        
        for(Post p: list){
        
      
        
    %>
    <div class="">
    <div class="mb-3">
        <div class="card" >
           
            
            <div class="card-body">
                <% if (p.getpPics() != null) {
                        
                %>
                <img class="card-img-top mb-2" src="./blog_pics/<%=p.getpPics()%>" style="height:200px; object-fit:cover;" alt="Card image cap">
                <% } %>
                
                <% User postUser= postdao.getUserByPostId(p.getpId()); %>
                
                <div class="row">
                    <div class="col-1">
                        <img src="pics/<%=postUser.getProfile()%>" style="max-width:40px ;  border-radius:50%">
                    </div>
                    <div class="col-11"> 
                        <a href="user-page.jsp?userId=<%=postUser.getId()%>" class="no-under"><small><%=postUser.getName()%></small> </a>
                        <br>
                        <small><%=p.getFormattedTime() %></small>
                        <br>
                        <b><h1 class=""><%= p.getpTitle()%></h1></b>
                        
                        <!--like or comment btn-->
                        <div class="">
                            <% LikedDao likedDao = new LikedDao(ConnectionProvider.getCon()); %>
                            <% CommentDao commentDao1 = new CommentDao(ConnectionProvider.getCon());

                            %>
                            
                            <div class="container mt-2    d-flex ">

                                <a id="like-el"  class="mx-2 no-under " onclick="doLike(<%= p.getpId()%>, <%= myuser.getId()%>, this)"  > <i
                                        class=" <% if (likedDao.isLikedByUser(p.getpId(), myuser.getId())) {
                                        %>fas fa-heart  liked 
                                        <%} else {%>

                                        far fa-heart 
                                        <%}%>

                                        like-thumb 
                                        " 

                                        style="font-size: 30px"></i> 
                                        <small> likes <small class="like-counts"><%= likedDao.countLikeOnPost(p.getpId())%></small></small> </a>

                                        
                                        
                                        
                                        
                                        
                                <a class="mx-2 text-dark no-under" href="post_show.jsp?postId=<%= p.getpId()%>&focus=comment-box" class=""> <i class="far fa-comment" style="font-size: 30px; color:gray;"></i> <span><%= commentDao1.countComment(p.getpId())%></span> </a>
                                <a  class="mx-2 text-dark" href="post_show.jsp?postId=<%= p.getpId()%>" class="text-dark"><i class="fas fa-chevron-down" style="font-size: 30px; color:gray;"></i> </a>

                                
                               
                                
                                <!--more features--> 

                                <div class="dropdown">
                                    <button class="btn btn-drop dropdown-toggle no-caret" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h" ></i> <!-- Three dots icon -->
                                    </button>
                                    
                                   
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        

                                      <% if(myuser.getId()== postUser.getId()) { 

                                      %>
                                       <a class="dropdown-item" href="" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                           onclick="triggerToModal(<%= p.getpId()%>, '<%= p.getpTitle().replace("'", "\\'")%>', '<%= p.getpContent().replace("'", "\\'").replaceAll("\n", "\\\\n").replaceAll("\r", "")%>')">
                                            <i class="far fa-edit"></i> Edit 
                                        </a>
                                         <% } %>
                                        
                                         
                                         <% if(myuser.getId()== postUser.getId()) { 

                                      %>
                                        
                                      <a class="dropdown-item" href="" onclick="postDelete(<%= p.getpId()  %>)"><i class="far fa-trash-alt"></i> Delete</a>
                                        
                                        
                                        <% }%>
                                        
                                        
                                            <a class="dropdown-item" href="#"><i class="fas fa-store"></i> Save Post</a>
                                        
                                       
                                    </div>
                                </div>
                                </br> </br>




                                <!--more features btn end-->
                            </div>
                            
                            
                        


                        </div>
                        <!--end like or comment btn-->
                        
                        
                       
                         
                    </div>
                                
                                <%
                                    // Set the dynamic data as a request attribute
                                    request.setAttribute("pid", p.getpId());
                                   
                                %>

                        
                        
                        
                        <%@ include file="comment-box.jsp" %>
                </div>

               
                
                
                
                
                

            </div>

            

        </div>
    </div>
</div>

    <% } %>
    
    
    
    

    
