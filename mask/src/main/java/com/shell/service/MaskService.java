package com.shell.service;

import java.util.List;
import java.util.Map;

import com.shell.model.Product;



/**
 *
 * 日期:2016年12月31日
 *
 * @author Shell
 *
 * Copyright © 2016 Shell. All rights reserved
 */
public interface MaskService {
	public List<Product> findAll();
	
	public Product findByPK(String pk);
	
	public List<Product> getPDFByCriteria(Map<String, Object> map) throws Exception;
}
