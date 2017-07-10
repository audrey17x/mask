package com.shell.dao;

import java.util.List;

import com.shell.model.Product;


/**
 *
 * 日期:2016年12月31日
 *
 * @author Shell
 *
 * Copyright © 2016 Shell. All rights reserved
 */
public interface MaskDao {
	public List<Product> findAll();
	
	public Product findByPK(String pk);
	
	public Product save(Product model);
	
}

