package com.cafe24.wofov.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.wofov.domain.Admin_NoticeCountDTO;
import com.cafe24.wofov.domain.Admin_NoticeDTO;
import com.cafe24.wofov.domain.EddFaqDTO;
import com.cafe24.wofov.domain.HomePageDTO;
import com.cafe24.wofov.service.EddService;
@Controller
public class EddInfoController {
	@Autowired
	private EddService eddService;
	
	@RequestMapping(value="footer-info",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> FooterInfo(Model m,HttpServletRequest req) {
		Map<String, Object> mp = new HashMap<String,Object>();
		List<HomePageDTO> list = eddService.Footer();
		m.addAttribute("home",list);
		req.setAttribute("homelist", list);
		mp.put("list", list);
		return mp;
	}
	
	@RequestMapping(value="cs",method=RequestMethod.GET)
	public String Cs(Model m,@RequestParam("cate")String cate,HttpServletRequest req) {
		List<EddFaqDTO> list = null;
		if(cate.equals("6")) {
			list = eddService.FAQ();
			int size = 0;
			if(list==null) {size = 0;}
			else {size = list.size();}
			m.addAttribute("faq",list);
			req.setAttribute("size", size);
		}
		else {
			list = eddService.FAQAll(cate);
			int size = 0;
			if(list==null) {size = 0;}
			else {size = list.size();}
			m.addAttribute("faq",list);
			req.setAttribute("size", size);
		}
		String msg="";
		if(cate.intern()=="1") {
			msg="배송문의";
		}
		else if(cate.intern()=="2") {
			msg="반품/교환문의";
		}
		else if(cate.intern()=="3") {
			 msg="상품문의";
		}
		else if(cate.intern()=="4") {
			 msg="쿠폰내역";
		}
		else if(cate.intern()=="5") {
			msg="마일리지내역";
		}
		else {
			msg="자주묻는질문";
		}
		req.setAttribute("msg", msg);
		return "EddInfo/cs";
	}
	
	@RequestMapping(value="edd-notice",method=RequestMethod.GET)
	public String EddNotice(Model m,HttpServletRequest req,HttpServletResponse res) {
		String pgno = req.getParameter("page");
		String sear = req.getParameter("search");
		if(sear==null) {
			sear="";
		}
		else {
			sear=sear.trim();
		}
		String val = req.getParameter("val");
		String search = "%"+sear+"%";
		String sqlsh,hid,valid = "";
		int valck = 0;
		if(sear == null || sear.equals("")){sqlsh=""; hid=""; valid="";}
		else{ 
			hid=sear;
			if(val.equals("1")){
			valck=1; valid="1";}
			else if(val.equals("2")){
			valck=2; valid="2";}
			else{
			valck=1;}
		}
		
		List<Admin_NoticeDTO> dataon = eddService.getAd_Notice_All1(search);
		Admin_NoticeCountDTO ct = eddService.getct(search);
		int nullct=0;
		if(ct.getCt()==0) {nullct=0;}
		else {nullct=ct.getCt();}
		int pageview = 5;
		int stpg = 0 ;
		int pgnum = 1;
		int repg = 0;
		if(pgno==null||pgno.equals("")){stpg=0;}
		else{
			repg = Integer.parseInt(pgno);
			stpg = (repg - 1) * pageview;}
		
		if(nullct % pageview == 0){pgnum = nullct / pageview;}
		else{pgnum = (nullct / pageview) + 1;}
	
		List<Admin_NoticeDTO> data4 = eddService.getAd_Notice_All3(search,stpg ,pageview);
		int dataonsize = dataon.size();
		int data4size = data4.size();
		req.setAttribute("nullct",nullct );
		req.setAttribute("stpg",stpg );
		req.setAttribute("pgnum",pgnum );
		req.setAttribute("repg",repg );
		
		req.setAttribute("a1", dataonsize);
		req.setAttribute("a2", data4size);
		m.addAttribute("dataon",dataon);
		m.addAttribute("data4",data4);
		
		req.setAttribute("valck", valck);
		req.setAttribute("valid", valid);
		req.setAttribute("hid", hid);
		req.setAttribute("sear", sear);
		
		return "EddInfo/notice";
	}
	
}
