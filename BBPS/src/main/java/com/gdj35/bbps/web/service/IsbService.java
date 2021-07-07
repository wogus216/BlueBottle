package com.gdj35.bbps.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface IsbService {
	public int getPCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getPDetail(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPHList(HashMap<String, String> params) throws Throwable;

	public int AddItem(HashMap<String, Object> insertMap) throws Throwable;

	public int AddItemPrice(HashMap<String, Object> insertMap) throws Throwable;

	
}
