package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface InyDao {

	List<HashMap<String, String>> getCateList() throws Throwable;

	int addCate(HashMap<String, String> params) throws Throwable;

	int updateCate(HashMap<String, String> params) throws Throwable;

}
