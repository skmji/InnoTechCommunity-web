
package com.tech.blog.entities;

import java.sql.*;
import java.time.Duration;
import java.time.LocalDateTime;


public class Post {
    private int pId;
    private String pTitle;
    private String pContent;
    private String pCode;
    private String pPics;
    private Timestamp pDate;
    private int cId;
    private int userId;

    public Post() {
    }

    public Post(int pId, String pTitle, String pContent, String pCode, String pPics, Timestamp pDate, int cId, int userId) {
        this.pId = pId;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPics = pPics;
        this.pDate = pDate;
        this.cId = cId;
        this.userId=userId;
    }

    public Post(String pTitle, String pContent, String pCode, String pPics, Timestamp pDate, int cId, int userId) {
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pPics = pPics;
        this.pDate = pDate;
        this.cId = cId;
        this.userId=userId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpPics() {
        return pPics;
    }

    public void setpPics(String pPics) {
        this.pPics = pPics;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
    
    // Method to get human-readable time format
    public String getFormattedTime() {
        LocalDateTime postTime = pDate.toLocalDateTime();
        LocalDateTime currentTime = LocalDateTime.now();
        Duration duration = Duration.between(postTime, currentTime);

        long seconds = duration.getSeconds();

        if (seconds < 60) {
            return seconds == 1 ? "just after a second" : seconds + " seconds ago";
        }

        long minutes = seconds / 60;
        if (minutes < 60) {
            return minutes == 1 ? "a minute ago" : minutes + " minutes ago";
        }

        long hours = minutes / 60;
        if (hours < 24) {
            return hours == 1 ? "an hour ago" : hours + " hours ago";
        }

        long days = hours / 24;
        if (days < 30) {
            return days == 1 ? "a day ago" : days + " days ago";
        }

        long months = days / 30;
        if (months < 12) {
            return months == 1 ? "a month ago" : months + " months ago";
        }

        long years = months / 12;
        return years == 1 ? "a year ago" : years + " years ago";
    }
    
    
    
    

    @Override
    public String toString() {
        return "Post{" + "pId=" + pId + ", pTitle=" + pTitle + ", pContent=" + pContent + ", pCode=" + pCode + ", pPics=" + pPics + ", pDate=" + pDate + ", cId=" + cId + ", userId=" + userId + '}';
    }

  
    
    
    
    
}
