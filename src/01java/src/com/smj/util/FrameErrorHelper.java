package com.smj.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/*
 *    错误代码操作类
 * */
public class FrameErrorHelper {

	private String charset = "UTF-8";
	private Properties properties = null;//配置
	private String fileName = null;//文件
	InputStream fis = null;
	
	/**
	 * 构造方法--根据单个KEY值查询
	 * @return 
	 */
	public FrameErrorHelper(HttpServletRequest request,String key,String errorName) throws IOException {
		this.properties = new Properties();
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		fileName = path.substring(0,path.indexOf("/WEB-INF")+8) +  "/classpath/error/error.properties";
		fis = new FileInputStream(fileName);
		this.properties.load(fis);
		Map<String, String> map = new HashMap<String, String>();
		
		if("".equals(this.getValue(key)) == false){
			map.put("key",key);
			map.put("name",this.getValue(key.toString()));
		}
		
		request.getSession().setAttribute(errorName,this.getValue(key.toString()));
		fis.close();
	}
	
	/**
	 * 构造方法--根据单个KEY拼接name值
	 * @return 
	 */
	public FrameErrorHelper(HttpServletRequest request,String key,String name,String errorName) throws IOException {
		this.properties = new Properties();
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		fileName = path.substring(0,path.indexOf("/WEB-INF")+8) +  "/classpath/error/error.properties";
		fis = new FileInputStream(fileName);
		this.properties.load(fis);
		Map<String, String> map = new HashMap<String, String>();
		String tmpName = "";
		
		//根据KEY查询出历史VALUE
		if("".equals(this.getValue(key)) == false){
			 tmpName = this.getValue(key);
		
			//根据KEY将{0}替换为指定的值
			tmpName = tmpName.replace("{0}",name);
			this.setValue(key,tmpName);
			map.put("key",key);
			map.put("name",tmpName);
			
			request.getSession().setAttribute(errorName,tmpName);
		}
		
		fis.close();
	}
	
	/**
	 * 构造方法
	 * @return 
	 */
	public FrameErrorHelper(HttpServletRequest request,String[] key,String errorName) throws IOException {
		this.properties = new Properties();
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		fileName = path.substring(0,path.indexOf("/WEB-INF")+8) +  "/classpath/error/error.properties";
		fis = new FileInputStream(fileName);
		this.properties.load(fis);
		
		Map<String, String> map = new HashMap<String, String>();
		String tmpName = "";
		
		for(int i = 1;i<key.length;i++){ 
			if("".equals(this.getValue(key[i].toString())) == false){
				tmpName =  this.getValue(key[i].toString()) + "|";
			}
			else{
				continue;
			}
		}
		map.put("name",tmpName);
		request.getSession().setAttribute(errorName,tmpName);
		fis.close();
	}
	
	/**
	 * 构造方法
	 * @return 
	 */
	public FrameErrorHelper(HttpServletRequest request,Map<String, String> maps,String errorName) throws IOException {
		this.properties = new Properties();
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		fileName = path.substring(0,path.indexOf("/WEB-INF")+8) +  "/classpath/error/error.properties";
		fis = new FileInputStream(fileName);
		this.properties.load(fis);
		
		Map<String, String> map = new HashMap<String, String>();
		String tmpName = "";
		String tmp = "";
		
		for(int i = 1;i<maps.size();i++){ 
			if("".equals(this.getValue(maps.get("key").toString())) == false){
				//获取历史name值
				tmp = this.getValue(maps.get("key"));
				//根据KEY将{0}替换为指定的值
				tmpName = tmp.replace("{0}",this.getValue(maps.get("name"))) + "|";
			}
			else{
				continue;
			}
		}
		
		map.put("name",tmpName);
		request.getSession().setAttribute(errorName,tmpName);
		fis.close();
	}
	
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	public Properties getProperties() {
		return properties;
	}
	public void setProperties(Properties properties) {
		this.properties = properties;
	}
	public String getValue(String key) {
		return properties.getProperty(key);
	}
	public void setValue(String key, String value) {
		properties.setProperty(key, value);
	}
	
	public FrameErrorHelper(HttpServletRequest request) throws IOException {
		String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		fileName = path.substring(0,path.indexOf("/WEB-INF")+8) +  "/classpath/error/error.properties";
		this.properties = new Properties();
		fis = new FileInputStream(fileName);
		this.properties.load(fis);	
		if("".equals(this.getValue("A1")) == false){
		       	System.out.println("value" + this.getValue("A1"));
		}
		fis.close();
	}
}
