
package com.shell.common;

import lombok.Data;

public @Data class HeaderReportDto {
	//程式代號
	private String programId;
	
	//列印者
	private String printer;
	
	//中心單位別
	private String centerName;
	
	//報表名稱
	private String reportName;
}
