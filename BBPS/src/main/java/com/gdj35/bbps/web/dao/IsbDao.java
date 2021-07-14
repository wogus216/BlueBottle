package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface IsbDao {
	public int getPCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getPDetail(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPHList(HashMap<String, String> params) throws Throwable;

	public int AddItem(HashMap<String, Object> insertMap) throws Throwable;

	public int AddItemPrice(HashMap<String, Object> insertMap) throws Throwable;

	public int EditItem(HashMap<String, String> params) throws Throwable;

	public int EditItemPrice(HashMap<String, String> params) throws Throwable;

	public int DelItem(HashMap<String, String> params) throws Throwable;

	public  List<HashMap<String, String>> getSDetail(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSRelList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSDList(HashMap<String, String> params) throws Throwable;

	public int AddStock(HashMap<String, Object> insertMap) throws Throwable;

	public int DiscardStock(HashMap<String, Object> insertMap) throws Throwable;

	public List<HashMap<String, String>> getHSHList(HashMap<String, String> params) throws Throwable;


}
