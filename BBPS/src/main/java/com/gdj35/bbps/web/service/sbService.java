package com.gdj35.bbps.web.service;

import java.util.ArrayList;
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

	@Override
	public List<HashMap<String, String>> getPHList(HashMap<String, String> params) throws Throwable {
		return isbdao.getPHList(params);
	}

	@Override
	public int AddItem(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.AddItem(insertMap);
	}

	@Override
	public int AddItemPrice(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.AddItemPrice(insertMap);
	}

	@Override
	public int EditItem(HashMap<String, String> params) throws Throwable {
		return isbdao.EditItem(params);
	}

	@Override
	public int EditItemPrice(HashMap<String, String> params) throws Throwable {
		return isbdao.EditItemPrice(params);
	}

	@Override
	public int DelItem(HashMap<String, String> params) throws Throwable {
		return isbdao.DelItem(params);
	}

	

}
