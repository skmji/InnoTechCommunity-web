
package com.tech.blog.dao;


//import com.mysql.cj.protocol.Resultset;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list= new ArrayList<Category> ();
        try{
            String q= "select * from categories";
        Statement st= this.con.createStatement();
        ResultSet res= st.executeQuery(q);
        while(res.next()){
        Category c= new Category();
            c.setcId(res.getInt("cid"));
            c.setcName(res.getString("cname"));
            c.setcDescription(res.getString("cdescription"));
            list.add(c);
               
        }
        
        
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        
        return list;
        
    }
    
    public Boolean addPost(Post p){
        Boolean f=false;

        if (p.getpId() > 0) {
            
            String q= "update post set ptitle=?, pcontent=?, pcode=?, pPics=? where pid=?";
            try{
                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setString(1, p.getpTitle());
                pstmt.setString(2, p.getpContent());
                pstmt.setString(3, p.getpCode());
                pstmt.setString(4, p.getpPics());
                pstmt.setInt(5,p.getpId());
                
                pstmt.executeUpdate();
                f=true;
               
               
            }
            catch(Exception e){
                e.printStackTrace();
            }

        } else {

            try {
                
                
                String q = "insert into post (pTitle, pContent, pCode, pPics, cId, userId) values (?,?,?,?,?,?)";

                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setString(1, p.getpTitle());
                pstmt.setString(2, p.getpContent());
                pstmt.setString(3, p.getpCode());
                pstmt.setString(4, p.getpPics());
                pstmt.setInt(5, p.getcId());
                pstmt.setInt(6, p.getUserId());
                pstmt.executeUpdate();
                f = true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return f;
    }
    
    public List<Post> getAllPost(int offset, int maxrow){
        List<Post> list= new ArrayList<>();
        try{
            String q= "select * from post order by pdate desc limit ?,?";
        PreparedStatement pstmt= con.prepareStatement(q);
        pstmt.setInt(1,offset);
        pstmt.setInt(2, maxrow);
      ResultSet set=  pstmt.executeQuery();
      while(set.next()){
          Post p= new Post();
          
          p.setpId(set.getInt("pid"));
          p.setpTitle(set.getString("ptitle"));
          p.setpContent(set.getString("pcontent"));
          p.setpCode(set.getString("pcode"));
          p.setpPics(set.getString("pPics"));
           p.setpDate(set.getTimestamp("pdate"));
          
            
       list.add(p);
      }
      return list;
      
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return list;           
    }
    
    public List<Post> getPostById(int cid,int offset, int maxrow){
        List list= new ArrayList();
        try{
            String q= "select * from  post where cid=? order by pdate desc limit ?, ?";
            PreparedStatement pstmt= con.prepareStatement(q);
            pstmt.setInt(1, cid);
            pstmt.setInt(2,offset);
            pstmt.setInt(3,maxrow);
            ResultSet set= pstmt.executeQuery();
            while(set.next()){
                
                Post p = new Post();
                p.setpId(set.getInt("pid"));
                p.setpTitle(set.getString("ptitle"));
                p.setpContent(set.getString("pcontent"));
                p.setpCode(set.getString("pcode"));
                p.setpPics(set.getString("pPics"));
                 p.setpDate(set.getTimestamp("pdate"));
                list.add(p);

            }
              
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    
     public Post getPostUseId(int id){
                Post p=null;
               
                
                try{
                    String q= "select * from post where pid=?";
                    PreparedStatement pstmt= this.con.prepareStatement(q);
                    pstmt.setInt(1,id);
                    ResultSet set= pstmt.executeQuery();
                    while (set.next()) {

                         p = new Post();
                        p.setpId(set.getInt("pid"));
                        p.setpTitle(set.getString("ptitle"));
                        p.setpContent(set.getString("pcontent"));
                        p.setpCode(set.getString("pcode"));
                        p.setpPics(set.getString("pPics"));
                        p.setpDate(set.getTimestamp("pdate"));
                        
                        
                       
                      

                    }
                }catch(Exception e){
                    System.out.println("this is also called exception");
                    e.printStackTrace();
                }
                System.out.println("function end-----");
                
                return p;
            }
     
    public User getUserByPostId(int id) {
        User user = null;
        int userid=0;
        try{
                
         String q2= "select * from post where pid= ?";
         PreparedStatement pstmt2= this.con.prepareStatement(q2);
         pstmt2.setInt(1,id);
         ResultSet set2= pstmt2.executeQuery();
         while(set2.next()){
             userid=set2.getInt("userId");
             
         }
         
          
        String q1= "select * from user where id=?";
        PreparedStatement pstmt= this.con.prepareStatement(q1);
        pstmt.setInt(1,userid);
        ResultSet set= pstmt.executeQuery();
        while(set.next()){
            user= new User();
            user.setId(set.getInt("id"));
            user.setName(set.getString("username"));
            user.setProfile(set.getString("profile"));
            user.setAbout(set.getString("about"));
            user.setGender(set.getString("gender"));
            user.setDatetime(set.getTimestamp("tdate"));
            user.setEmail(set.getString("email"));

            
            
        }
        
        }catch(Exception e){
            e.printStackTrace();
        }
            
   
        

        return user;

    }
    
    public List<Post> getAllPostByUserId(int id,int offset, int maxrow){
        List<Post> lpost = new ArrayList<Post>();
        
        String q= "select * from post where userId=? order by pdate desc limit ?,?";
        
        try {
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, id);
            pstmt.setInt(2,offset);
            pstmt.setInt(3,maxrow);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {

                Post p = new Post();
                p.setpId(set.getInt("pid"));
                p.setpTitle(set.getString("ptitle"));
                p.setpContent(set.getString("pcontent"));
                p.setpCode(set.getString("pcode"));
                p.setpPics(set.getString("pPics"));
                p.setpDate(set.getTimestamp("pdate"));

                lpost.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return lpost;

    }
    
    
    public boolean deletePostById(int id){
        boolean f=false;
        
        CommentDao commentDao= new CommentDao(con);
        commentDao.deleteAllCommentByPostId(id);
        LikedDao likedDao= new LikedDao(con);
        likedDao.deleteAllLikeByPostId(id);
        
        
        try{
            String q= "delete from post where pid=?";
            PreparedStatement pstmt= con.prepareStatement(q);
            pstmt.setInt(1,id);
            pstmt.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }

    
    
}
