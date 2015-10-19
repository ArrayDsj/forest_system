package com.code.bean;

import java.io.Serializable;

public class UserBean implements Serializable {
	
	private int id;
	
	private String name;
	
	private String password;
	
	private String realName;
	
	private String degree;
	
	public UserBean() {
	}

	

	public UserBean(String name, String password, String realName, String degree) {
		super();
		this.name = name;
		this.password = password;
		this.realName = realName;
		this.degree = degree;
	}



	public UserBean(int id, String name, String password, String realName,
			String degree) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.realName = realName;
		this.degree = degree;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}



	public String getDegree() {
		return degree;
	}



	public void setDegree(String degree) {
		this.degree = degree;
	}

	

}