package com.cafe24.wofov.domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ShoppingManageDTO {
	private String idx;
	private String cpname;
	private String cpw;
	private String stda;
	private String endda;
	private String nump;
	private String mp;
	private String file;
	private String time;
}
