/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Comment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author skm
 */
public class CommentDao {
 private Connection  con;

    public CommentDao(Connection con) {
        this.con = con;
    }
 
 
    
    public boolean doComment(Comment comment){
      boolean f= false;
      String q= "insert into comments (comment, pid, userId ,date ) values(?, ?,?,?)";
      
      try{
          PreparedStatement pstmt = this.con.prepareStatement(q);
          pstmt.setString(1, comment.getContent());
          pstmt.setInt(2,comment.getPid());
          pstmt.setInt(3,comment.getUserId());
         pstmt.setTimestamp(4, new java.sql.Timestamp(System.currentTimeMillis()));
          pstmt.executeUpdate();
          f=true;
          
      }catch(Exception e){
          e.printStackTrace();
      }
      
        return f;
        
    }
    
     public List<Comment> getCommentByPostId(int id,int offset, int maxrow){
          List<Comment> listComment= new ArrayList<Comment>();
         
          String q= "select * from comments where pid=? order by date desc limit ?,?";
          try{
               PreparedStatement pstmt= this.con.prepareStatement(q);
               pstmt.setInt(1, id);
               pstmt.setInt(2,offset);
               pstmt.setInt(3,maxrow);
               ResultSet set= pstmt.executeQuery();
               while(set.next()){
                   Comment comment= new Comment();
                   comment.setContent(set.getString("comment"));
                   comment.setId(set.getInt("id"));
                   comment.setPid(set.getInt("pid"));
                   comment.setUserId(set.getInt("userId"));  
                   comment.setDate(set.getTimestamp("date"));
                   listComment.add(comment);
                   
               }

              
          }catch(Exception e){
              
              e.printStackTrace();
          }
                   
          
          return listComment;
          
      }
     
     public int countComment(int pid){
         int count=0;
         String q= "select count(*) as total from comments where pid=?";
         try{
             PreparedStatement pstmt= this.con.prepareStatement(q);
             pstmt.setInt(1,pid);
            ResultSet set= pstmt.executeQuery();
            while(set.next()){
                count= set.getInt("total");
            }
             
             
         }catch(Exception e){
             e.printStackTrace();
         }
         
         return count;
     }
     
     
     public boolean deleteAllCommentByPostId(int pid){
         boolean f= false;
         try{
             String q= "delete from comments where pid=?";
             PreparedStatement pstmt = con.prepareStatement(q);
             pstmt.setInt(1, pid);
             pstmt.executeUpdate();
             f= true;
             
         }catch(Exception e){
             e.printStackTrace();
         }
         return f;
     }
    
}
