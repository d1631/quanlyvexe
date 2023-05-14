package com.booking.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeAdmin")
@Transactional
public class HomeAdminController {

	@RequestMapping(value = "/admin/trang-chu", method = RequestMethod.GET)
	public ModelAndView adminPage(Model model) {
		ModelAndView modelAndView = new ModelAndView("/pages/admin/index");
		return modelAndView;
	}
	
}
