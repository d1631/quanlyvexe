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

import com.booking.cloud.FileUpload;
import com.booking.dao.AccountDao;
import com.booking.entity.Account;
import com.booking.entity.UserRole;


@Controller
@Transactional
public class EmployeeController{

	public String PREFIX = "stream2file";
	public String SUFFIX = ".jpg";
	
	@Autowired
	private AccountDao accountDao;
	
	@RequestMapping(value = "/admin/employee", method = RequestMethod.GET)
	public String adminPage(Model model) {
		model.addAttribute("listEmployee", accountDao.findByRole("EMPLOYEE"));
		return "/pages/admin/listEmployee";
	}
	
	@RequestMapping(value = "/admin/addEmployee", method = RequestMethod.GET)
	public String addEmployee(Model model, HttpServletRequest req) {
		if(req.getParameter("id") != null) {
			int ids = Integer.valueOf(req.getParameter("id"));
			Account account = accountDao.findById(ids);
			System.out.println(account);
			model.addAttribute("employee", account);
		}
		else {
			model.addAttribute("employee", new Account());
		}
		return "/pages/admin/addEmployee";
	}
	
	@RequestMapping(value = "/admin/addEmp", method = RequestMethod.POST)
	public String addEmployeeHandel(@ModelAttribute Account account, HttpServletRequest req,@RequestParam("file") MultipartFile photo) throws IOException, ServletException {
		if(photo.isEmpty() == false) {
			String image = FileUpload.upload(photo);
			account.setAvatar(image);
		}
		int check = account.getId();
		accountDao.addOrUpdate(account);
		if(check == 0) {
			UserRole userRole = new UserRole(account, "EMPLOYEE");
			accountDao.addRole(userRole);
		}
		return "redirect:../admin/employee";
	}
	
	@RequestMapping(value = "/admin/deleteEmployee", method = RequestMethod.GET)
	public String deleteEmployeeHandel(@RequestParam("id") String id) throws IOException, ServletException {
		accountDao.delete(Integer.valueOf(id));
		return "redirect:../admin/employee";
	}
}
