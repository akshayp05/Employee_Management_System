package com.model;

public class Employee {
	private int id;
	private String name;
	private String  gender;
	private String date_of_birth;
	private String hobbies;
	private String address_1;
	private String address_2;
	private String city;
	private String state;
	private String pin_code;
	private String pancard_no;
	private String profile;
	
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", gender=" + gender + ", date_of_birth=" + date_of_birth
				+ ", hobbies=" + hobbies + ", address_1=" + address_1 + ", address_2=" + address_2 + ", city=" + city
				+ ", state=" + state + ", pin_code=" + pin_code + ", pancard_no=" + pancard_no + ", profile=" + profile
				+ "]";
	}
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Employee(String name, String gender, String date_of_birth, String hobbies, String address_1,
			String address_2, String city, String state, String pin_code, String pancard_no, String profile) {
		super();
		this.name = name;
		this.gender = gender;
		this.date_of_birth = date_of_birth;
		this.hobbies = hobbies;
		this.address_1 = address_1;
		this.address_2 = address_2;
		this.city = city;
		this.state = state;
		this.pin_code = pin_code;
		this.pancard_no = pancard_no;
		this.profile = profile;
	}
	public Employee(int id, String name, String gender, String date_of_birth, String hobbies, String address_1,
			String address_2, String city, String state, String pin_code, String pancard_no, String profile) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.date_of_birth = date_of_birth;
		this.hobbies = hobbies;
		this.address_1 = address_1;
		this.address_2 = address_2;
		this.city = city;
		this.state = state;
		this.pin_code = pin_code;
		this.pancard_no = pancard_no;
		this.profile = profile;
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
	public String getDate_of_birth() {
		return date_of_birth;
	}
	public void setDate_of_birth(String date_of_birth) {
		this.date_of_birth = date_of_birth;
	}
	public String getHobbies() {
		return hobbies;
	}
	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}
	public String getAddress_1() {
		return address_1;
	}
	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}
	public String getAddress_2() {
		return address_2;
	}
	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPin_code() {
		return pin_code;
	}
	public void setPin_code(String pin_code) {
		this.pin_code = pin_code;
	}
	public String getPancard_no() {
		return pancard_no;
	}
	public void setPancard_no(String pancard_no) {
		this.pancard_no = pancard_no;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}

	
	
}

