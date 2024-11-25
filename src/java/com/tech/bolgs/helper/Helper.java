/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.bolgs.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Sanjay maurya
 */
public class Helper {
    
    public static Boolean deleteFile(String path){
        Boolean f= false;
        File file= new File(path);
        f= file.delete();
        
        
        return f;
    }
    
    public static Boolean saveFile(InputStream is, String path){
        Boolean f= false;
        try{
            byte []fdata= new byte[is.available()];
            is.read(fdata);
            FileOutputStream fos= new FileOutputStream(path);
            fos.write(fdata);
            fos.flush();
            fos.close();
            f=true;
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        
       return f; 
    }
    
}
