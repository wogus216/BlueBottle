package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.fabric.xmlrpc.base.Params;

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

	@Override
	public int addOrd(HashMap<String, Object> insertMap) throws Throwable {
		System.out.println("주문품목db돌았습니다.");
		System.out.println("insertmap"+insertMap);
		return sqlsession.insert("JH.addOrd", insertMap);
	}

	@Override
	public int addSales(HashMap<String, String> params) throws Throwable {
		System.out.println("주문금액db돌았습니다.");
		return sqlsession.insert("JH.addSales", params);
	}

	@Override
	public HashMap<String, String> getOrdNum() throws Throwable {
		System.out.println("주문번호 갖고오자");
		return sqlsession.selectOne("JH.getOrdNum");
	}

	@Override
	public HashMap<String, String> getHUser(HashMap<String, String> params) throws Throwable {
		System.out.println("본사 마이페이지 갖고오자");
		System.out.println("본사마이페이지params"+params);
		return sqlsession.selectOne("JH.getHUser", params);
		
	}

	@Override
	public int editHU(HashMap<String, String> params) throws Throwable {
		System.out.println("본사 마이페이지수정 갖고오자");
		System.out.println("본사마이수정params"+params);
		return sqlsession.update("JH.editHU", params);
	}

	@Override
	public HashMap<String, String> getHPw(HashMap<String, String> params) throws Throwable {
		System.out.println("본사 비번 갖고오자");
		System.out.println("본사 아이디 비번params"+params);
		return sqlsession.selectOne("JH.getHPw", params);
	}

	@Override
	public HashMap<String, String> getBUser(HashMap<String, String> params) throws Throwable {
		System.out.println("지점 마이페이지 갖고오자");
		System.out.println("지점 마이페이지params"+params);
		return sqlsession.selectOne("JH.getBUser", params);
	}

	@Override
	public HashMap<String, String> getBPw(HashMap<String, String> params) throws Throwable {
		System.out.println("지점 비번 갖고오자");
		System.out.println("지점 아이디 비번params"+params);
		return sqlsession.selectOne("JH.getBPw", params);
	}

	@Override
	public int editBU(HashMap<String, String> params) throws Throwable {
		System.out.println("지점 마이페이지수정 갖고오자");
		System.out.println("지점 마이수정params"+params);
		return sqlsession.update("JH.editBU", params);
	}

	@Override
	public List<HashMap<String, String>> getRList(HashMap<String, String> params) throws Throwable {
		System.out.println("지점 환불목록 갖고오자");
		System.out.println("지점 환불목록params"+params);
		return sqlsession.selectList("JH.getRList", params);
	}

	@Override
	public int getRCnt(HashMap<String, String> params) throws Throwable {
		System.out.println("지점 환불목록 개수");
		return sqlsession.selectOne("JH.getRCnt", params);
	}


	
}
