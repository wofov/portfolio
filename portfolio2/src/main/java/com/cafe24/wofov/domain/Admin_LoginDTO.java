package com.cafe24.wofov.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Admin_LoginDTO {
	private Integer jidx;
	private String jid;
	private String jpw;
	private String jname;
	private String jemail;
	private String jtel;
	private String jm1;
	private String jm2;
	private String jtime;
	private String jenum;
}
