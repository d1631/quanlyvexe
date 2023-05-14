package com.booking.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "datxe")
public class DatXe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private Timestamp ngaydat;
	
	private Double giave;
	
	private int sove;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "khachhang")
	private Account account;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "chuyenxe")
	private Chuyenxe chuyenxe;

	public DatXe() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getNgaydat() {
		return ngaydat;
	}

	public void setNgaydat(Timestamp ngaydat) {
		this.ngaydat = ngaydat;
	}

	public Double getGiave() {
		return giave;
	}

	public void setGiave(Double giave) {
		this.giave = giave;
	}

	public int getSove() {
		return sove;
	}

	public void setSove(int sove) {
		this.sove = sove;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Chuyenxe getChuyenxe() {
		return chuyenxe;
	}

	public void setChuyenxe(Chuyenxe chuyenxe) {
		this.chuyenxe = chuyenxe;
	}
	
	
}
