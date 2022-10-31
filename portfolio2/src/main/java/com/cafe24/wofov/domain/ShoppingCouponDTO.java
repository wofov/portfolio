package com.cafe24.wofov.domain;

import javax.swing.plaf.multi.MultiMenuItemUI;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ShoppingCouponDTO {
	private String idx;
	private String cpname;
	private String cpw;
	private String stda;
	private String endda;
	private String cpsel;
	private String nump;
	private String mp;
	private String file;
	private String time;
}
