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
	public int sendO(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SH.sendO", params);
	}

	@Override
	public int sendExp(HashMap<String, Object> insertMap) throws Throwable {
		return sqlSession.update("SH.sendExp", insertMap);
	}

	@Override
	public int getBOCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SH.getBOCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getBOList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getBOList", params);
	}

	@Override
	public HashMap<String, String> getBODtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SH.getBODtl", params);
	}

	@Override
	public List<HashMap<String, String>> getBODtlList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getBODtlList", params);
	}

	@Override
	public HashMap<String, String> getBRDtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SH.getBRDtl", params);
	}

	@Override
	public List<HashMap<String, String>> getBRDtlList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getBRDtlList", params);
	}

	@Override
	public int cnlO(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SH.cnlO", params);
	}

	@Override
	public int cnlRef(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SH.cnlRef", params);
	}

	@Override
	public List<HashMap<String, String>> getRefItem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getRefItem", params);
	}

	@Override
	public List<HashMap<String, String>> getOrdItem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SH.getOrdItem", params);
	}

	@Override
	public int writeRefItem(HashMap<String, Object> insertMap) throws Throwable {
		return sqlSession.insert("SH.writeRefItem",insertMap);
	}

	@Override
	public int writeRef(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("SH.writeRef",params);
	}

	@Override
	public int writeOrd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("SH.writeOrd", params);
	}

	@Override
	public int writeOrdItem(HashMap<String, Object> insertMap) throws Throwable {
		return sqlSession.insert("SH.writeOrdItem", insertMap);
	}

	@Override
	public HashMap<String, String> getLastONo() throws Throwable {
		return sqlSession.selectOne("SH.getLastONo");
	}

	@Override
	public List<HashMap<String, String>> getBrchList() throws Throwable {
		return sqlSession.selectList("SH.getBrchList");
	}

	@Override
	public List<HashMap<String, String>> getCateList() throws Throwable {
		return sqlSession.selectList("SH.getCateList");
	}

	@Override
	public int getAuth(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SH.getAuth", params);
	}
}

