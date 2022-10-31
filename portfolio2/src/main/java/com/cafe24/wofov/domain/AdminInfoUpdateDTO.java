package com.cafe24.wofov.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminInfoUpdateDTO {
	private String jid;
	private String jpw;
	private String jname;
	private String jemail;
	private String jtel;
	private String jm1;
	private String jm2;
	

}
