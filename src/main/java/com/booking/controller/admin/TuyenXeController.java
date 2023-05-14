package com.booking.controller.admin;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.annotations.Param;
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
import com.booking.dao.TuyenXeDao;
import com.booking.entity.Account;
import com.booking.entity.Tuyenxe;

@Controller
@Transactional
public class TuyenXeController {

	@Autowired
	private TuyenXeDao tuyenXeDao;
	
	@Autowired
	private AccountDao accountDao;
	
	@RequestMapping(value = "/employee/tuyenxe", method = RequestMethod.GET)
	public ModelAndView adminPage(Model model) {
		model.addAttribute("listTuyenXe", tuyenXeDao.findAll());
		ModelAndView modelAndView = new ModelAndView("/pages/admin/listTuyenXe");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/addTuyenxe", method = RequestMethod.GET)
	public ModelAndView addTuyenxe(Model model, HttpServletRequest req) {
		model.addAttribute("tuyenxe", new Tuyenxe());
		if(req.getParameter("id") != null) {
			model.addAttribute("tuyenxe", tuyenXeDao.findById(Integer.valueOf(req.getParameter("id"))));
		}
		ModelAndView modelAndView = new ModelAndView("/pages/admin/addTuyenXe");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/addTx", method = RequestMethod.POST)
	public String addTuyenxeHandle(Model model, @ModelAttribute Tuyenxe tuyenxe, Principal principal) {
		Account account = accountDao.getUserWithAuthority(principal.getName());
		tuyenxe.setAccount(account);
		tuyenXeDao.addOrUpdate(tuyenxe);
		return "redirect: ../employee/tuyenxe";
	}
	
	@RequestMapping(value = "/admin/deleteTuyenxe", method = RequestMethod.GET)
	public String deleteEmployeeHandel(@RequestParam("id") String id) throws IOException, ServletException {
		tuyenXeDao.delete(Integer.valueOf(id));
		return "redirect:../employee/tuyenxe";
	}
}
