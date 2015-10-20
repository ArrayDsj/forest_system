package com.code.bean;

import java.io.Serializable;



/**
 * @author Administrator
 * @version 1.0
 * @created 10-十月-2015 16:59:38
 */
public class DrugBean extends DrugApparatusBean implements Serializable{

	private int id;
	private String name;
	private DisasterBean disBean;
	private String tree;
	private String type;
	
	public DrugBean(){

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
	public DisasterBean getDisBean() {
		return disBean;
	}
	public void setDisBean(DisasterBean disBean) {
		this.disBean = disBean;
	}
	public String getTree() {
		return tree;
	}
	public void setTree(String tree) {
		this.tree = tree;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}