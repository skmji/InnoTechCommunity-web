
package com.tech.blog.entities;
public class Messages {
    private String content;
    private String type;
    private String cssClass;

    public Messages(String content, String type, String cssClass) {
        this.content = content;
        this.type = type;
        this.cssClass = cssClass;
    }
    

    public Messages() {
        super();
    }
    
    // getter and setter

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }
    
    
    
}
