package com.cafe24.wofov.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Admin_NoticeDTO {
	private String nidx;  
	private String nyn;  
	private String nsub; 
	private String nwr;  
	private String nfile; 
	private String nmain;
	private String ntime;
}

