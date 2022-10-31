package com.cafe24.wofov;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.text.SimpleDateFormat;

import com.cafe24.wofov.service.EddService;
import com.inicis.std.util.SignatureUtil;
import java.util.*;
@Controller
public class HomeController {
	@Autowired
	private EddService eddService;
	
	@RequestMapping(value="edd-loginview",method = RequestMethod.GET)
	public String EddLoginView() {
		return "EddLogin/member_login";
	}
	@RequestMapping(value="company",method = RequestMethod.GET)
	public String Company() {
		return "EddInfo/company";
	}
	@RequestMapping(value="agreement",method = RequestMethod.GET)
	public String Agreement() {
		return "EddInfo/agreement";
	}
	@RequestMapping(value="privacy",method = RequestMethod.GET)
	public String Privacy() {
		return "EddInfo/privacy";
	}
	@RequestMapping(value="guide",method = RequestMethod.GET)
	public String Guide() {
		return "EddInfo/guide";
	}
	@RequestMapping(value="edd-memberjoin",method = RequestMethod.GET)
	public String EddMemberJoin() {
		return "EddLogin/member";
	}
	
}
