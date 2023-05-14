package com.booking.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.booking.entity.DatXe;

@Repository
@Transactional
public class DatXeDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void addOrUpdate(DatXe datXe) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(datXe);
	}
	
	public List<DatXe> findByUser(String username) {
		Session session = sessionFactory.getCurrentSession();
		List<DatXe> list = null;
		String sql = "select d from DatXe d inner join d.account a where a.username = :username";
		Query query = session.createQuery(sql);
		query.setParameter("username", username);
		list = query.list();
		return list;
	}
	
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		DatXe dx = (DatXe) session.get(DatXe.class, id);
		session.delete(dx);
	}
}
