package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.IshDao;

@Service
public class shService implements IshService{
	@Autowired
	public IshDao ishDao;

	@Override
	public int getOCnt(HashMap<String, String> params) throws Throwable {
		return ishDao.getOCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getOList(HashMap<String, String> params) throws Throwable {
		return ishDao.getOList(params);
	}

	@Override
	public List<HashMap<String, String>> getO(HashMap<String, String> params) throws Throwable {
		return ishDao.getO(params);
	}
}
