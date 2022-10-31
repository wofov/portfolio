package com.cafe24.wofov.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.wofov.domain.BasketListJoinDTO;
import com.cafe24.wofov.domain.EddMemberDTO;
import com.cafe24.wofov.domain.HomePageDTO;
import com.cafe24.wofov.domain.ProductListDTO;
import com.cafe24.wofov.domain.ShoppingBasketDTO;
import com.cafe24.wofov.service.EddService;
import com.inicis.std.util.SignatureUtil;
import com.mysql.cj.Session;


@Controller
public class EddProductController {
	@Autowired
	private EddService eddService;
	
	@RequestMapping(value="edd-main",method=RequestMethod.GET)
	public String ProductView(Model m,HttpServletRequest req) {
		String bcode = req.getParameter("bcode");
		List<ProductListDTO> list = eddService.ProductListView();
		int size=0;
		if(list==null) {size = 0;}
		else {size = list.size();}
		req.setAttribute("size", size);
		m.addAttribute("productlist",list);
		
		return "index";
	}
	@RequestMapping("item")
	public String item(HttpServletRequest req,Model m) {
		String idx = req.getParameter("idx");
		ProductListDTO dto = eddService.getItemPidx(idx);
		m.addAttribute("Item",dto);
		req.setAttribute("pct", dto.getPct());
		return "EddBasket/item";
	}
	
	
}
