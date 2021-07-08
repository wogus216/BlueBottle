package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

public interface IjhDao {

	public HashMap<String, String> getHQ(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getB(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getHMenu(HashMap<String, String> params) throws Throwable;

}
