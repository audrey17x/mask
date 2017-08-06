package com.shell.dao;

import java.util.List;
import java.util.Map;

import com.shell.model.Product;


/**
 * 
 * 日期:2017年8月6日
 * 
 * @author Shell
 *
 * Copyright © 2017 Shell. All rights reserved
 */
public interface MaskDao {
	public List<Product> findAll();
	
	public Product findByPK(String pk);
	
	public Product save(Product model);
	
	public List<Product> getPDFByCriteria(Map<String, Object> map) throws Exception;
	
}

