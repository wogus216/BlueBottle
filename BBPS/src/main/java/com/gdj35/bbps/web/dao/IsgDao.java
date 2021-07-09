package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface IsgDao {

	int getNCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getNList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getN(HashMap<String, String> params) throws Throwable;
	
	int addN(HashMap<String, String> params) throws Throwable;

}