package com.lzzyyy.xxk.user.filter;

import java.util.Hashtable;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * 
 * @author 向才鹏
 * @version 1.0 Copyright (C), 2009,www.soujava.cn所有 Program Name:鹏哥伟业 Date: Oct
 *          22, 2010 4:48:31 PM
 */
public class SessionCounter implements HttpSessionListener {
	public SessionCounter() {}
	
	@SuppressWarnings("unchecked")
	public static Hashtable<String,String> m_real = new Hashtable<String,String>();
	private static long	 count  = 0;
	
	public void sessionCreated(HttpSessionEvent e) {
		count++;
	}
	public void sessionDestroyed(HttpSessionEvent e) {
		if (count > 0) {
			count--;
		}
		m_real.remove(e.getSession().getId());
	}
	public static long getSessionCount() {
		return count;
	}
	
	public static void put(String sessionId) {
		m_real.put(sessionId, "1");
	}
	public static int getRealCount() {
		return m_real.size();
	}
}