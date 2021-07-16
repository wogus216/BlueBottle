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
		
		return sqlsession.selectOne("JH.getHQ", params);
	}

	@Override
	public HashMap<String, String> getB(HashMap<String, String> params) throws Throwable {
		System.out.println("지점db돌았습니다.");
		return sqlsession.selectOne("JH.getB", params);
	}

	@Override
	public List<HashMap<String, String>> getHMenu(HashMap<String, String> params) throws Throwable {
		System.out.println("본사메뉴db돌았습니다.");
		return sqlsession.selectList("JH.getHMenu", params);
	}

	@Override
	public int getMbCnt(HashMap<String, String> params) throws Throwable {
		System.out.println("메뉴 게시글 개수db돌았습니다.");
		return sqlsession.selectOne("JH.getMbCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getMbList(HashMap<String, String> params) throws Throwable {
		System.out.println("메뉴 게시글 db돌았습니다.");
		return sqlsession.selectList("JH.getMbList", params);
		
	}

	@Override
	public HashMap<String, String> getMd(HashMap<String, String> params) throws Throwable {
		System.out.println("상세보기 db돌았습니다.");
		return sqlsession.selectOne("JH.getMd", params);
	}

	@Override
	public int editM(HashMap<String, String> params) throws Throwable {
		System.out.println("수정 db돌았습니다.");
		return sqlsession.update("JH.editM", params);
	}

	@Override
	public int addM(HashMap<String, String> params) throws Throwable {
		System.out.println("추가 db돌았습니다.");
		return sqlsession.insert("JH.addM", params);
	}

	@Override
	public int delM(HashMap<String, String> params) throws Throwable {
		return sqlsession.update("JH.delM", params);
	}

	@Override
	public List<HashMap<String, String>> getBMenu(HashMap<String, String> params) throws Throwable {
		System.out.println("지점메뉴db돌았습니다.");
		return sqlsession.selectList("JH.getBMenu", params);
	}

	@Override
	public List<HashMap<String, String>> getPMenu(HashMap<String, String> params) throws Throwable {
		System.out.println("포스메뉴db돌았습니다.");
		return sqlsession.selectList("JH.getPMenu", params);
	}

	@Override
	public HashMap<String, String> getMOrd(HashMap<String, String> params) throws Throwable {
		System.out.println("오더메뉴db돌았습니다.");
		return sqlsession.selectOne("JH.getMOrd",  params);
	}

	
}
