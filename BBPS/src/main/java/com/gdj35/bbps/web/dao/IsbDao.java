package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface IsbDao {
	public int getPCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPList(HashMap<String, String> params) throws Throwable;
}
