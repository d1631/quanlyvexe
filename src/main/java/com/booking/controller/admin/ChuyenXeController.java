package com.booking.controller.admin;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.booking.dao.AccountDao;
import com.booking.dao.ChuyenXeDao;
import com.booking.dao.TuyenXeDao;
import com.booking.entity.Account;
import com.booking.entity.Chuyenxe;
import com.booking.entity.Tuyenxe;

@Controller
@Transactional
public class ChuyenXeController {

	@Autowired
	private TuyenXeDao tuyenXeDao;
	
	@Autowired
	private AccountDao accountDao;
	
	@Autowired
	private ChuyenXeDao chuyenXeDao;
	
	@RequestMapping(value = "/employee/chuyenxe", method = RequestMethod.GET)
	public ModelAndView adminPage(Model model) {
		model.addAttribute("listChuyenXe", chuyenXeDao.findAll());
		ModelAndView modelAndView = new ModelAndView("/pages/admin/listChuyenXe");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/addChuyenxe", method = RequestMethod.GET)
	public ModelAndView addChuyenxe(Model model, HttpServletRequest req) {
		model.addAttribute("chuyenxe", new Chuyenxe());
		model.addAttribute("listTaiXe", accountDao.findByRole("DRIVER"));
		model.addAttribute("listTuyenXe", tuyenXeDao.findAll());
		if(req.getParameter("id") != null) {
			model.addAttribute("chuyenxe", chuyenXeDao.findById(Integer.valueOf(req.getParameter("id"))));
		}
		ModelAndView modelAndView = new ModelAndView("/pages/admin/addChuyenXe");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/addCx", method = RequestMethod.POST)
	public String addTuyenxeHandle(Model model, @ModelAttribute Chuyenxe chuyenxe, @RequestParam("taixe") String taixe, @RequestParam("tx") String tx) {
		System.out.println("======================");
		Tuyenxe txe = tuyenXeDao.findById(Integer.valueOf(tx));
		if(chuyenxe.getGiodi() == null || chuyenxe.getGiodi() == "") {
			chuyenxe.setGiodi(txe.getGiokhoihanh());
		}
		if(chuyenxe.getGiove() == null || chuyenxe.getGiove() =="") {
			chuyenxe.setGiove(txe.getGiove());
		}
		if(chuyenxe.getPrice() == null) {
			chuyenxe.setPrice(txe.getGiatien());
		}
		chuyenxe.setAccount(accountDao.findById(Integer.valueOf(taixe)));
		chuyenxe.setTuyenxe(txe);
		System.out.println(chuyenxe);
		chuyenXeDao.addOrUpdate(chuyenxe);
		return "redirect: ../employee/chuyenxe";
	}
	
	@RequestMapping(value = "/admin/deleteChuyenxe", method = RequestMethod.GET)
	public String deleteEmployeeHandel(@RequestParam("id") String id) throws IOException, ServletException {
		chuyenXeDao.delete(Integer.valueOf(id));
		return "redirect:../employee/chuyenxe";
	}
}
