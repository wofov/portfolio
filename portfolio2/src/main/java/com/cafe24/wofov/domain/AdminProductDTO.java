package com.cafe24.wofov.domain;



import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminProductDTO {
	private String pidx;
	private String bcode;
	private String scode;
	private String pcode;
	private String pname;
	private String psub;
	private String price;
	private String dc;
	private String dcprice;
	private String pct;
	private String market;
	private String nopro;
	private String pimg;
	private String pimg2;
	private String pimg3;
	private String pmain;
	private String pd;
	private String code;
}
