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

	@Override
	public List<HashMap<String, String>> getSDetail(HashMap<String, String> params) throws Throwable {
		return isbdao.getSDetail(params);
	}

	@Override
	public List<HashMap<String, String>> getSRelList(HashMap<String, String> params) throws Throwable {
		return isbdao.getSRelList(params);
	}

	@Override
	public List<HashMap<String, String>> getSDList(HashMap<String, String> params) throws Throwable {
		return isbdao.getSDList(params);
	}

	@Override
	public int AddStock(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.AddStock(insertMap);
	}

	@Override
	public int DiscardStock(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.DiscardStock(insertMap);
	}

	@Override
	public List<HashMap<String, String>> getHSHList(HashMap<String, String> params) throws Throwable {
		return isbdao.getHSHList(params);
	}

	@Override
	public List<HashMap<String, String>> getHSDList(HashMap<String, String> params) throws Throwable {
		return isbdao.getHSDList(params);
	}

	@Override
	public int getHSDCnt(HashMap<String, String> params) throws Throwable {
		return isbdao.getHSDCnt(params);
	}

	@Override
	public int getBSLCnt(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSLCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBSList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSList(params);
	}

	@Override
	public List<HashMap<String, String>> getBSEList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSEList(params);
	}

	@Override
	public int EidtBStock(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.EidtBStock(insertMap);
	}

	@Override
	public List<HashMap<String, String>> getBStockExpList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBStockExpList(params);
	}

	@Override
	public List<HashMap<String, String>> getBStockUseList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBStockUseList(params);
	}

	@Override
	public List<HashMap<String, String>> getBStockDiscardList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBStockDiscardList(params);
	}

	@Override
	public List<HashMap<String, String>> getBStockStorList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBStockStorList(params);
	}

	@Override
	public int BDiscardStock(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.BDiscardStock(insertMap);
	}

	@Override
	public int BSSEdit(HashMap<String, String> params) throws Throwable {
		return isbdao.BSSEdit(params);
	}

	@Override
	public List<HashMap<String, String>> getBSSList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSSList(params);
	}

	@Override
	public int getBSSCnt(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSSCnt(params);
	}

	@Override
	public int getBSUCnt(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSUCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBSUList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSUList(params);
	}

	@Override
	public int getBSDCnt(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSDCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBSDList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSDList(params);
	}

	@Override
	public List<HashMap<String, String>> getBSHList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSHList(params);
	}

	@Override
	public List<HashMap<String, String>> getCateList() throws Throwable {
		return isbdao.getCateList();
	}

	@Override
	public List<HashMap<String, String>> getBSSellList(HashMap<String, String> params) throws Throwable {
		return isbdao.getBSSellList(params);
	}

	@Override
	public int StorBStock(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.StorBStock(insertMap);
	}

	@Override
	public int StorBSafeStock(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.StorBSafeStock(insertMap);
	}

	@Override
	public int BSafeStock(HashMap<String, Object> insertMap) throws Throwable {
		return isbdao.BSafeStock(insertMap);
	}

	

}
