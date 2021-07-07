package com.gd.test.web.testj.dao;

import java.util.HashMap;
import java.util.List;

public interface JsgIDao {

	int getSCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getSList(HashMap<String, String> params)throws Throwable;

	int addS(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getS(HashMap<String, String> params)throws Throwable;

	int updateS(HashMap<String, String> params)throws Throwable;

	int deleteS(HashMap<String, String> params) throws Throwable;

}
