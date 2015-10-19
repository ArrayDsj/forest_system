package com.code.bean;

import java.io.Serializable;
import java.util.Date;



/**
 * @author Administrator
 * @version 1.0
 * @created 10-十月-2015 16:59:38
 */
public class LogBean implements Serializable {

	private int id;
	
	private Date date;
	
	private String content;
	
	private String time;
	

	
	
	

	public LogBean() {
		super();
	}

	

	public LogBean(int id, Date date, String content, String time) {
		super();
		this.id = id;
		this.date = date;
		this.content = content;
		this.time = time;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public String getTime() {
		return time;
	}



	public void setTime(String time) {
		this.time = time;
	}
	

	

}