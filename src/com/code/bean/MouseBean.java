package com.code.bean;

import java.io.Serializable;



/**
 * @author Administrator
 * @version 1.0
 * @created 10-十月-2015 16:59:38
 */
public class MouseBean extends DisasterBean implements Serializable{

	/**
	 * 繁殖
	 */
	private String breed;
	/**
	 * 防治措施
	 */
	private String controlMeasures;
	/**
	 * 天敌
	 */
	private String enemy;
	private String food;
	private int id;
	/**
	 * 主要危害
	 */
	private String mainHarm;
	private String name;
	private String photo;

	public MouseBean(){

	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getControlMeasures() {
		return controlMeasures;
	}

	public void setControlMeasures(String controlMeasures) {
		this.controlMeasures = controlMeasures;
	}

	public String getEnemy() {
		return enemy;
	}

	public void setEnemy(String enemy) {
		this.enemy = enemy;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMainHarm() {
		return mainHarm;
	}

	public void setMainHarm(String mainHarm) {
		this.mainHarm = mainHarm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	

}