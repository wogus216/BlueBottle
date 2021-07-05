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
	public int getSCnt(HashMap<String, String> params) throws Throwable {
		return isgDao.getSCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSList(HashMap<String, String> params) throws Throwable {
		return isgDao.getSList(params);
	}

}
