package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.IsbDao;

@Service
public class sbService implements IsbService{

	@Autowired
	public IsbDao isbdao;
	
	@Override
	public int getPCnt(HashMap<String, String> params) throws Throwable {
		return isbdao.getPCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getPList(HashMap<String, String> params) throws Throwable {
		return isbdao.getPList(params);
	}

	@Override
	public HashMap<String, String> getPDetail(HashMap<String, String> params) throws Throwable {
		return isbdao.getPDetail(params);
	}

	

}
