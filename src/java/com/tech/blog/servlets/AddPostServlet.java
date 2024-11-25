  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.bolgs.helper.ConnectionProvider;
import com.tech.bolgs.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Sanjay maurya
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int pId=-1;
            int userId=-1;
            Post post= null;
            if(request.getParameter("pid")!=null){
                pId= Integer.parseInt(request.getParameter("pid"));
            }
            
             String pTitle= request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode= request.getParameter("pCode");
            Part part = request.getPart("pPic");
            
                        String fname = null;
            if (part != null && part.getSize() > 0) {
                fname = part.getSubmittedFileName(); // Get the file name if it exists
            }
            
            
            if(pId>0){
                 post = new Post();
                 post.setpId(pId);
                 post.setpTitle(pTitle);
                 post.setpContent(pContent);
                post.setpCode(pCode);
                post.setpPics(fname);
                
            }
            else{
                 int cId = Integer.parseInt(request.getParameter("cId"));
                HttpSession session = request.getSession();
                User user = (User) session.getAttribute("currentUser");
                 userId = user.getId();
                 post = new Post(pTitle, pContent, pCode, fname, null,cId,userId);
                 
            }
            
        
           
           
           PostDao postDao= new PostDao(ConnectionProvider.getCon());
           if(postDao.addPost(post)){
               String path = request.getRealPath("")+"blog_pics"+File.separator+fname;
              if( Helper.saveFile(part.getInputStream(),path))
               out.println("done");
              else
                  out.println("file_error");
               
           }
           else {
               out.println("error");
           }
           
           
           
           
            
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}



