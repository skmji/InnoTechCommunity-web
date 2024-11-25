
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import com.tech.bolgs.helper.ConnectionProvider;
import java.sql.*;

public class UserDao {
   private Connection con;
 

    public UserDao(Connection con) {
        this.con = con;
    }
    // save user
    public Boolean savaUser(User myuser){
        Boolean f=false;
        
        String name=myuser.getName();
        String email=myuser.getEmail();
        String password= myuser.getPassword();
        String gender=  myuser.getGender();
        String about= myuser.getAbout();
        // my query
        
        String q= "insert into user(username, email, password, gender,about) values (?,?,?,?, ?)";
        try{
             PreparedStatement pstmt= con.prepareStatement(q);
             pstmt.setString(1,name);
             pstmt.setString(2,email);
             pstmt.setString(3,password);
             pstmt.setString(4,gender);
             pstmt.setString(5,about);
        pstmt.executeUpdate();
        f=true;
        
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
       
    }
   
    // get user by Emailid and Password
    
    public User getUserbyEmailAndPassword(String email, String password){
        User myuser= null;
        String q= "select * from user where email=? AND password=?";
        try{
            
       PreparedStatement pstmt= con.prepareStatement(q);
       pstmt.setString(1,email);
       pstmt.setString(2,password);
       ResultSet res = pstmt.executeQuery();
       if(res.next()){
           myuser= new User();
           
           myuser.setId(res.getInt("id"));
           myuser.setName(res.getString("username"));
           myuser.setEmail(res.getString("email"));
           myuser.setPassword(res.getString("password"));
           myuser.setAbout(res.getString("about"));
           myuser.setGender(res.getString("gender"));
           myuser.setDatetime(res.getTimestamp("tdate"));
           myuser.setProfile(res.getString("profile"));
           
           
           
       }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return myuser;
    }
    
       
    
    public Boolean  updateUser(User myuser){
        Boolean f= false;
        String q= "update user set username=?, email=?, about=? , profile=? where id=?";
        try{
            PreparedStatement pstmt= con.prepareStatement(q);
        pstmt.setString(1, myuser.getName());
        pstmt.setString(2,myuser.getEmail());
        pstmt.setString(3,myuser.getAbout());
        pstmt.setString(4,myuser.getProfile());
        pstmt.setInt(5,myuser.getId());
        System.out.println("data set in user variable");
        pstmt.executeUpdate();
        System.out.println("success full execute query");
        f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return f;
    }
    
    
    public User getUserById(int id){
        User user=  new User();
        String q= "select * from user where id =?";
        try{
             PreparedStatement pstmt= this.con.prepareStatement(q);
        pstmt.setInt(1, id);
        ResultSet set= pstmt.executeQuery();
        while(set.next()){
            user.setId(set.getInt("id"));
            user.setName(set.getString("username"));
            user.setGender(set.getString("gender"));
            user.setAbout(set.getString("about"));
            user.setProfile(set.getString("profile"));
            user.setDatetime(set.getTimestamp("tdate"));
            
        }
            
        }catch(Exception e){
           e.printStackTrace();
        }
       
        
        return user;
    }
    
    
}
