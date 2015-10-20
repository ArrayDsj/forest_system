package com.code.bean;

import java.io.Serializable;

/**
 * @author Administrator
 * @version 1.0
 * @created 10-十月-2015 16:59:37
 */
public class ApparatusBean extends DrugApparatusBean implements Serializable{

	private int id;
	/**
	 * 主要用途
	 */
	private String mainUse;
	private String name;
	private String type;
	public ApparatusBean(){

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

	public String getMainUse() {
		return mainUse;
	}

	public void setMainUse(String mainUse) {
		this.mainUse = mainUse;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}