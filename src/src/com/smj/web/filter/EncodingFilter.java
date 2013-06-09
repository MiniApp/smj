package com.smj.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/** 编码过滤器 */
public class EncodingFilter implements Filter {

//	String encoding = null;
//	FilterConfig filterConfig = null;
	
	/** 初始化方法 */
	public void init(FilterConfig filterConfig) throws ServletException {
//		this.filterConfig = filterConfig;
//		this.encoding = filterConfig.getInitParameter("encoding");
	}

	/** 过滤处理方法 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
	 
			//对请求进行编码设置
			request.setCharacterEncoding("UTF-8");
			//response.setCharacterEncoding(encoding);
		 
		//将处理权转交给下一个处理器
		chain.doFilter(request,response);
	}

	/** 销毁方法 */
	public void destroy() {
//		this.encoding = null;
//		this.filterConfig = null;
	}

}