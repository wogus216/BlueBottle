package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class sbDao implements IsbDao{
	
	@Autowired
	public SqlSession sqlsession;
	
	public List<HashMap<String, String>> getproductlist() throws Throwable{
		return sqlsession.selectList("sb.getproductlist");
	}

}
