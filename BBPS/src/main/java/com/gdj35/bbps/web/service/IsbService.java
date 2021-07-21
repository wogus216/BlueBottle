package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface IsbService {
	public int getPCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getPDetail(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPHList(HashMap<String, String> params) throws Throwable;

	public int AddItem(HashMap<String, Object> insertMap) throws Throwable;

	public int AddItemPrice(HashMap<String, Object> insertMap) throws Throwable;

	public int EditItem(HashMap<String, String> params) throws Throwable;

	public int EditItemPrice(HashMap<String, String> params) throws Throwable;

	public int DelItem(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSDetail(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSRelList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSDList(HashMap<String, String> params) throws Throwable;

	public int AddStock(HashMap<String, Object> insertMap) throws Throwable;

	public int DiscardStock(HashMap<String, Object> insertMap) throws Throwable;

	public List<HashMap<String, String>> getHSHList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getHSDList(HashMap<String, String> params) throws Throwable;

	public int getHSDCnt(HashMap<String, String> params) throws Throwable;

	public int getBSLCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBSList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBSEList(HashMap<String, String> params) throws Throwable;

	public int EidtBStock(HashMap<String, Object> insertMap) throws Throwable;

	public List<HashMap<String, String>> getBStockExpList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBStockUseList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBStockDiscardList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBStockStorList(HashMap<String, String> params) throws Throwable;

	public int BDiscardStock(HashMap<String, Object> insertMap) throws Throwable;

	public int BSSEdit(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBSSList(HashMap<String, String> params) throws Throwable;

	public int getBSSCnt(HashMap<String, String> params) throws Throwable;

	public int getBSUCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBSUList(HashMap<String, String> params) throws Throwable;

	public int getBSDCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBSDList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBSHList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCateList() throws Throwable;
}
