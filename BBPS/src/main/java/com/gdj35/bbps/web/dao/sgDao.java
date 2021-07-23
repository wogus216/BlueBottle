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
		System.out.println("상세보기db받아옴");
		System.out.println(params);
		
		return sqlSession.selectOne("SG.getN", params);
	}

	@Override
	public int addN(HashMap<String, String> params) throws Throwable {
		System.out.println("등록db받아옴");
		System.out.println(params);
		return sqlSession.insert("SG.addN", params);
	}

	@Override
	public int updateN(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("SG.updateN", params);
	}

	@Override
	public int deleteN(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("SG.deleteN", params);
	}

	
	
	@Override
	public int getUCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("SG.getUCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getUList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("SG.getUList", params);
	}

	@Override
	public int addU(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("SG.addU", params);
	}

	@Override
	public int addB(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("SG.addB", params);
	}

	@Override
	public HashMap<String, String> getH(HashMap<String, String> params) throws Throwable {
		System.out.println("본사상세보기받아옴");
		System.out.println(params);
		return sqlSession.selectOne("SG.getH", params);
	}

	@Override
	public HashMap<String, String> getB(HashMap<String, String> params) throws Throwable {
		System.out.println("지점상세보기받아옴");
		System.out.println(params);
		return sqlSession.selectOne("SG.getB", params);
	}

	
	
}
