package com.cafe24.wofov.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EddMemberDTO {
	private String cidx;
	private String cid;
	private String cpw;
	private String cname;
	private String cemail;
	private String ctel;
	private String cpost;
	private String caddr;
	private String caddr2;
	private String recom;
	private String cpoint;
	private String ctime;
	private String couttime;
	private String emck; 
}
