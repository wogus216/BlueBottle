package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface IsgService {

	public int getSCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSList(HashMap<String, String> params) throws Throwable;

}
