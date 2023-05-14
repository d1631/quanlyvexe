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
import com.booking.dao.DatXeDao;
import com.booking.entity.Account;
import com.booking.entity.Chuyenxe;
import com.booking.entity.DatXe;

@Controller
@Transactional
public class WishListController {

	@Autowired
	private DatXeDao datXeDao;
	
	@Autowired
	private AccountDao accountDao;
	
	@Autowired
	private ChuyenXeDao chuyenXeDao;
	
	@RequestMapping(value = { "/wishlist" }, method = RequestMethod.GET)
	public String veCuaToi(Model model, Principal principal) {
		model.addAttribute("listTicket", datXeDao.findByUser(principal.getName()));
		return "/pages/web/wishlist";
	}
	
	@RequestMapping(value = { "/datve" }, method = RequestMethod.POST)
	public String muaVe(Model model, HttpServletRequest req, Principal principal) {
		if(principal.getName() == null) {
			return "redirect: loginRegis";
		}
		String sove = req.getParameter("sove");
		String id_ChuyenDi = req.getParameter("id");
		Account account = accountDao.getUserWithAuthority(principal.getName());
		Chuyenxe chuyenxe = chuyenXeDao.findById(Integer.valueOf(id_ChuyenDi));
		DatXe datXe = new DatXe();
		datXe.setGiave(chuyenxe.getPrice());
		datXe.setNgaydat(new Timestamp(System.currentTimeMillis()));
		datXe.setSove(Integer.valueOf(sove));
		datXe.setAccount(account);
		datXe.setChuyenxe(chuyenxe);
		datXeDao.addOrUpdate(datXe);
		return "redirect:wishlist";
	}
	
	@RequestMapping(value = { "/huyve" }, method = RequestMethod.GET)
	public String huyVe(Model model, HttpServletRequest req) {
		datXeDao.delete(Integer.valueOf(req.getParameter("id")));
		return "redirect:wishlist";
	}
}
