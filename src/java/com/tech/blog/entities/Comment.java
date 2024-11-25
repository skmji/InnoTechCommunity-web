/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

/**
 *
 * @author skm
 */
public class Comment {
    private int id;
    private String content;
    private int pid;
    private int userId;
    private Date date;

    public Comment() {
        super();
    }

    public Comment(int id, String content, int pid, int userId, Date date) {
        this.id = id;
        this.content = content;
        this.pid = pid;
        this.userId = userId;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
    
    
     // Method to get human-readable time format
    public String getFormattedTime() {
        // Convert Date to LocalDateTime
        LocalDateTime postTime = date.toInstant()
                                      .atZone(ZoneId.systemDefault())
                                      .toLocalDateTime();
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
        return "Comment{" + "id=" + id + ", content=" + content + ", pid=" + pid + ", userId=" + userId + ", date=" + date + '}';
    }
    
    

  

  
    
    
    
    
}
