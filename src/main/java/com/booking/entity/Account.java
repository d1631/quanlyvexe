package com.booking.entity;

import java.sql.Timestamp;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "account")
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String fullname;
	
	private String phone;
	
	private String username;
	
	private String password;
	
	private String avatar;
	
	private Timestamp created_date;
	
	private int enable;
	
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	private List<UserRole> userRoles = new ArrayList<UserRole>();

	@OneToMany(mappedBy = "account")
	private List<Tuyenxe> tuyenxes = new ArrayList<Tuyenxe>();
	
	@OneToMany(mappedBy = "account")
	private List<Chuyenxe> chuyenxes = new ArrayList<Chuyenxe>();
	
	@OneToMany(mappedBy = "account")
	private List<Comment> comments = new ArrayList<Comment>();
	
	@OneToMany(mappedBy = "account")
	private List<DatXe> datXes = new ArrayList<DatXe>();
	
	public Account() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Timestamp getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Timestamp created_date) {
		this.created_date = created_date;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public List<UserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(List<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

	public List<Tuyenxe> getTuyenxes() {
		return tuyenxes;
	}

	public void setTuyenxes(List<Tuyenxe> tuyenxes) {
		this.tuyenxes = tuyenxes;
	}

	public List<Chuyenxe> getChuyenxes() {
		return chuyenxes;
	}

	public void setChuyenxes(List<Chuyenxe> chuyenxes) {
		this.chuyenxes = chuyenxes;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<DatXe> getDatXes() {
		return datXes;
	}

	public void setDatXes(List<DatXe> datXes) {
		this.datXes = datXes;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", fullname=" + fullname + ", phone=" + phone + ", username=" + username
				+ ", password=" + password + ", avatar=" + avatar + ", created_date=" + created_date + ", enable="
				+ enable + "]";
	}
	
	
	
}
