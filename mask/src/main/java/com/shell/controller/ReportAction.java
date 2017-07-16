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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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
	
	private static String PAGE = "report/print.jsp";
	private static String DESC = "第一張列印報表";
	private static String ID = "first";
	private static String FILE_NAME = "first.jrxml";
	
	private static String DESC_OF_TABLE = "第一張列印報表表格元素版";
	private static String ID_OF_TABLE = "firstOfTableElement";
	private static String FILE_NAME_OF_TABLE = "firstOfTableElement.jrxml";
	       
	@RequestMapping(value = "/init",method = RequestMethod.POST)
	public ModelAndView init(HttpServletRequest req, HttpServletResponse res) {
		
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
			           
			for(Product dto : dtoList) {
				String salesPercentage = "0%";
				BigDecimal sales = dto.getSales();
				BigDecimal stock = dto.getStock();
				//兩者乘除皆不得為零
		        if(dto.getSales().compareTo(BigDecimal.ZERO) > 0 && dto.getStock().compareTo(BigDecimal.ZERO) > 0) {
		        	//計算 銷售百分比 ，最後加上 %
		        	salesPercentage = sales.divide(stock, 4, BigDecimal.ROUND_HALF_UP).multiply(new BigDecimal(100)).setScale(2,BigDecimal.ROUND_HALF_UP).toString().concat("%");
		        }
				dto.setSalesPercentage(salesPercentage);
			}
			      
			//主報表路徑名稱
	    	String templateFile = File.separator+FILE_NAME;
	         	
			Map<String, Object> reportParams = new HashMap<String, Object>();
			//header共用參數
			HeaderReportDto dto = new HeaderReportDto();
			//網站名稱
			dto.setCenterName("卸下你的。真面目");
			//程式代號
			dto.setProgramId(ID);
			//報表的名稱
			dto.setReportName("商品銷售報表");
			//列印者
			dto.setPrinter("shell");
			reportParams.put("HEADER_PARAMETER", dto);
			//header自訂參數(查詢條件string)
	        List<String> hString = new ArrayList<String>();
	        if(!StringUtils.isEmpty((String) map.get("priceStr"))) {
	        	hString.add("價格：" + (String) map.get("priceStr") + "~" + (String) map.get("priceEnd"));
	        }
            
	        reportParams.put("HEADER_FIELDS", hString);
	        // 設定footer報表data
	        List<String> fString = new ArrayList<String>();
	        //輸入報表的表尾
	        fString.add("感謝您");
	        reportParams.put("FOOTER_PARAMETER", fString);
			// 設定共用報表-結束  
                   
			Map<String,Object> beans = new HashMap<String,Object>();
			beans.put("reportParams", reportParams);
			beans.put("reportDataSource", dtoList);
  
			//1:直向報表2:橫向報表
			return new ModelAndView(new JasperReportsView(templateFile, 1, DESC),beans);
      
		}catch(Exception e){
			throw e;
		}
	}
	
	@RequestMapping(value = "/exportPdfOfTableElement", method = RequestMethod.POST)
    public ModelAndView exportPdfOfTableElement(HttpServletRequest request) throws Exception {
		try{ 
			
			Map<String, Object> map = initMap(request);
			
			List<Product> dtoList = initReturnList(map);
			      
			List<Product> resultList = new ArrayList<Product>();
			Product result = new Product();
			result.setDtoList(dtoList);
	    	resultList.add(result);
         
			//主報表路徑名稱
	    	String templateFile = File.separator+FILE_NAME_OF_TABLE;
	         	
			Map<String, Object> reportParams = new HashMap<String, Object>();
			//header共用參數
			HeaderReportDto dto = new HeaderReportDto();
			//網站名稱
			dto.setCenterName("卸下你的。真面目");
			//程式代號
			dto.setProgramId(ID_OF_TABLE);
			//報表的名稱
			dto.setReportName("商品銷售報表");
			//列印者
			dto.setPrinter("shell");
			reportParams.put("HEADER_PARAMETER", dto);
			//header自訂參數(查詢條件string)
	        List<String> hString = new ArrayList<String>();
	        if(!StringUtils.isEmpty((String) map.get("priceStr"))) {
	        	hString.add("價格：" + (String) map.get("priceStr") + "~" + (String) map.get("priceEnd"));
	        }
            
	        reportParams.put("HEADER_FIELDS", hString);
	        // 設定footer報表data
	        List<String> fString = new ArrayList<String>();
	        fString.add("感謝您");
	        reportParams.put("FOOTER_PARAMETER", fString);
			// 設定共用報表-結束  
                   
			Map<String,Object> beans = new HashMap<String,Object>();
			beans.put("reportParams", reportParams);
			beans.put("reportDataSource", resultList);
  
			//1:直向報表2:橫向報表
			return new ModelAndView(new JasperReportsView(templateFile, 1, DESC_OF_TABLE),beans);
      
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
		return StringUtils.isEmpty((String) obj) ? "" : (String) obj;
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
