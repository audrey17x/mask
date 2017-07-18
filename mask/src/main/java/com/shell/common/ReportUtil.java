package com.shell.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.shell.constant.Constant;
import com.shell.report.JasperReportsView;

public class ReportUtil {

	public static ModelAndView exportPdf(String FILE_NAME, String DESCRIPTION, String ID, String REOPRT_NAME, List<?> dtoList, List<String> hString, int orientation) throws Exception {
		//主報表路徑名稱
    	String templateFile = File.separator+FILE_NAME;
         	
		Map<String, Object> reportParams = new HashMap<String, Object>();
		//header共用參數
		HeaderReportDto dto = new HeaderReportDto();
		//網站名稱
		dto.setWebName(Constant.WEB_NAME);
		//程式代號
		dto.setProgramId(ID);
		//報表的名稱
		dto.setReportName(REOPRT_NAME);
		//列印者
		dto.setPrinter(Constant.PRINTER);
		reportParams.put("HEADER_PARAMETER", dto);
        reportParams.put("HEADER_FIELDS", hString);
        // 設定footer報表data
        List<String> fString = new ArrayList<String>();
        //輸入報表的表尾
        fString.add(Constant.FOOT_STRING);
        reportParams.put("FOOTER_PARAMETER", fString);
		// 設定共用報表-結束  
               
		Map<String,Object> beans = new HashMap<String,Object>();
		beans.put("reportParams", reportParams);
		beans.put("reportDataSource", dtoList);
		
		return new ModelAndView(new JasperReportsView(templateFile, orientation, DESCRIPTION),beans);
	}
}
