package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface InyService {

	List<HashMap<String, String>> getNoticeCate() throws Throwable;

	int addNoticeCate(HashMap<String, String> params) throws Throwable;

	int updateNoticeCate(HashMap<String, String> params) throws Throwable;

	int deleteNoticeCate(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getItemCate() throws Throwable;

	int addItemCate(HashMap<String, String> params) throws Throwable;

	int updateItemCate(HashMap<String, String> params) throws Throwable;

	int deleteItemCate(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getMenuCate() throws Throwable;

	int addMenuCate(HashMap<String, String> params) throws Throwable;

	int updateMenuCate(HashMap<String, String> params) throws Throwable;

	int deleteMenuCate(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getSalesList(HashMap<String, String> params) throws Throwable;

	int getSalesCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getSalesDetail(HashMap<String, String> params) throws Throwable;

	int getSalesDetailCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getSalesDetailAll(HashMap<String, String> params) throws Throwable;


	;
}
