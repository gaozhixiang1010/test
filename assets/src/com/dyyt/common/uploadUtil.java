package com.dyyt.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;
import org.textmining.text.extraction.WordExtractor;

public class uploadUtil {
    public static void uploadUtil(MultipartFile uploadFile,String uploadFilePath,String filename){
    	try {    
	        InputStream is = uploadFile.getInputStream();  
	        // 如果服务器已经存在和上传文件同名的文件，则输出提示信息  
	        File tempFile = new File(uploadFilePath + filename);  
	        if (tempFile.exists()) {  
	            boolean delResult = tempFile.delete();  
	        }        
	        if (!filename.equals("")) {  
	            FileOutputStream fos = new FileOutputStream(uploadFilePath + filename);  
	            byte[] buffer = new byte[8192]; // 每次读8K字节  
	            int count = 0;  
	            // 开始读取上传文件的字节，并将其输出到服务端的上传文件输出流中  
	            while ((count = is.read(buffer)) > 0) {  
	                fos.write(buffer, 0, count); // 向服务端文件写入字节流  
	            }  
	            fos.close(); // 关闭FileOutputStream对象  
	            is.close(); // InputStream对象  
	        }  
	    } catch (FileNotFoundException e) {  
	        e.printStackTrace();  
	    } catch (IOException e) {  
	        e.printStackTrace();  
	    }
    }
    public static List InputStreamReaderUtil(String path) throws Exception{
		   InputStreamReader isr = null;
		    BufferedReader br = null;
		    String s = null;
		    List list  = new ArrayList();
		    try {
		      isr = new InputStreamReader(new FileInputStream(path),"gbk");
		      br = new BufferedReader(isr);
		      s = br.readLine();//readLine()方法为阻塞式，当读取不到信息时，会一直在那里等待
		      while(s != null){
		        //String类的toUpperCase()方法将是将小写字母转换成大写字母
		        list.add(s);
		        s = br.readLine();        
		      }
		    } catch (IOException e) {
		         e.printStackTrace();
		    } finally{
		         try {
		        	if(isr != null){
		        		isr.close();
		        		
		        	}
				 } catch (IOException e) {			
					e.printStackTrace();
				 } finally{
				     try {
			        	if(br != null){
			        		br.close();
			        	}
					 } catch (IOException e) {
						e.printStackTrace();
					 }
				 }
		    }
			return list;
	   }
	      public static String readDoc(String doc)  {
			  // 创建输入流读取doc文件
			  FileInputStream in = null;
			  BufferedReader br = null;
			  // 创建WordExtractor
			  WordExtractor extractor = new WordExtractor();
			  // 对doc文件进行提取
			  String text;
			
              try {
					in = new FileInputStream(new File(doc));
					text = extractor.extractText(in);
				} catch (FileNotFoundException e) {
					return "";
				} catch (Exception e) {
					return "";
				}	
			  return text;	  
		  }
	      public static String randomNum(int length) {
	    	  // 随机数字	
	    	  Random random = new Random();
	    	  String val = "";
	    	  for (int i = 0; i < length; i++) {
	    		  val += random.nextInt(10) + "";
	    		  }		
	    	  return val;	
	    	    
	      }
	      public static String randomABC(int length) {// 随机字母
	    	  Random random = new Random();
	    	  String val = "";
	    	  for (int i = 0; i < length; i++) {
	    		  int choice = random.nextInt(2) % 2 == 0 ? 97 : 97; // 取得65大写还是97小写
	    		  val += (char) (choice + random.nextInt(26));
	    		  }
	    	  return val;
	      }
	      public static String reName(String filename){
	    	 SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式
	         String sj = df.format(new Date());// new Date()为获取当前系统时间
	    	 String num =  randomNum(4);               
	         String Abc =  randomABC(4); 
	         String newname = filename+"["+sj+"]";
	    	 return newname;  
	      }
}
