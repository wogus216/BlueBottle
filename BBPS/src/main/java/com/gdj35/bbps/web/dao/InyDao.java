package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface InyDao {

	List<HashMap<String, String>> getNoticeCate() throws Throwable;

	int addNoticeCate(HashMap<String, String> params) throws Throwable;

	int updateNoticeCate(HashMap<String, String> params) throws Throwable;

	int deleteNoticeCate(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getItemCate() throws Throwable;

	int addItemCate(HashMap<String, String> params) throws Throwable;

}
