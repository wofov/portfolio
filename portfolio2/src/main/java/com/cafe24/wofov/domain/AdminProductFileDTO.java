package com.cafe24.wofov.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminProductFileDTO {
	private MultipartFile pimg;
	private MultipartFile pimg2;
	private MultipartFile pimg3;

}
