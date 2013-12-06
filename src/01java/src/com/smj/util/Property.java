package com.smj.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;  
import java.io.FileNotFoundException;  
import java.io.FileOutputStream;
import java.io.IOException;  
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;  
import java.util.List;  
import java.util.Map;  
import java.util.Properties;  

import com.smj.service.bean.DirectoryBean;

public class Property {
	private String charset = "UTF-8";
	private static Map<String, String> propertyMap = new HashMap<String, String>();  
	private String fileName;        
	private String txtFileName;
	private Properties properties;
	private List<DirectoryBean> propertyList;
	
	public Property(String txtFileName,String fileName) 
	{  
		this.txtFileName = txtFileName;
		this.fileName = fileName;  
	}  
    
	/*
	 *   从文本文件中提取
	 * */
	public  List<DirectoryBean> LoadAllProperty(String path) throws IOException{
		
		List<DirectoryBean> lisDirtory = new ArrayList<DirectoryBean>();
		File file = new File(path);
		String[] tmp = null;
		List<String> filevalue = FileHelper.readFileToList(file);
		for(String  s: filevalue)
	    {
			tmp = s.split(",");
			DirectoryBean  directory = new DirectoryBean();
			directory.SetKey(tmp[0].toString());
			directory.SetValue(tmp[1].toString());
			
			lisDirtory.add(directory);
	    }
		
		
		System.out.println("add_dirtory" + lisDirtory.size() );
		return lisDirtory;  
	}
	
	
	
	public Map<String,String> getProperty() throws IOException{
		//
	    try {
			propertyList = LoadAllProperty(txtFileName);	
			System.out.println("get_dirtory" + propertyList.size());
	    } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
        
	    List<String>  data = new ArrayList<String>();
	    
		// 定义Map用于存放结果     
		Map<String,String> propertyMap = new HashMap<String,String>();  
		        // 定义Properties property = new Properties();          
		properties = new Properties();  
		        // 定义FileInputStream inputFile = null;     
		FileInputStream inputFile = null;            
		    try {              
		            // 实例化inputFile   
		            inputFile = new FileInputStream(this.fileName);  
		            // 装载配置文件               
		            properties.load(inputFile); 
		            for (DirectoryBean d : propertyList) {    
		                
		            	System.out.println(properties.get(d.getKey()));
		            	
		            	//data.add(d.getKey() + "=" + d.getValue());
		            	
		                //从配置文件中将值放入MAP 
		                propertyMap.put(d.getKey(),d.getValue());
		                //保存
		                //saveProperties(data);		               
		            }    
		          
		         } finally {              
		           // 关闭输入流   
		            if (inputFile != null) { 
		               inputFile.close();  
		            }  
		        }            
		        return propertyMap;
	}
	
	/*
	 *   保存配置文件
	 */
	public void saveProperties(List<String> value) throws IOException {
		FileOutputStream fos = new FileOutputStream(fileName);
		OutputStreamWriter osw = new OutputStreamWriter(fos, charset);
		BufferedWriter bw = new BufferedWriter(osw);
		
		for (String v: value) {
			bw.write(v);
			bw.newLine();
		}
		
		bw.flush();
		osw.flush();  
		fos.flush();
		bw.close();
		osw.close();
		fos.close();
		
	}
	
}
