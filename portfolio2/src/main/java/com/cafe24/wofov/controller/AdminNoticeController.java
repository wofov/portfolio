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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.wofov.domain.Admin_NoticeCountDTO;
import com.cafe24.wofov.domain.Admin_NoticeDTO;
import com.cafe24.wofov.domain.Admin_Notice_FileDTO;
import com.cafe24.wofov.service.AdminService;

@Controller
public class AdminNoticeController {
	PrintWriter pr = null;
	
	LocalDateTime time = LocalDateTime.now();
	DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String today = time.format(df);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="admin-notice",method=RequestMethod.GET)
	public String AdminNotice(Model m,HttpServletRequest req,HttpServletResponse res) {
		String pgno = req.getParameter("page");
		
		List<Admin_NoticeDTO> dataon = adminService.getAd_Notice_All1();
		Admin_NoticeCountDTO ct = adminService.getct();
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
	
		List<Admin_NoticeDTO> data4 = adminService.getAd_Notice_All3(stpg ,pageview);
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
		
		return "admin/AdminNotice/admin_notice";
	}
	
	@RequestMapping(value="admin-notice-delete")
	@ResponseBody
	public String AdminNoticeDelete(@RequestParam("ckpa") String ck) {
		String re= "";
		if(ck!=null) {
			String ckpa[] = ck.split(",");
			int w = 1;
			int n = 0 ;
			while(w<ckpa.length) {
				adminService.AdminNoticeDelete(ckpa[w]);
				w++;
			}
			re="ok";
		}
		return re;
	}
	@RequestMapping(value="admin-notice-insert",method=RequestMethod.POST)
	public void AdminNoticeInsert(Admin_Notice_FileDTO noticefile,@RequestParam Map<String,String> all,
			HttpServletRequest req,HttpServletResponse res)throws Exception {
		pr = res.getWriter();
		String up = all.get("up").intern();
		String idx = "";
		if(up=="ok") {idx=all.get("idx");}
		else {idx="0";}
		String filename="";
		if(noticefile.getFile().isEmpty()) {filename = "";}
		else {
			filename = today.replace(":", "_")+noticefile.getFile().getOriginalFilename();
			String filepath = req.getSession().getServletContext().getRealPath("/upload");
			filepath = filepath+"/"+today.replace(":", "_")+filename;
			File file = new File(filepath);
			noticefile.getFile().transferTo(file);}
		Admin_NoticeDTO dto = new Admin_NoticeDTO();
		dto.setNidx(idx);
		dto.setNyn(all.get("ck"));
		dto.setNsub(all.get("sub"));
		dto.setNwr(all.get("wr"));
		dto.setNfile(filename);
		dto.setNmain(all.get("pm1"));
		dto.setNtime(today);
		if(up=="ok") {
			if(filename.intern()=="") {
				adminService.UpdateNoticeFileNo(dto);}
			else {
				adminService.UpdateNoticeFileOk(dto);}
		}
		else {
			adminService.AdminNoticeInsert(dto);}
		pr.print("<script>location.href='admin-notice';</script>");
	}
	@RequestMapping(value="admin-notice-view")
	public String AdminNoticeView(@RequestParam("idx")String nidx,@RequestParam("idx2")String idx2
			,Model m,HttpServletRequest req) {
		List<Admin_NoticeDTO> list = adminService.getviewidx(nidx);
		m.addAttribute("noticeview",list);
		req.setAttribute("a0", idx2);

		return "admin/AdminNotice/admin_notice_view";
	}
	
}
