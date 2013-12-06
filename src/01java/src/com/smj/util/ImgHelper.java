package com.smj.util;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.imageio.ImageIO;
public class ImgHelper {
    
	/**
	 * 图片上传+
	 * uploadState+ 
	 * 0：LOGO文件存在
	 * 1:图片大于512KB
	 * 2:图片类型非jpg|jpeg|bmp|gif|png
	 * 3:上传图片成功
	 * uploadFile  上传文件
	 * filesize    指定文件上传大小
	 * @return
	 */
	public static Map picUpload(HttpServletRequest request,String uploadFile,Integer filesize){
		HttpSession session = request.getSession();
		Map map = new HashMap();
		String datestr = Common.getCurrentDate("yyyyMMdd");
		
		//获取配置文件中上传图片存放路径 
		FileHelper  propfile = new  FileHelper();
		String filepath = "";
		filepath = propfile.GetProperties("projpath","propsmj.properties") + "\\";
		//判断当日上传路径是否存在
		File picPath = new File(filepath + "logoimages\\" + datestr);
		if(!picPath.exists()){
			picPath.mkdirs();
		}
		//获取店铺ID
		String enter = session.getAttribute("enter_id").toString();
		System.out.println("uploadFile" + uploadFile);
		System.out.println(uploadFile.substring(uploadFile.lastIndexOf(".")+1));		
		//拼接上传图片服务器存放路径
		String  targetFile = filepath + "\\"  +  "logoimages"  + "\\" + datestr  + "\\" + enter + Common.getCurrentDate("yyyyMMddHHmmss") + uploadFile.substring(uploadFile.lastIndexOf("."));
		System.out.println("targetFile" + targetFile);
		
		//判断LOGO是否存在
		File efile = new File(targetFile);
		if(efile.exists()){
			map.put("uploadState",0);
		}
		
		int MaxSize = filesize * 1024;//图片大小
		//判断文件大小
		File  file = new File(uploadFile);
		if(file.length() > MaxSize)
		{
			map.put("uploadState",1);
		}
		//判断LOGO类型
		String types = "|gif|png|jpg|jpeg|bmp|";
		if(uploadFile.substring(uploadFile.lastIndexOf(".")+1).indexOf(types) < -1)
		{
			map.put("uploadState",2);
		}
		
		try{ 
			copyfile(uploadFile,targetFile,filesize);
			map.put("uploadState", 3);
			map.put("targetFile",enter + Common.getCurrentDate("yyyyMMddHHmmss") + uploadFile.substring(uploadFile.lastIndexOf(".")));
		}catch(Exception e){
			e.printStackTrace();
		}
		return map;
	}
	
	/*
	 *    将上传文件写入目标文件
	 *    uploadFile       上传文件
	 *    targetFile       目标文件
	 *    filesize         文件大小
	 * */
	public static void copyfile(String uploadFile,String targetFile,Integer filesize) throws IOException
	{
		 FileInputStream in=new FileInputStream(uploadFile);
		 
         File file=new File(targetFile);
         
         FileOutputStream out=new FileOutputStream(file);
         //BufferReader  rd = 
         int c;
         
         byte buffer[]=new byte[filesize];
         while((c=in.read(buffer))!=-1){
             for(int i=0;i<c;i++)
                 out.write(buffer[i]);        
         }
         in.close();
         out.close();
	}
	
	
	/**
	 * 图片剪切
	 */
	public static void pic(File savedFile,File filePath,String fileName,float wsize,float hsize){
		try{
			Image bigsrc = ImageIO.read(savedFile);
			int old_w = bigsrc.getWidth(null);
			int old_h = bigsrc.getHeight(null);
			Image images = bigsrc.getScaledInstance(old_w, old_h, Image.SCALE_SMOOTH);
			int new_w=0;
		    int new_h=0;
		    if(old_w<=wsize){
	    		if(old_h<=hsize){
	    			new_w=(int)old_w;
	    			new_h=(int)old_h;
	    		}else{
	    			double dbh = hsize/old_h;
	    			new_w=(int)(old_w*dbh);
	    			new_h=(int)(old_h*dbh);
	    		}
	    	}else{
	    		if(old_h<=hsize){
	    			double dbw = wsize/old_w;
	    			new_w=(int)(old_w*dbw);
	    			new_h=(int)(old_h*dbw);
	    		}else{
	    			double dbw = wsize/old_w;
	    			double w=old_w*dbw;
	    			double h=old_h*dbw;
	    			if(h<=hsize){
	    				new_w=(int)w;
		    			new_h=(int)h;
	    			}else{
	    				double dbh = hsize/h;
	    				new_w=(int)(w*dbh);
		    			new_h=(int)(h*dbh);
	    			}
	    		}
	    	}
		    BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
		    tag.getGraphics().drawImage(images,0,0,new_w,new_h,null);//绘制缩小后的图
		    ImageIO.write(tag, "JPEG", new File(filePath,fileName));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
