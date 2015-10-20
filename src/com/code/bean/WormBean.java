package com.code.bean;

import java.io.Serializable;



/**
 * @author Administrator
 * @version 1.0
 * @created 10-十月-2015 16:59:38
 */
public class WormBean extends DisasterBean implements Serializable{

	/**
	 * 成虫图片
	 */
	private String adultWorm;
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
	/**
	 * 主要灾害
	 */
	private String harm;
	/**
	 * 寄主
	 */
	private String Host;
	private int id;
	/**
	 * 幼虫图片
	 */
	private String kidWorm;
	private String name;

	public WormBean(){

	}

	public String getAdultWorm() {
		return adultWorm;
	}

	public void setAdultWorm(String adultWorm) {
		this.adultWorm = adultWorm;
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

	public String getHarm() {
		return harm;
	}

	public void setHarm(String harm) {
		this.harm = harm;
	}

	public String getHost() {
		return Host;
	}

	public void setHost(String host) {
		Host = host;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getKidWorm() {
		return kidWorm;
	}

	public void setKidWorm(String kidWorm) {
		this.kidWorm = kidWorm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

}