package com.gdj35.bbps.web.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class sbDao implements IsbDao{
	
	@Autowired
	public SqlSession sqlsession;

	@Override
	public int getPCnt(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getPCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getPList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getPList",params);
	}

	@Override
	public HashMap<String, String> getPDetail(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getPDetail",params);
	}

	@Override
	public List<HashMap<String, String>> getPHList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getPHList",params);
	}

	@Override
	public int AddItem(HashMap<String, Object> insertMap) throws Throwable {
		//
		return sqlsession.insert("sb.AddItem",insertMap);
	}

	@Override
	public int AddItemPrice(HashMap<String, Object> insertMap) throws Throwable {
		//
		return sqlsession.insert("sb.AddItemPrice",insertMap);
	}


}
