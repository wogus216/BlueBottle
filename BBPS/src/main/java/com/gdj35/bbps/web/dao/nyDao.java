package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class nyDao implements InyDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getCateList() throws Throwable {
		System.out.println("db돌았습니다");
		return sqlSession.selectList("NY.getCateList");
	}

	@Override
	public int addCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.insert("NY.addCate", params);
	}

	@Override
	public int updateCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.update("NY.updateCate", params);
	}
	
	
}
