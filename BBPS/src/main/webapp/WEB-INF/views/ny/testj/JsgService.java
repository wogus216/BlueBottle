package com.gd.test.web.testj.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.testj.dao.JsgIDao;


@Service
public class JsgService implements JsgIService {
	@Autowired
	public JsgIDao jsgIDao;
	
	@Override
	public int getSCnt(HashMap<String, String> params) throws Throwable {
		return jsgIDao.getSCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSList(HashMap<String, String> params) throws Throwable {
		return jsgIDao.getSList(params);
	}

	@Override
	public int addS(HashMap<String, String> params) throws Throwable {
		return jsgIDao.addS(params);
	}

	@Override
	public HashMap<String, String> getS(HashMap<String, String> params) throws Throwable {
		return jsgIDao.getS(params);
	}

	@Override
	public int updateS(HashMap<String, String> params) throws Throwable {
		return jsgIDao.updateS(params);
	}

	@Override
	public int deleteS(HashMap<String, String> params) throws Throwable {
		return jsgIDao.deleteS(params);
	}

}
