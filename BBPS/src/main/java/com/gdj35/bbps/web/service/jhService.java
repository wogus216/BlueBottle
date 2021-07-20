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

	@Override
	public HashMap<String, String> getMd(HashMap<String, String> params) throws Throwable {
		return ijhDao.getMd(params);
	}

	@Override
	public int editM(HashMap<String, String> params) throws Throwable {
		return ijhDao.editM(params);
	}

	@Override
	public int addM(HashMap<String, String> params) throws Throwable {
		return ijhDao.addM(params);
	}

	@Override
	public int delM(HashMap<String, String> params) throws Throwable {
		return ijhDao.delM(params);
	}

	@Override
	public List<HashMap<String, String>> getBMenu(HashMap<String, String> params) throws Throwable {
		return ijhDao.getBMenu(params);
	}

	@Override
	public List<HashMap<String, String>> getPMenu(HashMap<String, String> params) throws Throwable {
		return ijhDao.getPMenu(params);
	}

	@Override
	public HashMap<String, String> getMOrd(HashMap<String, String> params) throws Throwable {
		return ijhDao.getMOrd(params);
	}

	@Override
	public int addOrd(HashMap<String, Object> insertMap) throws Throwable {
		return ijhDao.addOrd(insertMap);
	}

	@Override
	public int addSales(HashMap<String, String> params) throws Throwable {
		return ijhDao.addSales(params);
	}

	@Override
	public HashMap<String, String> getOrdNum() throws Throwable {
		return ijhDao.getOrdNum();
	}

}
