package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.IjhDao;

@Service
public class jhService implements IjhService {

	@Autowired
	public IjhDao ijhDao;
	
	@Override
	public HashMap<String, String> getHQ(HashMap<String, String> params) throws Throwable {
		return ijhDao.getHQ(params);
	}

	@Override
	public HashMap<String, String> getB(HashMap<String, String> params) throws Throwable {
		return ijhDao.getB(params);
	}

	@Override
	public List<HashMap<String, String>> getHMenu(HashMap<String, String> params) throws Throwable {
		return ijhDao.getHMenu(params);
	}

	@Override
	public int getMbCnt(HashMap<String, String> params) throws Throwable {
		return ijhDao.getMbCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getMbList(HashMap<String, String> params) throws Throwable {
		return ijhDao.getMbList(params);
	}

}