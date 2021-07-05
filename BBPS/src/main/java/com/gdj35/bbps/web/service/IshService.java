package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface IshService {
	public int getOCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getOList(HashMap<String, String> params) throws Throwable;

}
