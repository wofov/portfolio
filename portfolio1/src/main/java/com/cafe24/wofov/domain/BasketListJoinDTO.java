package com.cafe24.wofov.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BasketListJoinDTO {
	private String pimg;
	private String pname;
	private String psub;
	private String bcode;
	private String ct;
	private String price;
	private String dc;
	private String dcprice;
	private String pidx;
}
