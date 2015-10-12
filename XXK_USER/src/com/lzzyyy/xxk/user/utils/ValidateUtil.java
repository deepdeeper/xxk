package com.lzzyyy.xxk.user.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 用于验证的工具类
 * @author  向才鹏
 * Copyright (C), 2010,四川易极天成信息打技术有限公司所有?
 * Date: Mar 17, 2010
*/
public class ValidateUtil {

	/**
	* 验证对象是否为空
	* @author 向才鹏
	* @param o
	* @return 如果传入对象为空返回true,否则返回false
	* Mar 17, 2010   9:02:13 AM
	*/
	public static boolean valideIsEmpty(Object o){
		if(o instanceof String){
			if(o==null || "".endsWith(o.toString()) ||"null".endsWith(o.toString())){
				return true;
			}
		}else{
			if(o == null){
				return true;
			}
		}
		return false;
	}
	
	/**
	* 验证输入字符串长度范围
	* @author 向才�?
	* @param validateString 输入验证的字符串
	* @param minLength  字符串的�?小长�?
	* @param maxLength 字符串的�?大长�?
	* @return 如果输入字符串在这个范围�?,返回true,否则返回false;
	* Mar 17, 2010   9:03:12 AM
	*/
	public static boolean validateLengthRange(String validateString,int minLength,int maxLength){
		if(valideIsEmpty(validateString))
			return false;
		if(minLength>maxLength)
			return false;
		int validateStringLength = validateString.length();
		if(validateStringLength>=minLength && validateStringLength<=maxLength){
			return true;
		}
		return false;
	}
	
	/**
	* 验证输入字符串是否配置一个指定的模式
	* @author 向才�?
	* @param validateString 输入验证的字符串
	* @param regex  验证样式
	* @return 如果输入字符串匹配输入的字符串返回true,否则为false
	* Mar 17, 2010   9:06:35 AM
	*/
	public static boolean validatePattern(String validateString,String regex){
		Pattern p = Pattern.compile(regex);
		Matcher m  = p.matcher(validateString);
		return m.matches();
	}
}