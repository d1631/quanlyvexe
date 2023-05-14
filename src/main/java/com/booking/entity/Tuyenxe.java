package com.booking.entity;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
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
@Table(name = "tuyenxe")
public class Tuyenxe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String diemdau;
	
	private String diemcuoi;
	
	private Timestamp ngaytao;
	
	private Double giatien;
	
	private String bienso;
	
	private String giokhoihanh;
	
	private String giove;
	
	@Column(name = "cac_chang_qua")
	private String cacChangQua;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "nguoitao")
	private Account account;
	
	@OneToMany(mappedBy = "tuyenxe")
	private List<Chuyenxe> chuyenxes = new ArrayList<Chuyenxe>();

	public Tuyenxe() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDiemdau() {
		return diemdau;
	}

	public void setDiemdau(String diemdau) {
		this.diemdau = diemdau;
	}

	public String getDiemcuoi() {
		return diemcuoi;
	}

	public void setDiemcuoi(String diemcuoi) {
		this.diemcuoi = diemcuoi;
	}

	public Timestamp getNgaytao() {
		return ngaytao;
	}

	public void setNgaytao(Timestamp ngaytao) {
		this.ngaytao = ngaytao;
	}

	public Double getGiatien() {
		return giatien;
	}

	public void setGiatien(Double giatien) {
		this.giatien = giatien;
	}

	public String getBienso() {
		return bienso;
	}

	public void setBienso(String bienso) {
		this.bienso = bienso;
	}

	public String getGiokhoihanh() {
		return giokhoihanh;
	}

	public void setGiokhoihanh(String giokhoihanh) {
		this.giokhoihanh = giokhoihanh;
	}

	public String getCacChangQua() {
		return cacChangQua;
	}

	public void setCacChangQua(String cacChangQua) {
		this.cacChangQua = cacChangQua;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<Chuyenxe> getChuyenxes() {
		return chuyenxes;
	}

	public void setChuyenxes(List<Chuyenxe> chuyenxes) {
		this.chuyenxes = chuyenxes;
	}

	public String getGiove() {
		return giove;
	}

	public void setGiove(String giove) {
		this.giove = giove;
	}

	@Override
	public String toString() {
		return "Tuyenxe [id=" + id + ", diemdau=" + diemdau + ", diemcuoi=" + diemcuoi + ", ngaytao=" + ngaytao
				+ ", giatien=" + giatien + ", bienso=" + bienso + ", giokhoihanh=" + giokhoihanh + ", cacChangQua="
				+ cacChangQua + "]";
	}
	
}
