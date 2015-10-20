package com.code.bean;

import java.io.Serializable;
import java.util.Date;



/**
 * @author Administrator
 * @version 1.0
 * @created 10-十月-2015 16:59:38
 */
public class OutWareHouseBean implements Serializable{

	private DrugApparatusBean dab;  //药剂和器械的父类
	/**
	 * 领用小班
	 */
	private String consumingClass;
	/**
	 * 领用数量
	 */
	private String consumingNumber;
	
	private int id;
	/**
	 * 主要用途
	 */
	private String mianUse;
	/**
	 * 防止类型
	 */
	private String preventType;
	
	private Date time;
	
	public int type;
	public OutWareHouseBean(){

	}

	

	public int getType() {
		return type;
	}



	public void setType(int type) {
		this.type = type;
	}



	public String getConsumingClass() {
		return consumingClass;
	}

	public void setConsumingClass(String consumingClass) {
		this.consumingClass = consumingClass;
	}

	public String getConsumingNumber() {
		return consumingNumber;
	}

	public void setConsumingNumber(String consumingNumber) {
		this.consumingNumber = consumingNumber;
	}

	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMianUse() {
		return mianUse;
	}

	public void setMianUse(String mianUse) {
		this.mianUse = mianUse;
	}

	public String getPreventType() {
		return preventType;
	}

	public void setPreventType(String preventType) {
		this.preventType = preventType;
	}

	

	public Date getTime() {
		return time;
	}



	public void setTime(Date time) {
		this.time = time;
	}



	public DrugApparatusBean getDab() {
		return dab;
	}



	public void setDab(DrugApparatusBean dab) {
		this.dab = dab;
	}

	

}