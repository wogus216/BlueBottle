package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface IsgDao {

	int getSCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getSList(HashMap<String, String> params) throws Throwable;

}
