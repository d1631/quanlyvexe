package com.booking.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.booking.entity.Chuyenxe;

@Repository
@Transactional
public class ChuyenXeDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addOrUpdate(Chuyenxe chuyenxe) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(chuyenxe);
	}
	
	@SuppressWarnings("unchecked")
	public List<Chuyenxe> findAll(){
		Session session = sessionFactory.getCurrentSession();
		List<Chuyenxe> list = new ArrayList<Chuyenxe>();
		Query query = session.createQuery("From Chuyenxe");
		list = query.list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Chuyenxe> findByLocation(String diemdi, String diemden){
		Session session = sessionFactory.getCurrentSession();
		List<Chuyenxe> list = new ArrayList<Chuyenxe>();
		Query query = session.createQuery("select c From Chuyenxe c inner join c.tuyenxe tx where (tx.diemdau = :diemdi and tx.diemcuoi = :diemden) or (tx.diemdau = :diemden and tx.diemcuoi = :diemdi)");
		query.setParameter("diemdi", diemdi);
		query.setParameter("diemden", diemden);
		list = query.list();
		return list;
	}
	
	public Chuyenxe findById(int id){
		Session session = sessionFactory.getCurrentSession();
		Chuyenxe chuyenxe = (Chuyenxe) session.get(Chuyenxe.class, id);
		return chuyenxe;
	}
	
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Chuyenxe chuyenxe = (Chuyenxe) session.get(Chuyenxe.class, id);
		session.delete(chuyenxe);
	}
}
