package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface IsgDao {

	int getNCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getNList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getN(HashMap<String, String> params) throws Throwable;
	
	int addN(HashMap<String, String> params) throws Throwable;

	int getUCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getUList(HashMap<String, String> params) throws Throwable;

	int updateN(HashMap<String, String> params) throws Throwable;

	int deleteN(HashMap<String, String> params) throws Throwable;

	int addU(HashMap<String, String> params) throws Throwable;

	int addB(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getH(HashMap<String, String> params) throws Throwable;

}
