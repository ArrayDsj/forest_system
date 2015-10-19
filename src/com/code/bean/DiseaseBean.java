package com.code.bean;

public class DiseaseBean {
//病害一览
	private int id;
	
	private String name;
	//病源
	private String source;
	//发病症状
	private String symptoms;
	//发病规律
	private String ROD;
	//图片
	private String picture;
	//防治措施
	private String LMA;
	//主要危害
	private String mainharm;
	
	public DiseaseBean() {
		super();
	}

	public DiseaseBean( String name, String source, String symptoms,
			String rOD, String picture, String lMA, String mainharm) {
		this.name = name;
		this.source = source;
		this.symptoms = symptoms;
		this.ROD = rOD;
		this.picture = picture;
		this.LMA = lMA;
		this.mainharm = mainharm;
	}
	public DiseaseBean(String name, String source, String symptoms,
			String rOD, String lMA, String mainharm) {
		this.name = name;
		this.source = source;
		this.symptoms = symptoms;
		this.ROD = rOD;
		this.LMA = lMA;
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

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public String getROD() {
		return ROD;
	}

	public void setROD(String rOD) {
		ROD = rOD;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getLMA() {
		return LMA;
	}

	public void setLMA(String lMA) {
		LMA = lMA;
	}

	public String getMainharm() {
		return mainharm;
	}

	public void setMainharm(String mainharm) {
		this.mainharm = mainharm;
	}
	
	
	
}
