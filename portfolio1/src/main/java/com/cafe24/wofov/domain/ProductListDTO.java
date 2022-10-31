package com.cafe24.wofov.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductListDTO {
	private String pidx;
	private String bcode;
	private String scode;
	private String pcode;
	private String pname;
	private String psub;
	private String price;
	private String dc;
	private String dcprice;
	private Integer pct;
	private String market;
	private String nopro;
	private String pimg;
	private String pimg2;
	private String pimg3;
	private String pmain;
	private String pd;
	private String code;
}
