
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Comment"%>
<%@page import="com.tech.blog.dao.CommentDao"%>
<%@page import="com.tech.bolgs.helper.ConnectionProvider"%>


<%
    // Set the buffer size to avoid premature output
    //response.setBufferSize(8192);
     
    int postId=0;
    int pOffset=0;
    int pMaxrow=2;
    if(request.getAttribute("pid")!=null)
     postId= (int) request.getAttribute("pid");
     
    if(request.getParameter("pid")!=null){
    postId=Integer.parseInt(request.getParameter("pid"));
    pOffset=Integer.parseInt(request.getParameter("pOffset"));
    pMaxrow= Integer.parseInt(request.getParameter("pMaxrow"));
    
    
    }
    
    
    CommentDao commentDao = new CommentDao(ConnectionProvider.getCon());
    List<Comment> listComment = commentDao.getCommentByPostId(postId,pOffset,pMaxrow);
    if(listComment.isEmpty()){
    
     // Send "empty" as the plain text response
       // response.setContentType("text/plain");
      //  response.getWriter().write("empty");
     //   response.getWriter().flush();
   // response.setContentType("text/plain");
   // response.setContentType("text/html");
    out.println("<h1 hidden >empty</h1>");



    
     
    }
    else{
     //response.setContentType("text/html");
     
     
      UserDao cuserDao= new UserDao(ConnectionProvider.getCon());
     
    
  //  System.out.println("this show page" + listComment);
    for (Comment comment : listComment) {
    
        User cuser= cuserDao.getUserById(comment.getUserId());


%>

<div class="row mt-3">
    <div class="col-1 p-3"><a href="user-page.jsp?userId=<%=cuser.getId()%>"><img src="pics/<%= cuser.getProfile() %>" style="max-width:40px ;  border-radius:50%"></a></div>
    <div class="col-11 mygray p-3 rounded ">  <a href="user-page.jsp?userId=<%=cuser.getId()%>" class="no-under"> <small class="mr-2"><%=cuser.getName() %></small> </a> <small><%=comment.getFormattedTime()%></small>
        <div class="">
            <p class=" mt-0 "> <%= comment.getContent()%> </p>
        </div>

    </div>
</div>

<%
    }
}
%>

