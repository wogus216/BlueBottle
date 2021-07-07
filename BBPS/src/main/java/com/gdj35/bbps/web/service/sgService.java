package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.IsgDao;

@Service
public class sgService implements IsgService {
	@Autowired
	public IsgDao isgDao;

	@Override
	public int getNCnt(HashMap<String, String> params) throws Throwable {
		return isgDao.getNCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getNList(HashMap<String, String> params) throws Throwable {
		return isgDao.getNList(params);
	}
	
	@Override
	public HashMap<String, String> getN(HashMap<String, String> params) throws Throwable {
		return isgDao.getN(params);
	}

	@Override
	public int addN(HashMap<String, String> params) throws Throwable {
		return isgDao.addN(params);
	}

	

}
