package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

public interface IsgService {

	public int getNCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getNList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getN(HashMap<String, String> params) throws Throwable;
	
	public int addN(HashMap<String, String> params) throws Throwable;

}
