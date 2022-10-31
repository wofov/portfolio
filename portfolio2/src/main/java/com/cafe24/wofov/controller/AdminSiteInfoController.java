package com.cafe24.wofov.controller;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.wofov.domain.HomePageDTO;
import com.cafe24.wofov.service.AdminService;

@Controller
public class AdminSiteInfoController {
	
	PrintWriter pr = null;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="admin-siteinfo",method=RequestMethod.POST)
	public String AdminSiteInfo(Model m,HttpServletRequest req) {
		List<HomePageDTO> siteinfo = adminService.getSiteInfo();
		m.addAttribute("siteinfo",siteinfo);
		req.setAttribute("hmjoin_poenum", siteinfo.get(0).getHmjoin_poenum());
		req.setAttribute("paycard", siteinfo.get(0).getPaycard());
		req.setAttribute("paytel", siteinfo.get(0).getPaytel());
		req.setAttribute("payha", siteinfo.get(0).getPayha());
		req.setAttribute("paycash", siteinfo.get(0).getPaycash());
		req.setAttribute("pay_hope", siteinfo.get(0).getPay_hope());
		return "admin/AdminSiteInfo/admin_config";
	}
	@RequestMapping(value="admin-siteinfo-update",method=RequestMethod.POST)
	public String SiteInfoUpdate(@RequestParam Map<String,String> all,Model m,HttpServletRequest req,HttpServletResponse res) throws Exception{
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = time.format(df);
		HomePageDTO dto = new HomePageDTO();
		dto.setIdx("0");
		dto.setHmjoin_sub(all.get("a1"));
		dto.setHmjoin_email(all.get("a2"));
		dto.setHmjoin_poenum(all.get("ra1"));
		dto.setHmjoin_point(all.get("a5"));
		dto.setHmjoin_level(all.get("a6"));
		dto.setBasic_na(all.get("b1"));
		dto.setBasic_lnum(all.get("b2"));
		dto.setBasic_ld(all.get("b3"));
		dto.setBasic_ltel(all.get("b4"));
		dto.setBasic_tnum(all.get("b5"));
		dto.setBasic_bnum(all.get("b6"));
		dto.setBasic_addrnum(all.get("b7"));
		dto.setBasic_addr(all.get("b8"));
		dto.setBasic_jna(all.get("b9"));
		dto.setBasic_email(all.get("b10"));
		dto.setPay_bank(all.get("c1"));
		dto.setPay_banknum(all.get("c2"));
		dto.setPaycard(all.get("ra2"));
		dto.setPaytel(all.get("ra3"));
		dto.setPayha(all.get("ra4"));
		dto.setPaymi(all.get("c9"));
		dto.setPayma(all.get("c10"));
		dto.setPaycash(all.get("ra5"));
		dto.setPay_adna(all.get("c12"));
		dto.setPay_adpay(all.get("c13"));
		dto.setPay_hope(all.get("ra6"));
		dto.setTime(today);
		adminService.InsertSiteInfo(dto);
		
		List<HomePageDTO> siteinfo = adminService.getSiteInfo();
		m.addAttribute("siteinfo",siteinfo);
		req.setAttribute("hmjoin_poenum", siteinfo.get(0).getHmjoin_poenum());
		req.setAttribute("paycard", siteinfo.get(0).getPaycard());
		req.setAttribute("paytel", siteinfo.get(0).getPaytel());
		req.setAttribute("payha", siteinfo.get(0).getPayha());
		req.setAttribute("paycash", siteinfo.get(0).getPaycash());
		req.setAttribute("pay_hope", siteinfo.get(0).getPay_hope());
		
		return "admin/AdminSiteInfo/admin_config";
	}
	
}
