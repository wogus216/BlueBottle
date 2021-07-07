package com.gd.test.web.testj.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JsgDao implements JsgIDao{

	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public int getSCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SELL.getSCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getSList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SELL.getSList",params);
	}

	@Override
	public int addS(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("SELL.addS", params);
	}

	@Override
	public HashMap<String, String> getS(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SELL.getS", params);
	}

	@Override
	public int updateS(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SELL.updateS", params);
	}

	@Override
	public int deleteS(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("SELL.deleteS", params);
	}

}
