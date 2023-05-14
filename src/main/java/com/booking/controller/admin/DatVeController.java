package com.booking.controller.admin;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.booking.dao.AccountDao;
import com.booking.dao.ChuyenXeDao;
import com.booking.dao.DatXeDao;
import com.booking.entity.Chuyenxe;
import com.booking.entity.DatXe;

@Controller
@Transactional
public class DatVeController {

	@Autowired
	private DatXeDao datXeDao;
	
	@Autowired
	private ChuyenXeDao chuyenXeDao;
	
	
	@RequestMapping(value = "/employee/datxe", method = RequestMethod.GET)
	public ModelAndView datxe(Model model) {
		model.addAttribute("listChuyenXe", chuyenXeDao.findAll());
		ModelAndView modelAndView = new ModelAndView("/pages/admin/datvenhanvien");
		return modelAndView;
	}
	
	@RequestMapping(value = "/employee/datve", method = RequestMethod.POST)
	public String datve(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		String number = req.getParameter("sove");
		DatXe datXe = new DatXe();
		datXe.setSove(Integer.valueOf(number));
		datXe.setNgaydat(new Timestamp(System.currentTimeMillis()));
		Chuyenxe chuyenxe = chuyenXeDao.findById(Integer.valueOf(id));
		datXe.setChuyenxe(chuyenxe);
		datXe.setGiave(chuyenxe.getPrice());
		datXeDao.addOrUpdate(datXe);
		return "redirect: ../employee/chuyenxe";
	}
}
