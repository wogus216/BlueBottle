package com.gd.test.web.testj.service;

import java.util.HashMap;
import java.util.List;

public interface JsgIService {

	public int getSCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSList(HashMap<String, String> params) throws Throwable;

	public int addS(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getS(HashMap<String, String> params) throws Throwable;

	public int updateS(HashMap<String, String> params) throws Throwable;

	public int deleteS(HashMap<String, String> params)throws Throwable;


	

}
