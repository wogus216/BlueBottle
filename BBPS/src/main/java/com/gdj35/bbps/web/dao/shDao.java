package com.gdj35.bbps.web.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class shDao implements IshDao{
	@Autowired
	public SqlSession sqlSession;
}
