/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Messages;
import com.tech.blog.entities.User;
import com.tech.bolgs.helper.ConnectionProvider;
import com.tech.bolgs.helper.Helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
public class EditServlet extends HttpServlet {

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
            
            String name= request.getParameter("user_name");
            String email= request.getParameter("user_email");
            String about= request.getParameter("user_about");
            
            Part part= request.getPart("user_pic");
            String pic_name= part.getSubmittedFileName();
            
            
            
            HttpSession s=  request.getSession();
            User myuser= (User) s.getAttribute("currentUser");
            myuser.setName(name);
            myuser.setEmail(email);
            myuser.setAbout(about);
            String oldProfile= myuser.getProfile();
            myuser.setProfile(pic_name);
            
            
            UserDao userDao= new UserDao(ConnectionProvider.getCon());
           
            if(userDao.updateUser(myuser)){
                
                String oldPath= request.getRealPath("/")+"pics"+File.separator+oldProfile;
                
                if(!oldPath.equals("default.png")){
                Helper.deleteFile(oldPath);
                }
                String path = request.getRealPath("/")+"pics"+File.separator+myuser.getProfile();
                InputStream is= part.getInputStream();
                Helper.saveFile(is, path);
                
                Messages mgs= new Messages("Profile updated..", "success", "alert-success");
                s.setAttribute("mgs", mgs);
                System.out.println("file upload in folder successfully");
                
                
            }
            else{
                 Messages mgs= new Messages("something went wrong", "error", "alert-danger");
                 s.setAttribute("mgs", mgs);
                System.out.println("something went wrong");
            }
            
            response.sendRedirect("profile_page.jsp");
            
            
            
            
            
           
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
