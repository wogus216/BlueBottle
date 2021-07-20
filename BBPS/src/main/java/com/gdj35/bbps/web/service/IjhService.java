package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface IjhService {

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


}
