package com.gdj35.bbps.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.INyDao;

@Service
public class nyService implements INyService{

	@Autowired
	public INyDao iNyDao;
}
