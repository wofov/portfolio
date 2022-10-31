package com.cafe24.wofov.controller;

import java.io.File;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cafe24.wofov.domain.AdminProductDTO;
import com.cafe24.wofov.domain.AdminProductFileDTO;
import com.cafe24.wofov.domain.CouponFileDTO;
import com.cafe24.wofov.domain.ProductBcodeDTO;
import com.cafe24.wofov.domain.ProductCategoryDTO;
import com.cafe24.wofov.domain.ProductScodeDTO;
import com.cafe24.wofov.domain.ShoppingCouponDTO;
import com.cafe24.wofov.service.AdminService;


@Controller
public class AdminProductController {
	PrintWriter pr = null;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="admin-product",method=RequestMethod.POST)
	public String AdminProductList(Model m,HttpServletRequest req,HttpServletResponse res) {
		res.setContentType("text/html; charset=utf-8");
		List<AdminProductDTO> adminproduct =null;
		String val = req.getParameter("val");
		String sear = req.getParameter("sear");
		String search = req.getParameter("sear");
		if(sear==null) {sear="";}
		sear = "%"+sear+"%";
		if(val.intern()=="1") {
			adminproduct = adminService.getproductAllpname(sear);}
		else {
			adminproduct = adminService.getproductAll(sear);}
		int a1 = 0;
		if(adminproduct==null) {a1 = 0;}
		else {a1 = adminproduct.size();}
		m.addAttribute("adprolist",adminproduct);
		req.setAttribute("a1", a1);
		req.setAttribute("val", val);
		req.setAttribute("sear", search);
		return "admin/AdminProduct/admin_product";
	}
	
	@RequestMapping(value="admin-product-write")
	public String AdminproductWrite(Model m,HttpServletRequest req) {
		List<ProductBcodeDTO> list = adminService.getbcodeAll();
		int size = 0;
		if(list==null) {size = 0;}
		else {size = list.size();}
		req.setAttribute("size", size);
		m.addAttribute("codelist",list);
		return "admin/AdminProduct/admin_product_write";
	}
	
	@RequestMapping("scodelist")
	@ResponseBody
	public String ProductScodeList(@RequestParam("scode") String scode,
			HttpServletRequest req,HttpServletResponse res)throws Exception {
		res.setContentType("text/html; charset=utf-8");
		List<ProductScodeDTO> list = adminService.getscodeAll(scode);
		String sco="";
		int w = 0;
		while(w<list.size()) {sco+="."+list.get(w).getScode();
			w++;}
		return sco;
	}
	
	@RequestMapping(value="pcodeck",method=RequestMethod.POST)
	@ResponseBody
	public String PcodeCk(@RequestParam("pcode") String pcode) {
		String re="";
		AdminProductDTO codeck = adminService.getCheck(pcode);
		if(codeck==null) {re="ok";}
		else {re="no";}
		return re;
	}
	
	@RequestMapping(value="product-write",method=RequestMethod.POST)
	public void ProductWrite(AdminProductFileDTO file, @RequestParam Map<String,String> all, 
			HttpServletRequest req,HttpServletResponse res) throws Exception{
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = time.format(df);
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8");
		pr = res.getWriter();
		System.out.println(today);
		String filename = today.replace(":", "_")+file.getPimg().getOriginalFilename();
		String filename2 = file.getPimg2().getOriginalFilename();
		String filename3 = file.getPimg3().getOriginalFilename();
		String filepath = req.getSession().getServletContext().getRealPath("/upload");
		filepath = filepath +"/"+filename;
		File fi = new File(filepath);
		file.getPimg().transferTo(fi);
		AdminProductDTO dto = new AdminProductDTO();
		dto.setPidx("0");
		dto.setBcode(all.get("bcode"));
		dto.setScode(all.get("scode"));
		dto.setPcode(all.get("pcode"));
		dto.setPname(all.get("pname"));
		dto.setPsub(all.get("psub"));
		dto.setPrice(all.get("price"));
		dto.setDc(all.get("dc"));
		dto.setDcprice(all.get("dcprice"));
		dto.setPct(all.get("pct"));
		dto.setMarket(all.get("market"));
		dto.setNopro(all.get("nopro"));
		dto.setPimg(filename);
		dto.setPimg2(filename2);
		dto.setPimg3(filename3);
		dto.setPmain(all.get("pmain"));
		dto.setPd(today);
		dto.setCode(all.get("bcode")+all.get("scode"));
		adminService.InsertProduct(dto);
		pr.print("<html><body><form id='fpost' name='fpost' method='post' action='admin-product?val=&sear='></form></body></html><script>fpost.submit();</script>");
	}
	
	@RequestMapping("admin-category")
	public String ProductCategory(@RequestParam("sh")String sh,@RequestParam("val")String val,Model m,HttpServletRequest req) {
		String sh2 = "%"+sh+"%";
		List<ProductCategoryDTO> list = null;
		if(val==null||val.equals("1")) {
			list = adminService.getproductcatemenuAll(sh2);}
		else {
			list = adminService.getproductcatecodeAll(sh2);}
		int size = 0;
		if(list==null) {size = 0;}
		else {size = list.size();}
		req.setAttribute("size", size);
		m.addAttribute("catelist",list);
		m.addAttribute("sh",sh);
		m.addAttribute("val",val);
		return "admin/AdminProduct/admin_category";
	}
	
	@RequestMapping("product-cate-write")
	public void ProductCateWrite(@RequestParam Map<String,String> all, HttpServletResponse res)throws Exception {
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = time.format(df);
		ProductCategoryDTO dto = new ProductCategoryDTO();
		dto.setCidx("0");
		dto.setCode(all.get("code"));
		dto.setBcode(all.get("bcode"));
		dto.setBmenu(all.get("bmenu"));
		dto.setCk(all.get("ck"));
		dto.setScode(all.get("scode"));
		dto.setSmenu(all.get("smenu"));
		dto.setCenum(all.get("a"));
		dto.setJtime(today);
		adminService.InsertCate(dto);
		pr = res.getWriter();
		pr.print("<script>location.href='admin-category?sh=&val=';</script>");
	}
	

	@RequestMapping(value="procuct-list-delete")
	@ResponseBody
	public String ProdcutListDelete(@RequestParam("delist") String ck) {
		String re= "";
		if(ck!=null) {
			String ckpa[] = ck.split(",");
			int w = 1;
			int n = 0 ;
			while(w<ckpa.length) {
				adminService.AdminProductDelete(ckpa[w]);
				w++;
			}
			re="ok";
		}
		return re;
	}
	
	@RequestMapping(value="cate-list-delete")
	@ResponseBody
	public String CateListDelete(@RequestParam("delist") String ck) {
		String re= "";
		if(ck!=null) {
			String ckpa[] = ck.split(",");
			int w = 1;
			int n = 0 ;
			while(w<ckpa.length) {
				adminService.CateListDelete(ckpa[w]);
				adminService.ProductCodeDelete(ckpa[w]);
				w++;
			}
			re="ok";
		}
		return re;
	}
	
	

	
	
	
	
	
	
}
