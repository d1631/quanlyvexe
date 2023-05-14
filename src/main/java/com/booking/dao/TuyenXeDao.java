package com.booking.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.booking.entity.Tuyenxe;

@Repository
@Transactional
public class TuyenXeDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void addOrUpdate(Tuyenxe tuyenxe) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(tuyenxe);
	}
	
	@SuppressWarnings("unchecked")
	public List<Tuyenxe> findAll(){
		Session session = sessionFactory.getCurrentSession();
		List<Tuyenxe> list = new ArrayList<Tuyenxe>();
		Query query = session.createQuery("From Tuyenxe");
		list = query.list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public Tuyenxe findById(int id){
		Session session = sessionFactory.getCurrentSession();
		Tuyenxe tuyenxe = (Tuyenxe) session.get(Tuyenxe.class, id);
		return tuyenxe;
	}
	
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Tuyenxe tuyenxe = (Tuyenxe) session.get(Tuyenxe.class, id);
		session.delete(tuyenxe);
	}
}
