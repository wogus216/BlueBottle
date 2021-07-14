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

	@Override
	public List<HashMap<String, String>> getItemCate() throws Throwable {

		return iNyDao.getItemCate();
	}

	@Override
	public int addItemCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.addItemCate(params);
	}

	@Override
	public int updateItemCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.updateItemCate(params);
	}

	@Override
	public int deleteItemCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.deleteItemCate(params);
	}

	@Override
	public List<HashMap<String, String>> getMenuCate() throws Throwable {

		return iNyDao.getMenuCate();
	}

	@Override
	public int addMenuCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.addMenuCate(params);
	}

	@Override
	public int updateMenuCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.updateMenuCate(params);
	}

	@Override
	public int deleteMenuCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.deleteMenuCate(params);
	}

	@Override
	public List<HashMap<String, String>> getSalesList(HashMap<String, String> params) throws Throwable {
		
		return iNyDao.getSalesLists(params);
	}

	@Override
	public int getSalesCnt(HashMap<String, String> params) throws Throwable {

		return iNyDao.getSalesCnt(params);
	}




}
