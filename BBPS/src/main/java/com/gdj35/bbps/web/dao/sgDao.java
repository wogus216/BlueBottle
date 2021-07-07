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
	public int getNCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SG.getNCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getNList(HashMap<String, String> params) throws Throwable {
		System.out.println("리스트db받아옴");
		return sqlSession.selectList("SG.getNList", params);
	}
	
	@Override
	public HashMap<String, String> getN(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SG.getN", params);
	}

	@Override
	public int addN(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("SG.addN", params);
	}

	
	
}
