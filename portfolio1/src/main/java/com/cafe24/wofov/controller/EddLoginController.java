package com.cafe24.wofov.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

import com.cafe24.wofov.domain.EddMemberDTO;
import com.cafe24.wofov.domain.ProductListDTO;
import com.cafe24.wofov.service.EddService;

@Controller
public class EddLoginController {
	HttpSession session = null;
	@Autowired
	private EddService eddService;
	
	@RequestMapping(value="edd-idck",method=RequestMethod.POST)
	@ResponseBody
	public String AdminIdCk(Model m,HttpServletRequest req,HttpServletResponse res,@RequestParam("cid") String cid) throws Exception{
		res.setContentType("text/html; charset=utf-8");
		String re="";
		EddMemberDTO eddck = eddService.Eddcid(cid);
		if(eddck==null) {re="ok";}
		else {re="no";}
		return re;
	}
	
	@RequestMapping(value="join",method=RequestMethod.POST)
	public String join(HttpServletRequest req,HttpServletResponse res,@RequestParam Map<String,String> all)throws Exception {
		LocalDateTime time = LocalDateTime.now();
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = time.format(df);
		
		EddMemberDTO eddlogin = eddService.EddLogin(all.get("cid"));
		if(eddlogin==null) {
		
		EddMemberDTO dto = new EddMemberDTO();
		dto.setCidx("0");
		dto.setCid(all.get("cid"));
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(all.get("cpw"));
		dto.setCpw(securePassword);
		dto.setCname(all.get("cname"));
		String em = all.get("cem1")+"@" +all.get("cem2");
		dto.setCemail(em);
		dto.setCtel(all.get("ctel1")+all.get("ctel2")+all.get("ctel3"));
		dto.setCpost(all.get("cpost"));
		dto.setCaddr(all.get("addr2")+" "+all.get("addr3"));
		dto.setCaddr2(all.get("addr3"));
		dto.setCpoint("0");
		dto.setCtime(today);
		dto.setCouttime("0001-01-01 01:00:00");
		dto.setEmck("N");
		eddService.EddMemberInsert(dto);

		
		String host = "smtp.naver.com";
		final String admin = "hys950526@naver.com";
		final String pw = "2020010063ys@@";
		
		Properties pr = new Properties();
		pr.put("mail.smtp.host", host);
		pr.put("mail.smtp.port", 587);
		pr.put("mail.smtp.auth", true);//메일 전송에 따른 연결 인증 절차 
		pr.put("mail.smtp.debug", false);//전송 오류시 표시하는것 안써도 되긴함.
		pr.put("mail.smtp.socketFactory.port", 587);//자신의 PC 포트를 오픈
		pr.put("mail.smtp.ssl.protocols","TLSv1.2");//TSL 규격
		Session session = Session.getDefaultInstance(pr,new Authenticator(){
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(admin,pw);
			}
		});
		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(admin,"EDD 관리자"));//송신자 정보
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(em));//받는사람
			msg.setSubject("EDD 가입을 환영합니다.");//수신제목
			String img = ""
					+ "<a href = 'http://wofov.cafe24.com/portfolio1/edd-loginview2?cid="+all.get("cid")+"'>"
					+ "가입을 환영합니다! 클릭하여 로그인해주세요!"
					+ "</a>";
			msg.setContent(img,"text/html; charset=utf-8");
			Transport.send(msg);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		}//건드리지마
		
		return "EddLogin/member_login";
	}
	
	@RequestMapping(value="edd-loginview2",method = RequestMethod.GET)
	public String EddLoginView2(HttpServletRequest req) {
		String cid = req.getParameter("cid");
		eddService.EmailCk(cid);
		return "EddLogin/member_login";
	}
	
	@RequestMapping(value="edd-login",method=RequestMethod.POST)
	@ResponseBody
	public String EddLogin(@RequestParam("cid") String cid,@RequestParam("pw") String pw
			,HttpServletRequest req,HttpServletResponse res, Model m) {
		String msg = "";
		EddMemberDTO eddlogin = eddService.EddLogin(cid);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(eddlogin!=null) {
			encoder.matches(pw,eddlogin.getCpw());
			if(encoder.matches(pw,eddlogin.getCpw())==true && eddlogin.getEmck().equals("Y")) {//여기 수정
				msg="ok";
				session = req.getSession();
				session.setAttribute("cid", cid);
				session.setAttribute("cnm", eddlogin.getCname());
				m.addAttribute("cnm",eddlogin.getCname());
			}
			else if(encoder.matches(pw,eddlogin.getCpw())==true && eddlogin.getEmck().equals("N")){msg="notyet";}
			else {msg="no";}
		}
	
		List<ProductListDTO> list = eddService.ProductListView();
		m.addAttribute("productlist",list);
		return msg;
	}
	@RequestMapping("logout")
	public String AdminLogout(HttpServletRequest req,Model m) {
		session = req.getSession();
		session.invalidate();
		List<ProductListDTO> list = eddService.ProductListView();
		int size=0;
		if(list==null) {size = 0;}
		else {size = list.size();}
		req.setAttribute("size", size);
		m.addAttribute("productlist",list);
		return "index";
	}
	
}
