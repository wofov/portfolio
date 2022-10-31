package com.cafe24.wofov.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.wofov.domain.AdminProductDTO;
import com.cafe24.wofov.domain.CouponFileDTO;
import com.cafe24.wofov.domain.ShoppingCouponDTO;
import com.cafe24.wofov.service.AdminService;

@Controller
public class AdminShoppingCouponController {
	PrintWriter pr = null;
	
	LocalDateTime time = LocalDateTime.now();
	DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String today = time.format(df);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("admin-shopping")
	public String ShoppingCoupon(Model m,HttpServletRequest req) {
		List<ShoppingCouponDTO> list = adminService.getcouponAll();
		int size = 0;
		if(list==null) {size = 0;}
		else {size = list.size();}
		req.setAttribute("size", size);
		m.addAttribute("couponlist",list);
		return "admin/AdminShoppingCoupon/admin_shopping";
	}
	
	@RequestMapping("couponinsert")
	public void CouponInsert(CouponFileDTO file, @RequestParam Map<String,String> all,
			HttpServletRequest req,HttpServletResponse res)throws Exception {
		String filename = today.replace(":", "_")+file.getFile().getOriginalFilename();
		String filepath = req.getSession().getServletContext().getRealPath("/upload");
		filepath = filepath +"/"+filename+today.replace(":", "_");
		File fi = new File(filepath);
		file.getFile().transferTo(fi);
		ShoppingCouponDTO dto = new ShoppingCouponDTO();
		dto.setIdx("0");
		dto.setCpname(all.get("cpname"));
		dto.setCpw(all.get("cpw"));
		dto.setStda(all.get("stda")+" 00:00:00");
		dto.setEndda(all.get("endda")+" 23:59:59");
		dto.setCpsel(all.get("cpsel"));
		dto.setNump(all.get("nump"));
		dto.setMp(all.get("mp"));
		dto.setFile(filename);
		dto.setTime(today);
		adminService.InsertCoupon(dto);
		pr = res.getWriter();
		pr.print("<script>location.href='admin-shopping';</script>");
	}
	
	
	
	
	
}

