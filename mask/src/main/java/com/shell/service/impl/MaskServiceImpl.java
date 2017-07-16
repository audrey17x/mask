package com.shell.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.shell.dao.MaskDao;
import com.shell.model.Product;
import com.shell.service.MaskService;


/**
 *
 * 日期:2016年12月31日
 *
 * @author Shell
 *
 * Copyright © 2016 Shell. All rights reserved
 */
public class MaskServiceImpl implements MaskService{
	
	@Autowired
	private MaskDao maskDao;
	
	public List<Product> findAll() {
		return maskDao.findAll();
	}
	
	public Product findByPK(String pk) {
		return maskDao.findByPK(pk);
	}
	
	public List<Product> getPDFByCriteria(Map<String, Object> map) throws Exception {
		return maskDao.getPDFByCriteria(map);
	}


}
