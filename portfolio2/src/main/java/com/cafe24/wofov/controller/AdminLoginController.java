package com.cafe24.wofov.controller;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.wofov.domain.AdminInfoUpdateDTO;
import com.cafe24.wofov.domain.Admin_LoginDTO;
import com.cafe24.wofov.service.AdminService;

@Controller
public class AdminLoginController {

HttpSession session = null;
	
	PrintWriter pr = null;
	
	LocalDateTime time = LocalDateTime.now();
	DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String today = time.format(df);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="idck",method=RequestMethod.POST)
	@ResponseBody
	public String AdminIdCk(Model m,HttpServletRequest req,HttpServletResponse res,@RequestParam("jid") String jid) throws Exception{
		res.setContentType("text/html; charset=utf-8");
		String re="";
		Admin_LoginDTO adlogin = adminService.getjid(jid);
		if(adlogin==null) {re="ok";}
		else {re="no";}
		return re;
	}
	
	@RequestMapping(value="admin-join-insert",method=RequestMethod.POST)
	public String Admin_Join_Info(@RequestParam Map<String, String> all) { 
		Admin_LoginDTO dto = new Admin_LoginDTO();
		dto.setJidx(0);
		dto.setJid(all.get("jid"));
		dto.setJpw(all.get("jpw"));
		dto.setJname(all.get("jname"));
		dto.setJemail(all.get("jemail"));
		dto.setJtel(all.get("te1")+all.get("te2")+all.get("te3"));
		dto.setJm1(all.get("jm1"));
		dto.setJm2(all.get("jm2"));
		dto.setJtime(today);
		dto.setJenum("Y");
		adminService.InsertAdminJoin(dto);
		return "admin/index";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public String Login(Model m,HttpServletRequest req,HttpServletResponse res,@RequestParam("adid") String jid,@RequestParam("adpw") String jpw)throws Exception {
		res.setContentType("text/html; charset=utf-8");
		String msg="";
		Admin_LoginDTO adlogin = adminService.getjid(jid);
		if(adlogin!=null) {
			if(adlogin.getJpw().equals(jpw) && adlogin.getJenum().equals("N")) {
				msg="ok";
				session = req.getSession();
				session.setAttribute("aid", jid);
				session.setAttribute("anm", adlogin.getJname());
				m.addAttribute("anm",adlogin.getJname());
			}
			else if(adlogin.getJpw().equals(jpw) && adlogin.getJenum().equals("Y")){msg="notyet";}
			else {msg="no";}
		}
		return msg;
	}
	
	@RequestMapping(value="admin-main",method=RequestMethod.GET)
	public String AdminMain(Model m,HttpServletRequest req) {
		List<Admin_LoginDTO> list = adminService.getAll();
		int size = 0;
		if(list==null) {size = 0;}
		else {size = list.size();}
		m.addAttribute("admin_list_Y",list);
		req.setAttribute("size", size);
		return "admin/AdminLogin/admin_main";
	}
	
	@RequestMapping(value="admin-listokno",method=RequestMethod.GET)
	public void Joinok(@RequestParam("upok") Integer jidx,@RequestParam("deok") Integer jidx2,Model m
			,HttpServletRequest req,HttpServletResponse res) throws Exception{
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		pr = res.getWriter();
		String re="";
		if(jidx2==null) {adminService.getjidx(jidx);
			re="<script>alert('승인 완료');location.href='admin-main';</script>";}
		else {adminService.getjidx2(jidx2);
			re="<script>alert('미승인 완료');location.href='admin-main';</script>";}
		pr.print(re);
		pr.close();
	}
	@RequestMapping(value="info-update")
	public String AdminInfoUpdate(@RequestParam Map<String, String> all,Model m,HttpServletRequest req) {
		System.out.println(all);
		AdminInfoUpdateDTO dto = new AdminInfoUpdateDTO();
		dto.setJid(all.get("id1"));
		dto.setJpw(all.get("pw1"));
		dto.setJname(all.get("na1"));
		dto.setJemail(all.get("email1"));
		dto.setJtel(all.get("tel1")+all.get("tel2")+all.get("tel3"));
		dto.setJm1(all.get("sel1"));
		dto.setJm2(all.get("sel2"));
		System.out.println(dto);
		adminService.UpdateAdminInfo(dto);
		
		session = req.getSession();
		session.invalidate();
		
		return "admin/index";
	}
	
	@RequestMapping("logout")
	public String AdminLogout(HttpServletRequest req) {
		session = req.getSession();
		session.invalidate();
		return "admin/index";
	}
	
	
}
