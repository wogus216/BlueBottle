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
	public int sendO(HashMap<String, String> params) throws Throwable {
		return ishDao.sendO(params);
	}

	@Override
	public int sendExp(HashMap<String, Object> insertMap) throws Throwable {
		return ishDao.sendExp(insertMap);
	}

	@Override
	public int getBOCnt(HashMap<String, String> params) throws Throwable {
		return ishDao.getBOCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBOList(HashMap<String, String> params) throws Throwable {
		return ishDao.getBOList(params);
	}

	@Override
	public HashMap<String, String> getBODtl(HashMap<String, String> params) throws Throwable {
		return ishDao.getBODtl(params);
	}

	@Override
	public List<HashMap<String, String>> getBODtlList(HashMap<String, String> params) throws Throwable {
		return ishDao.getBODtlList(params);
	}

	@Override
	public HashMap<String, String> getBRDtl(HashMap<String, String> params) throws Throwable {
		return ishDao.getBRDtl(params);
	}

	@Override
	public List<HashMap<String, String>> getBRDtlList(HashMap<String, String> params) throws Throwable {
		return ishDao.getBRDtlList(params);
	}

	@Override
	public int cnlO(HashMap<String, String> params) throws Throwable {
		return ishDao.cnlO(params);
	}

	@Override
	public int cnlRef(HashMap<String, String> params) throws Throwable {
		return ishDao.cnlRef(params);
	}

	@Override
	public List<HashMap<String, String>> getRefItem(HashMap<String, String> params) throws Throwable {
		return ishDao.getRefItem(params);
	}

	@Override
	public List<HashMap<String, String>> getOrdItem(HashMap<String, String> params) throws Throwable {
		return ishDao.getOrdItem(params);
	}

	@Override
	public int writeRefItem(HashMap<String, Object> insertMap) throws Throwable {
		return ishDao.writeRefItem(insertMap);
	}

	@Override
	public int writeRef(HashMap<String, String> params) throws Throwable {
		return ishDao.writeRef(params);
	}

	@Override
	public int writeOrd(HashMap<String, String> params) throws Throwable {
		return ishDao.writeOrd(params);
	}

	@Override
	public int writeOrdItem(HashMap<String, Object> insertMap) throws Throwable {
		return ishDao.writeOrdItem(insertMap);
	}

	@Override
	public HashMap<String, String> getLastONo() throws Throwable {
		return ishDao.getLastONo();
	}

	@Override
	public List<HashMap<String, String>> getBrchList() throws Throwable {
		return ishDao.getBrchList();
	}

	@Override
	public List<HashMap<String, String>> getCateList() throws Throwable {
		return ishDao.getCateList();
	}

	@Override
	public int getAuth(HashMap<String, String> params) throws Throwable {
		return ishDao.getAuth(params);
	}
}
