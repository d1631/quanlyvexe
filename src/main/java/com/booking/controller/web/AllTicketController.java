package com.booking.controller.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.booking.dao.ChuyenXeDao;
import com.booking.entity.Chuyenxe;

@Controller
@Transactional
public class AllTicketController {

	@Autowired
	private ChuyenXeDao chuyenXeDao;
	
	@RequestMapping(value = {"/all" }, method = RequestMethod.GET)
	public String allTicket(Model model, HttpServletRequest req) {
		String diemdi = req.getParameter("diemdi");
		String diemden = req.getParameter("diemden");
		model.addAttribute("listChuyenXe", chuyenXeDao.findAll());
		if(diemdi != null && diemden != null) {
			List<Chuyenxe> list = chuyenXeDao.findByLocation(diemdi, diemden);
			model.addAttribute("listChuyenXe",list);
		}
		return "/pages/web/all";
	}
}
