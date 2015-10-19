package com.code.bean;

public class PestBean {
	//ID
	private int id;
	//名称
	private String name;
	//寄主
	private String host;
	//繁殖
	private String breed;
	//天敌
	private String sentinel;
	//幼虫图片
	private String larvapicture;
	//成虫图片
	private String adultpicture;
	//防治措施
	private String control;
	//主要危害
	private String mainharm;

	
	public PestBean() {
		super();
	}

	public PestBean( String name, String host, String breed,
			String sentinel, String larvapicture, String adultpicture,
			String control, String mainharm) {
		this.name = name;
		this.host = host;
		this.breed = breed;
		this.sentinel = sentinel;
		this.larvapicture = larvapicture;
		this.adultpicture = adultpicture;
		this.control = control;
		this.mainharm = mainharm;
	}
	

	public PestBean(String name, String host, String breed, String sentinel,
			String control, String mainharm) {
		super();
		this.name = name;
		this.host = host;
		this.breed = breed;
		this.sentinel = sentinel;
		this.control = control;
		this.mainharm = mainharm;
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

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getSentinel() {
		return sentinel;
	}

	public void setSentinel(String sentinel) {
		this.sentinel = sentinel;
	}

	public String getLarvapicture() {
		return larvapicture;
	}

	public void setLarvapicture(String larvapicture) {
		this.larvapicture = larvapicture;
	}

	public String getAdultpicture() {
		return adultpicture;
	}

	public void setAdultpicture(String adultpicture) {
		this.adultpicture = adultpicture;
	}

	public String getControl() {
		return control;
	}

	public void setControl(String control) {
		this.control = control;
	}

	public String getMainharm() {
		return mainharm;
	}

	public void setMainharm(String mainharm) {
		this.mainharm = mainharm;
	}
	
	
	
}
