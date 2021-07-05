package com.gdj35.bbps.web.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class jhDao implements IjhDao {

	@Autowired
	public SqlSession sqlsession;
	
	@Override
	public HashMap<String, String> getHQ(HashMap<String, String> params) throws Throwable {
		System.out.println("db돌았습니다.");
		
		return sqlsession.selectOne("B.getHQ", params);
	}

}
