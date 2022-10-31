package com.cafe24.wofov.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductCategoryDTO {
	private String cidx;
	private String code;
	private String bcode;
	private String bmenu;
	private String ck;
	private String scode;
	private String smenu;
	private String cenum;
	private String jtime;
}
