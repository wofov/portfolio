package com.cafe24.wofov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.wofov.domain.Admin_LoginDTO;
import com.cafe24.wofov.service.AdminService;

@Controller
public class AdminViewController {
	@Autowired
	private AdminService adminService;
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(Model m,@RequestParam("adid") String jid,@RequestParam("adpw") String jpw) {
		String msg="";
		Admin_LoginDTO adlogin = adminService.getjid(jid);
		if(adlogin!=null) {
			if(adlogin.getJpw().equals(jpw)) {
				msg="환영";
			}
			else {
				msg="회원정보를 확인하세여";
			}
		}
		m.addAttribute("dto",msg);
		return "test";
	}
}
