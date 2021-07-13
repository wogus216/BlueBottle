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
	public List<HashMap<String, String>> getODtlList(HashMap<String, String> params) throws Throwable {
		return ishDao.getODtlList(params);
	}

	@Override
	public HashMap<String, String> getODtl(HashMap<String, String> params) throws Throwable {
		return ishDao.getODtl(params);
	}

	@Override
	public List<HashMap<String, String>> getRDtlList(HashMap<String, String> params) throws Throwable {
		return ishDao.getRDtlList(params);
	}

	@Override
	public HashMap<String, String> getRDtl(HashMap<String, String> params) throws Throwable {
		return ishDao.getRDtl(params);
	}

	@Override
	public List<HashMap<String, String>> getOWholeList(HashMap<String, String> params) throws Throwable {
		return ishDao.getOWholeList(params);
	}

	@Override
	public int apvOrd(HashMap<String, String> params) throws Throwable {
		return ishDao.apvOrd(params);
	}

	@Override
	public int nonApvOrd(HashMap<String, String> params) throws Throwable {
		return ishDao.nonApvOrd(params);
	}

	@Override
	public int apvRef(HashMap<String, String> params) throws Throwable {
		return ishDao.apvRef(params);
	}

	@Override
	public int nonApvRef(HashMap<String, String> params) throws Throwable {
		return ishDao.nonApvRef(params);
	}

	@Override
	public int sendO(HashMap<String, Object> insertMap) throws Throwable {
		return ishDao.sendO(insertMap);
	}

	@Override
	public int sendExp(HashMap<String, Object> insertMap) throws Throwable {
		return ishDao.sendExp(insertMap);
	}
}
