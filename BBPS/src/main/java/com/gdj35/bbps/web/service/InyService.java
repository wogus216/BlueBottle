package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface InyService {

	List<HashMap<String, String>> getCateList() throws Throwable;

	int addCate(HashMap<String, String> params) throws Throwable;

	int updateCate(HashMap<String, String> params) throws Throwable;

}
