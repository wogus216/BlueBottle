package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface IsbService {
	public int getPCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPList(HashMap<String, String> params) throws Throwable;
}
