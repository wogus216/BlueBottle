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

	@Override
	public List<HashMap<String, String>> getOWholeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getOWholeList", params);
	}

	@Override
	public int apvOrd(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SH.apvOrd", params);
	}

	@Override
	public int nonApvOrd(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SH.nonApvOrd", params);
	}

	@Override
	public int apvRef(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SH.apvRef", params);
	}

	@Override
	public int nonApvRef(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SH.nonApvRef", params);
	}

	@Override
	public int sendO(HashMap<String, Object> insertMap) throws Throwable {
		return sqlSession.update("SH.sendO", insertMap);
	}

	@Override
	public int sendExp(HashMap<String, Object> insertMap) throws Throwable {
		return sqlSession.update("SH.sendExp", insertMap);
	}
}

