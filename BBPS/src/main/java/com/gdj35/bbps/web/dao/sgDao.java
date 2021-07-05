package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class sgDao implements IsgDao {
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getSCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("", params);
	}

	@Override
	public List<HashMap<String, String>> getSList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("", params);
	}
	
}
