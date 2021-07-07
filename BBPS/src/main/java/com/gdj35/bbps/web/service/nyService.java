package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.InyDao;

@Service
public class nyService implements InyService{

	@Autowired
	public InyDao iNyDao;

	@Override
	public List<HashMap<String, String>> getCateList() throws Throwable {

		return iNyDao.getCateList();
	}

	@Override
	public int addCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.addCate(params);
	}

	@Override
	public int updateCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.updateCate(params);
	}


}
