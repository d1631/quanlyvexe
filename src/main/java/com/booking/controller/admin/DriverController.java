package com.booking.controller.admin;

import java.io.IOException;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.booking.cloud.FileUpload;
import com.booking.dao.AccountDao;
import com.booking.entity.Account;
import com.booking.entity.UserRole;

@Controller
@Transactional
public class DriverController {

	public String PREFIX = "stream2file";
	public String SUFFIX = ".jpg";
	
	@Autowired
	private AccountDao accountDao;
	
	@RequestMapping(value = "/admin/driver", method = RequestMethod.GET)
	public ModelAndView adminPage(Model model) {
		model.addAttribute("listDriver", accountDao.findByRole("DRIVER"));
		ModelAndView modelAndView = new ModelAndView("/pages/admin/listDriver");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/addDriver", method = RequestMethod.GET)
	public ModelAndView addDriver(Model model, HttpServletRequest req) {
		if(req.getParameter("id") != null) {
			int ids = Integer.valueOf(req.getParameter("id"));
			Account account = accountDao.findById(ids);
			System.out.println(account);
			model.addAttribute("driver", account);
		}
		else {
			model.addAttribute("driver", new Account());
		}
		ModelAndView modelAndView = new ModelAndView("/pages/admin/addDriver");
		return modelAndView;
	}
	
	@RequestMapping(value = "/admin/addDriver", method = RequestMethod.POST)
	public String addDriverHandel(@ModelAttribute Account account, HttpServletRequest req,@RequestParam("file") MultipartFile photo) throws IOException, ServletException {
		if(photo.isEmpty() == false) {
			String image = FileUpload.upload(photo);
			account.setAvatar(image);
		}
		int check = account.getId();
		accountDao.addOrUpdate(account);
		if(check == 0) {
			UserRole userRole = new UserRole(account, "DRIVER");
			accountDao.addRole(userRole);
		}
		return "redirect:../admin/driver";
	}
	
	@RequestMapping(value = "/admin/deleteDriver", method = RequestMethod.GET)
	public String deleteDriverHandel(@RequestParam("id") String id) throws IOException, ServletException {
		accountDao.delete(Integer.valueOf(id));
		return "redirect:../admin/driver";
	}
	
}
