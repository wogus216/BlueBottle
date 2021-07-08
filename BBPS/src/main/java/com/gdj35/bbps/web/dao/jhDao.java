package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class jhDao implements IjhDao {

	@Autowired
	public SqlSession sqlsession;
	
	@Override
	public HashMap<String, String> getHQ(HashMap<String, String> params) throws Throwable {
		System.out.println("본사db돌았습니다.");
		
		return sqlsession.selectOne("B.getHQ", params);
	}

	@Override
	public HashMap<String, String> getB(HashMap<String, String> params) throws Throwable {
		System.out.println("지점db돌았습니다.");
		return sqlsession.selectOne("B.getB", params);
	}

	@Override
	public List<HashMap<String, String>> getHMenu(HashMap<String, String> params) throws Throwable {
		System.out.println("메뉴db돌았습니다.");
		return sqlsession.selectList("B.getHMenu", params);
	}

	@Override
	public int getMbCnt(HashMap<String, String> params) throws Throwable {
		System.out.println("메뉴 게시글 개수db돌았습니다.");
		return sqlsession.selectOne("B.getMbCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getMbList(HashMap<String, String> params) throws Throwable {
		System.out.println("메뉴 게시글 db돌았습니다.");
		return sqlsession.selectList("B.getMbList", params);
		
	}

}
