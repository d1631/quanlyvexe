package com.booking.controller.web;

import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.booking.dao.ChuyenXeDao;
import com.booking.dao.CommentDao;
import com.booking.entity.Chuyenxe;

@Controller
@Transactional
public class DetailController {

	@Autowired
	private ChuyenXeDao chuyenXeDao;
	
	@Autowired
	private CommentDao commentDao;
	
	@RequestMapping(value = { "/detail" }, method = RequestMethod.GET)
	public String detail(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		Chuyenxe cxe = chuyenXeDao.findById(Integer.valueOf(id));
		model.addAttribute("chuyenxe", cxe);
		model.addAttribute("listComment", commentDao.findByChuyenXe(cxe.getId()));
		model.addAttribute("day", getDayOfWeek(cxe.getNgaydi()));
		model.addAttribute("days", cxe.getNgaydi().toString().split("-")[2]);
		model.addAttribute("month", cxe.getNgaydi().toString().split("-")[1]);
		model.addAttribute("year", cxe.getNgaydi().toString().split("-")[0]);
		return "/pages/web/detail";
	}
	
	public String getDayOfWeek(Date date) {
		Calendar cal = Calendar.getInstance();
		
	    cal.setTime(date);
	    if(cal.get(Calendar.DAY_OF_WEEK) == 1) {
	    	return "SUNDAY";
	    }
	    else if(cal.get(Calendar.DAY_OF_WEEK) == 2) {
	    	return "Monday";
	    }
	    else if(cal.get(Calendar.DAY_OF_WEEK) == 3) {
	    	return "Tuesday";
	    }
	    else if(cal.get(Calendar.DAY_OF_WEEK) == 4) {
	    	return "Wednesday";
	    }
	    else if(cal.get(Calendar.DAY_OF_WEEK) == 5) {
	    	return "Thursday";
	    }
	    else if(cal.get(Calendar.DAY_OF_WEEK) == 6) {
	    	return "Friday";
	    }
	    else if(cal.get(Calendar.DAY_OF_WEEK) == 7) {
	    	return "Saturday";
	    }
		return null;
	}
}
