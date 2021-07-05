package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.sbDao;

@Service
public class sbService implements IsbService{

	@Autowired
	public sbDao sbdao;
	
	@Override
	public List<HashMap<String, String>> getproductlist() throws Throwable {
		return sbdao.getproductlist();
	}

	

}
