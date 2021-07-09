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
	public List<HashMap<String, String>> getNoticeCate() throws Throwable {
		System.out.println("db돌았습니다");
		return sqlSession.selectList("NY.getNoticeCate");
	}

	@Override
	public int addNoticeCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.insert("NY.addNoticeCate", params);
	}

	@Override
	public int updateNoticeCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.update("NY.updateNoticeCate", params);
	}

	@Override
	public int deleteNoticeCate(HashMap<String, String> params) throws Throwable {
		System.out.println("db돌았습니다");
		return sqlSession.update("NY.deleteNoticeCate", params);
	}

	@Override
	public List<HashMap<String, String>> getItemCate() throws Throwable {

		return sqlSession.selectList("NY.getItemCate");
	}

	@Override
	public int addItemCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.insert("NY.addItemCate", params);
	}
	
	
}
