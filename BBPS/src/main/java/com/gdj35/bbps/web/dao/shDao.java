package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class shDao implements IshDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getOCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SH.getOCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getOList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getOList", params);
	}

	@Override
	public List<HashMap<String, String>> getODtlList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getODtlList", params);
	}

	@Override
	public HashMap<String, String> getODtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SH.getODtl", params);
	}

	@Override
	public List<HashMap<String, String>> getRDtlList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getRDtlList", params);
	}

	@Override
	public HashMap<String, String> getRDtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SH.getRDtl", params);
	}
}

