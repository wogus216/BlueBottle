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

	@Override
	public int updateN(HashMap<String, String> params) throws Throwable {
		return isgDao.updateN(params);
	}

	@Override
	public int deleteN(HashMap<String, String> params) throws Throwable {
		return isgDao.deleteN(params);
	}
	
	
	
	@Override
	public int getUCnt(HashMap<String, String> params) throws Throwable {
		return isgDao.getUCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getUList(HashMap<String, String> params) throws Throwable {
		return isgDao.getUList(params);
	}

	@Override
	public int addU(HashMap<String, String> params) throws Throwable {
		return isgDao.addU(params);
	}

	@Override
	public int addB(HashMap<String, String> params) throws Throwable {
		return isgDao.addB(params);
	}

	@Override
	public HashMap<String, String> getH(HashMap<String, String> params) throws Throwable {
		return isgDao.getH(params);
	}
	
	

}
