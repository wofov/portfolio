package com.cafe24.wofov.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.wofov.domain.BasketListJoinDTO;
import com.cafe24.wofov.domain.EddMemberDTO;
import com.cafe24.wofov.domain.ShoppingBasketDTO;
import com.cafe24.wofov.service.EddService;
import com.inicis.std.util.SignatureUtil;

@Controller
public class EddBasketController {
	@Autowired
	private EddService eddService;
	
	@RequestMapping(value="basket",method=RequestMethod.POST)
	@ResponseBody
	public String BasketList(Model m,HttpServletRequest req,HttpServletResponse res
			,@RequestParam Map<String, String> all) {
		String re = "";
		ShoppingBasketDTO dto = new ShoppingBasketDTO();
		dto.setIdx("0");
		dto.setSid(all.get("sid"));
		dto.setPidx(all.get("idx"));
		dto.setCt(all.get("ct"));
		if(all.get("sid")==null) {
			re="nocus";
		}
		else {
			List<ShoppingBasketDTO> idck = eddService.IdCk(all.get("sid"));
			if(idck==null) {
				eddService.BasketInsert(dto);
				re="ok";
			}
			else {
				int size = idck.size();
				int w = 0 ;
				while(w<size) {
					String idxck=idck.get(w).getPidx();
					if(all.get("idx").equals(idxck)) {
						re="overlap";
					}
					w++;
				}
				if(re.equals("")){
					eddService.BasketInsert(dto);
					re="ok";
				}
			}
		}
		return re;
	}
	
	@RequestMapping(value="order")
	public String order(HttpServletRequest req,@RequestParam("sid") String cid,Model m) {
		//@RequestParam("idx")String idx,@RequestParam("ct") String ct,
		if(cid==null) {
			//비회원전용
		}
		else {
			List<BasketListJoinDTO> list = eddService.BasketList(cid);
			List<EddMemberDTO> list2 = eddService.MemberPay(cid);
			int size = 0;
			if(list==null) {size=0;}
			else {size=list.size();}
			req.setAttribute("size", size);
			m.addAttribute("list",list);
			m.addAttribute("list2",list2);
		}
		return "EddBasket/order";
	}
	@RequestMapping("ordercart")
	public String order2(HttpServletRequest req,@RequestParam("cid") String cid,Model m) {
		//wofov//null
		if(cid==null) {
			//비회원전용
		}
		else {
			List<BasketListJoinDTO> list = eddService.BasketList(cid);
			int size = 0;
			if(list==null) {size=0;}
			else {size=list.size();}
			req.setAttribute("size", size);
			m.addAttribute("list",list);
		}
		return "EddBasket/ordercart";
	}
	
	@RequestMapping(value="cart-list-delete",method=RequestMethod.POST)
	@ResponseBody
	public String ProdcutListDelete(@RequestParam("delist") String ck,@RequestParam("cid") String cid) {
		if(cid==null) {
			
		}
		String re= "";
		if(ck!=null) {
			String ckpa[] = ck.split(",");
			int w = 1;
			int n = 0 ;
			while(w<ckpa.length) {
				eddService.CartProductDelete(cid,ckpa[w]);
				w++;
			}
			re="ok";
		}
		return re;
	}

	@RequestMapping(value="pay",method=RequestMethod.POST)
	public String Complet(Model m,HttpServletRequest req,@RequestParam Map<String,String> all)throws Exception {
		String cid = req.getParameter("cid");
		List<BasketListJoinDTO> list = eddService.BasketList(cid);
		int size = 0;
		if(list==null) {size=0;}
		else {size=list.size();}
		req.setAttribute("size", size);
		m.addAttribute("list",list);
		
		String mid					= "INIpayTest";		                    // 상점아이디					
		String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 웹 결제 signkey
		
		String mKey = SignatureUtil.hash(signKey, "SHA-256");

		String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성
		String orderNumber			= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
		String price				= "1000";								// 상품가격(특수기호 제외, 가맹점에서 직접 설정)

		/*이니시스 제공 코드*/
		Map<String, String> signParam = new HashMap<String, String>();

		signParam.put("oid", orderNumber);
		signParam.put("price", price);
		signParam.put("timestamp", timestamp);

		String signature = SignatureUtil.makeSignature(signParam);
		m.addAttribute("list2",all);
		return "EddBasket/complet";
	}
}
