package com.code.bean;

import java.io.Serializable;




/**
 * @author Administrator
 * @version 1.0
 * @created 10-十月-2015 16:59:38
 */
public class ProficientBean implements Serializable {
	
	private int id;
	
	private String name;
	
	private String gender;
	
	private String birthday;
	
	private String photo;
	
	private String speciality;  //专长
	
	private String degree;
	
	private String phoneNumber;
	
	private String workUnit;   //工作单位

	private String address;
	
	private String email;
	
	public ProficientBean() {
		
	}
	
	

	public ProficientBean(String name, String gender, String birthday,
			String photo, String speciality, String degree, String phoneNumber,
			String workUnit, String address, String email) {
		super();
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.photo = photo;
		this.speciality = speciality;
		this.degree = degree;
		this.phoneNumber = phoneNumber;
		this.workUnit = workUnit;
		this.address = address;
		this.email = email;
	}



	public ProficientBean(int id, String name, String gender, String birthday,
			String photo, String speciality, String degree, String phoneNumber,
			String workUnit, String address, String email) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.photo = photo;
		this.speciality = speciality;
		this.degree = degree;
		this.phoneNumber = phoneNumber;
		this.workUnit = workUnit;
		this.address = address;
		this.email = email;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getWorkUnit() {
		return workUnit;
	}

	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	
	

	
	
}