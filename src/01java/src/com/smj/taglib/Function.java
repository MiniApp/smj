package com.smj.taglib;

import java.awt.Color;
import java.util.Map;

import com.smj.util.Common;
import com.smj.util.JavaCenterHome;

public class Function {
	
	/**
	 * 生成随机码
	 */
	public static String mkSeccode() {
		int seccode = Integer.parseInt(Common.getRandStr(6, true));
		String s = Integer.toString(seccode, 24); 
		while (s.length() < 4) {s = "0" + s;}
		String seccodeUnits = "bcefghjkmpqrtvwxy2346789";
		StringBuffer secCodeHiddenBuf = new StringBuffer(4);
		for (int i = 0; i < 4; i++) {
			int unit = s.charAt(i);
			if (unit >= 0x30 && unit <= 0x39) {
				secCodeHiddenBuf.append(seccodeUnits.charAt(unit - 0x30));
			} else {
				secCodeHiddenBuf.append(seccodeUnits.charAt(unit - 0x57));
			}
		}
		return secCodeHiddenBuf.toString();
	}
	public static Color getRandColor(int fc, int bc) {
		if (fc > 255) {fc = 255;}
		if (bc > 255) {bc = 255;}
		int r = fc + Common.rand(bc - fc);
		int g = fc + Common.rand(bc - fc);
		int b = fc + Common.rand(bc - fc);
		return new Color(r, g, b);
	}

	
	
	public static String DisposeLongStr(int l,String s) {
		if(s==null || "".equals(s.trim())){
			return "";
		}else if(s.trim().length()<=l){
			return s.trim();
		}else{
			return s.trim().substring(0, l)+"...";
		}
	}
	//查询转换时候用，根据KEY返回VLAUE
	public static String SysDictionary(String key,String value) {
		Map<String, String> sysDictionary = JavaCenterHome.sysDictionary;
		return sysDictionary.get(key+value);
	}
		
	public static String HtmlSpecialChars(String value) {
		return Common.htmlSpecialChars(value);
	}
	/**
	 * 分页
	 */
	public static String HtmlPages(int p_no,int p_num) {
		if(p_no<=0)p_no=1;
		if(p_no>p_num)p_no=p_num;
		int begin =1;
		int end =p_num;
		StringBuffer str = new StringBuffer();
		if((p_no-3)>1) begin=p_no-3;
		if((p_no+3)<p_num) end=p_no+3;
		str.append("<div style=\"width:350px;\" align=\"left\"><ul class=\"sugu_page_a\">");
		for(int i=begin;i<=end;i++){
			str.append("<li>");
			if(i==p_no){
				str.append("<a class=\"current\">");
				str.append(i);
				str.append("</a>");
			}else{
				str.append("<a href=\"#\" onclick=\"page_check('");
				str.append(i);
				str.append("')\">");
				str.append(i);
				str.append("</a>");
			}
			str.append("</li>");
		}
		str.append("</ul>&nbsp;&nbsp;共");
		str.append(p_num);
		str.append("页&nbsp;&nbsp;到第<input type=\"text\" id=\"p_no\" name=\"p_no\" size=\"1\"/>页&nbsp;&nbsp;");
		str.append("<input type=\"hidden\" id=\"p_num\" name=\"p_num\" value=\"");
		str.append(p_num);
		str.append("\"/><input type=\"button\" class=\"submit\" onclick=\"page_check()\" value=\"确定\"/></div>");
		return str.toString();
	}
	/**
	 * 积分对应图片
	 * @param rank 积分
	 * @param type 类型 U：用户 S：店铺
	 * @return
	 */
	public static String RankPic(int rank,String type){
		if(type!=null && "U".equals(type.trim())){//用户
			if(rank<=0){
				return "/images/rank_1_0.gif";
			}else if(rank>0 && rank<=10){
				return "/images/rank_1_1.gif";
			}else if(rank>10 && rank<=20){
				return "/images/rank_1_2.gif";
			}else if(rank>20 && rank<=40){
				return "/images/rank_1_3.gif";
			}else if(rank>40 && rank<=80){
				return "/images/rank_1_4.gif";
			}else if(rank>80 && rank<=160){
				return "/images/rank_1_5.gif";
			}else if(rank>160 && rank<=260){
				return "/images/rank_2_1.gif";
			}else if(rank>260 && rank<=460){
				return "/images/rank_2_2.gif";
			}else if(rank>460 && rank<=760){
				return "/images/rank_2_3.gif";
			}else if(rank>760 && rank<=1000){
				return "/images/rank_2_4.gif";
			}else if(rank>1000 && rank<=2000){
				return "/images/rank_2_5.gif";
			}else if(rank>2000 && rank<=3000){
				return "/images/rank_3_1.gif";
			}else if(rank>3000 && rank<=4000){
				return "/images/rank_3_2.gif";
			}else if(rank>4000 && rank<=5000){
				return "/images/rank_3_3.gif";
			}else if(rank>5000 && rank<=6000){
				return "/images/rank_3_4.gif";
			}else{
				return "/images/rank_3_5.gif";
			}
		}else if(type!=null && "S".equals(type.trim())){//店铺
			if(rank<=0){
				return "/images/rank_1_0.gif";
			}else if(rank>0 && rank<=100){
				return "/images/rank_1_1.gif";
			}else if(rank>100 && rank<=200){
				return "/images/rank_1_2.gif";
			}else if(rank>200 && rank<=400){
				return "/images/rank_1_3.gif";
			}else if(rank>400 && rank<=800){
				return "/images/rank_1_4.gif";
			}else if(rank>800 && rank<=1600){
				return "/images/rank_1_5.gif";
			}else if(rank>1600 && rank<=3200){
				return "/images/rank_2_1.gif";
			}else if(rank>3200 && rank<=6400){
				return "/images/rank_2_2.gif";
			}else if(rank>6400 && rank<=10000){
				return "/images/rank_2_3.gif";
			}else if(rank>10000 && rank<=20000){
				return "/images/rank_2_4.gif";
			}else if(rank>20000 && rank<=30000){
				return "/images/rank_2_5.gif";
			}else if(rank>30000 && rank<=40000){
				return "/images/rank_3_1.gif";
			}else if(rank>40000 && rank<=50000){
				return "/images/rank_3_2.gif";
			}else if(rank>50000 && rank<=60000){
				return "/images/rank_3_3.gif";
			}else if(rank>60000 && rank<=70000){
				return "/images/rank_3_4.gif";
			}else if(rank>70000 && rank<=80000){
				return "/images/rank_3_5.gif";
			}else if(rank>80000 && rank<=90000){
				return "/images/rank_4_1.gif";
			}else if(rank>90000 && rank<=100000){
				return "/images/rank_4_2.gif";
			}else{
				return "/images/rank_4_3.gif";
			}
		}else{
			return "";
		}
		
	}
}