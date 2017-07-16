package com.shell.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shell.common.HeaderReportDto;
import com.shell.model.Member;
import com.shell.model.Product;
import com.shell.report.JasperReportsView;
import com.shell.service.MaskService;

/**
 *
 * 日期:2017年1月3日
 *
 * @author Shell
 *
 * Copyright © 2016 Shell. All rights reserved
 */
@Controller
@RequestMapping("/report")
public class ReportAction {
	
	@Autowired
	private MaskService dtoService;
	                              
	private static Member member;
	
	private String id;
	private Product product;
	
	private static String PAGE = "report/print.jsp";
	private static String DESC = "第一張列印報表";
	private static String ID = "first";
	private static String FILE_NAME = "first.jrxml";
	
	@RequestMapping(value = "/init",method = RequestMethod.POST)
//	public String show(ModelMap model) {
	public ModelAndView init(HttpServletRequest req, HttpServletResponse res) {
		
//		String id = req.getParameter("id");
		
		List<Product> productList = dtoService.findAll();
		ModelAndView model = new ModelAndView(PAGE);
		model.addObject("productList", productList);
		model.addObject("member", member);
		return model;	
	}	
	
	@RequestMapping(value = "/exportPdf", method = RequestMethod.POST)
    public ModelAndView exportPdf(HttpServletRequest request) throws Exception {
		try{ 
			Map<String, Object> map = initMap(request);
			
			List<Product> dtoList = initReturnList(map);
       
			      
			List<Product> resultList = new ArrayList<Product>();
			Product result = new Product();
			result.setDtoList(dtoList);
	    	resultList.add(result);
         
			//主報表路徑名稱
	    	String templateFile = File.separator+FILE_NAME;
	         	
			Map<String, Object> reportParams = new HashMap<String, Object>();
			//header共用參數
			HeaderReportDto dto = new HeaderReportDto();
			dto.setCenterName("測試");
			dto.setProgramId(ID);
			dto.setReportName("描述");
			dto.setPrinter("列印者");
			reportParams.put("HEADER_PARAMETER", dto);
			//header自訂參數(查詢條件string)
	        List<String> hString = new ArrayList<String>();
	        if(StringUtils.isNotBlank((String) map.get("priceStr"))) {
	        	hString.add("價格：" + (String) map.get("priceStr") + "~" + (String) map.get("priceEnd"));
	        }
            
	        reportParams.put("HEADER_FIELDS", hString);
	        // 設定footer報表data
	        List<String> fString = new ArrayList<String>();
	        fString.add("表尾");
	        reportParams.put("FOOTER_PARAMETER", fString);
			// 設定共用報表-結束  
                   
			Map<String,Object> beans = new HashMap<String,Object>();
			beans.put("reportParams", reportParams);
			beans.put("reportDataSource", resultList);
  
			//1:直向報表2:橫向報表
			return new ModelAndView(new JasperReportsView(templateFile, 1, DESC),beans);
      
		}catch(Exception e){
			throw e;
		}
	}
	                                              
    public Map<String, Object> initMap(HttpServletRequest request) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("priceStr", request.getParameter("priceStr"));
		map.put("priceEnd", request.getParameter("priceEnd"));

		return map;
	}
    
    public List<Product> initReturnList(Map<String, Object> map) throws Exception {
		
		List<Product> drrsList = dtoService.getPDFByCriteria(map);
		
		return drrsList;
	}
    
	public String validateNull(Object obj) throws Exception {
		return StringUtils.isBlank((String) obj) ? "" : (String) obj;
	}
	
	public void writerCSV(List<List<Object>> list, HttpServletResponse response) throws IOException {
		StringBuffer str = new StringBuffer();
		
		for(List<Object> rows : list) {
			for(Object row : rows) {
				str.append(row).append(",");
			}
			str.append("\n");
		}
		
		response.getOutputStream().write((str.toString()).getBytes("BIG5"));
	}    
	
}
