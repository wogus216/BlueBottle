package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface IjhDao {

	public HashMap<String, String> getHQ(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getB(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getHMenu(HashMap<String, String> params) throws Throwable;

	public int getMbCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMbList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMd(HashMap<String, String> params) throws Throwable;

	public int editM(HashMap<String, String> params) throws Throwable;

	public int addM(HashMap<String, String> params) throws Throwable;

	public int delM(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBMenu(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPMenu(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMOrd(HashMap<String, String> params) throws Throwable;

	public int addOrd(HashMap<String, Object> insertMap) throws Throwable;

	public int addSales(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getOrdNum() throws Throwable;

	public HashMap<String, String> getHUser(HashMap<String, String> params) throws Throwable;

	public int editHU(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getHPw(HashMap<String, String> params) throws Throwable;


}
