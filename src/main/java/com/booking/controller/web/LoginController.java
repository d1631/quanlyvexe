package com.booking.controller.web;

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

import com.booking.cloud.FileUpload;
import com.booking.dao.AccountDao;
import com.booking.entity.Account;
import com.booking.entity.UserRole;

@Controller
@Transactional
public class LoginController {

	public String PREFIX = "stream2file";
	public String SUFFIX = ".jpg";
	
	@Autowired
	private AccountDao accountDao;
	
	@RequestMapping(value = {"/loginRegis" }, method = RequestMethod.GET)
	public String loginAndSignOut(Model model) {
		model.addAttribute("account", new Account());
		return "/pages/web/login";
	}
	
	@RequestMapping(value = {"/regis" }, method = RequestMethod.POST)
	public String regis(Model model, @ModelAttribute Account account, HttpServletRequest req,@RequestParam("file") MultipartFile photo) {
		if(photo.isEmpty() == false && account.getPassword().equals(req.getParameter("repass"))) {
			String image = FileUpload.upload(photo);
			account.setAvatar(image);
			accountDao.addOrUpdate(account);
			UserRole userRole = new UserRole(account, "USER");
			accountDao.addRole(userRole);
			System.out.println(account);
		}
		else {
			
		}
		return "redirect: loginRegis";
	}
}
