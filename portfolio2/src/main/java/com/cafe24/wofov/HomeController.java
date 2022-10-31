package com.cafe24.wofov;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping("admin")
	public String home() {
		return "admin/index";
	}
	@RequestMapping("adminjoin-info")
	public String AdminJoin_Info() {
		return "admin/AdminLogin/add_master";
	}
	@RequestMapping("admin-notice-write")
	public String AdminNoticeWrite() {
		return "admin/AdminNotice/admin_notice_write";
	}
	@RequestMapping("admin-category-write")
	public String ProductCategoryWrite() {
		return "admin/AdminProduct/admin_category_write";
	}
	@RequestMapping("admin-coupon-write")
	public String ShoppingCouponWrite() {
		return "admin/AdminShoppingCoupon/admin_coupon_config";
	}
	@RequestMapping(value="admin-infoupdate")
	public String AdminInfoUpdate() {
		return "admin/AdminLogin/admin_info";
	}
}
