package com.lzzyyy.xxk.user.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 */
public class PromptUtil {
	public static void print(HttpServletResponse res, String message,String url) throws IOException {
		if(res==null) return;
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write("<script type='text/javascript'>");
		if(!"".equals(message)){
			out.write("alert('"+message+"');");
		}
	    out.write("window.location.href='"+url+"'");
		out.write("</script>");
		out.flush();
		out.close();
	}
	public static void print2(HttpServletResponse res, String message,String url) throws IOException {
		if(res==null) return;
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write("<script type='text/javascript'>");
		if(!"".equals(message)){
			out.write("alert('"+message+"');");
		}
		out.write("window.top.location.href='"+url+"'");
		out.write("</script>");
		out.flush();
		out.close();
	}
	public static void writeJSON(HttpServletResponse response,String json) throws IOException {
		  response.setContentType("application /json;charset=UTF-8");
		  PrintWriter out= response.getWriter();
		  out.write(json);
		  out.flush();
		  out.close();
	}
	
	public static void printXML(HttpServletResponse response,String xml) throws IOException {
		  response.setContentType("application/xml;charset=UTF-8");
		  PrintWriter out= response.getWriter();
		  out.write(xml);
		  out.flush();
		  out.close();
	}
	public static void printText(HttpServletResponse response,String regionModel) throws IOException {
		 response.setContentType("application/text;charset=UTF-8");
		  PrintWriter out= response.getWriter();
		  out.write(regionModel);
		  out.flush();
		  out.close();
	}
	
	public static String trim(String source) {
		if(source==null || source.equals("")){
			return "";
		}else{
			source = source.replaceAll("[^\u4e00-\u9fa5]", "");
			return source;
		}
	}
	
	public static void ping(HttpServletResponse res, String message) throws IOException{
		
		if(res==null) return;
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.write("<script type='text/javascript'>");
		if(!"".equals(message)){
			out.write("alert('"+message+"');");
		}
		out.write("</script>");
		out.flush();
		out.close();
		
		
	}

}