package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface IsgService {

	public int getNCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getNList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getN(HashMap<String, String> params) throws Throwable;
	
	public int addN(HashMap<String, String> params) throws Throwable;

	public int updateN(HashMap<String, String> params) throws Throwable;

	public int deleteN(HashMap<String, String> params) throws Throwable;


	public int getUCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getUList(HashMap<String, String> params) throws Throwable;

	public int addU(HashMap<String, String> params) throws Throwable;

	public int addB(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getH(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getB(HashMap<String, String> params) throws Throwable;

	public int updateH(HashMap<String, String> params) throws Throwable;

	public int deleteH(HashMap<String, String> params) throws Throwable;

	public int updateB(HashMap<String, String> params) throws Throwable;


}
