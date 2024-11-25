/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import java.sql.*;
/**
 *
 * @author skm
 */
public class LikedDao {
   private Connection con;

    public LikedDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean addLike(int pid, int userId){
        boolean f=false;
        String q= "insert into post_likes (pid, userId)  values (?,?)";
        
        
        try{
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1,pid);
            pstmt.setInt(2,userId);
            pstmt.executeUpdate();
            f=true;  
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public int countLikeOnPost(int pid){
        int count=0;
        
        String q= "select count(*) as total from post_likes where pid=?";
        try{
            PreparedStatement pstmt= this.con.prepareStatement(q);
            pstmt.setInt(1, pid);
            ResultSet set = pstmt.executeQuery();
            while(set.next()){
                count= set.getInt("total");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public boolean isLikedByUser(int pid, int userId){
        boolean f= false;
        String q= "select * from  post_likes where pid=? AND userId=?";
        try{
            PreparedStatement pstmt= this.con.prepareStatement(q);
            pstmt.setInt(1,pid);
            pstmt.setInt(2, userId);
            ResultSet set= pstmt.executeQuery();
            while(set.next()){
                f=true;
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean removeLike(int pid, int userId){
        boolean f=false;
        String q="delete from post_likes where pid=? AND userId=?";
        try{
            PreparedStatement pstmt= this.con.prepareStatement(q);
            pstmt.setInt(1,pid);
            pstmt.setInt(2,userId);
            
           pstmt.executeUpdate();
           f=true;
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean deleteAllLikeByPostId(int pid){
        boolean f=false;
        
        try{
            String q = "delete from post_likes where  pid= ?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, pid);
            pstmt.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
}
