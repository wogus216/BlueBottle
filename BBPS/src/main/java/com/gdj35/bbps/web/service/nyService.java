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
	public List<HashMap<String, String>> getNoticeCate() throws Throwable {

		return iNyDao.getNoticeCate();
	}

	@Override
	public int addNoticeCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.addNoticeCate(params);
	}

	@Override
	public int updateNoticeCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.updateNoticeCate(params);
	}

	@Override
	public int deleteNoticeCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.deleteNoticeCate(params);
	}


}
