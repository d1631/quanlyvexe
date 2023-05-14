package com.booking.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.booking.entity.Comment;
import com.booking.entity.DatXe;

@Repository
@Transactional
public class CommentDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public void addOrUpdate(Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(comment);
		
	}
	
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Comment comment = (Comment) session.get(Comment.class, id);
		session.delete(comment);
	}
	
	public List<Comment> findByChuyenXe(int id_chuyenxe){
		Session session = sessionFactory.getCurrentSession();
		List<Comment> list = null;
		String sql = "select c from Comment c inner join c.chuyenxe cx where cx.id = :id";
		Query query = session.createQuery(sql);
		query.setParameter("id", id_chuyenxe);
		list = query.list();
		return list;
	}
}
