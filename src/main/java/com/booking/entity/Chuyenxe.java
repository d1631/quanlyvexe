package com.booking.entity;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "chuyenxe")
public class Chuyenxe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private Date ngaydi;
	
	private String giodi;
	
	private String giove;
	
	private Double price;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "taixe")
	private Account account;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "tuyenxe")
	private Tuyenxe tuyenxe;
	
	@OneToMany(mappedBy = "chuyenxe")
	private List<Comment> comments = new ArrayList<Comment>();
	
	@OneToMany(mappedBy = "chuyenxe")
	private List<DatXe> datXes = new ArrayList<DatXe>();

	public Chuyenxe() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getNgaydi() {
		return ngaydi;
	}

	public void setNgaydi(Date ngaydi) {
		this.ngaydi = ngaydi;
	}

	public String getGiodi() {
		return giodi;
	}

	public void setGiodi(String giodi) {
		this.giodi = giodi;
	}

	public String getGiove() {
		return giove;
	}

	public void setGiove(String giove) {
		this.giove = giove;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Tuyenxe getTuyenxe() {
		return tuyenxe;
	}

	public void setTuyenxe(Tuyenxe tuyenxe) {
		this.tuyenxe = tuyenxe;
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
		return "Chuyenxe [id=" + id + ", ngaydi=" + ngaydi + ", giodi=" + giodi + ", giove=" + giove + ", price="
				+ price + ", account=" + account + ", tuyenxe=" + tuyenxe + "]";
	}

	
	
}
