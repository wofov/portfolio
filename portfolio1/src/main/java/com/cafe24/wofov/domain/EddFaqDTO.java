package com.cafe24.wofov.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EddFaqDTO {
	private String fsel;
	private String fsub;
	private String fmain;
}
