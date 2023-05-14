package com.booking.controller.web;

import java.security.Principal;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.booking.dao.AccountDao;
import com.booking.dao.ChuyenXeDao;
import com.booking.dao.CommentDao;
import com.booking.entity.Account;
import com.booking.entity.Comment;

@Controller
@Transactional
public class CommentController {

	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private AccountDao accountDao;
	
	@Autowired
	private ChuyenXeDao chuyenXeDao;
	
	@RequestMapping(value = {"/addComment" }, method = RequestMethod.POST)
	public String loginAndSignOut(Model model, HttpServletRequest req, Principal principal) {
		String content = req.getParameter("content");
		Comment comment = new Comment();
		comment.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		comment.setAccount(accountDao.getUserWithAuthority(principal.getName()));
		comment.setChuyenxe(chuyenXeDao.findById(Integer.valueOf(req.getParameter("id"))));
		comment.setContent(content);
		commentDao.addOrUpdate(comment);
		String referer = req.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	@RequestMapping(value = {"/deleteComment" }, method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest req) {
		commentDao.delete(Integer.valueOf(req.getParameter("id")));
		String referer = req.getHeader("Referer");
		return "redirect:"+ referer;
	}
}
