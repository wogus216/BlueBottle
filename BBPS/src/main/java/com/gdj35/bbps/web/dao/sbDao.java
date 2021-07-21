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

	@Override
	public int getPCnt(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getPCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getPList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getPList",params);
	}

	@Override
	public HashMap<String, String> getPDetail(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getPDetail",params);
	}

	@Override
	public List<HashMap<String, String>> getPHList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getPHList",params);
	}

	@Override
	public int AddItem(HashMap<String, Object> insertMap) throws Throwable {
		return sqlsession.insert("sb.AddItem",insertMap);
	}

	@Override
	public int AddItemPrice(HashMap<String, Object> insertMap) throws Throwable {
		return sqlsession.insert("sb.AddItemPrice",insertMap);
	}

	@Override
	public int EditItem(HashMap<String, String> params) throws Throwable {
		return sqlsession.update("sb.EditItem",params);
	}

	@Override
	public int EditItemPrice(HashMap<String, String> params) throws Throwable {
		return sqlsession.insert("sb.EditItemPrice",params);
	}

	@Override
	public int DelItem(HashMap<String, String> params) throws Throwable {
		return sqlsession.update("sb.DelItem",params);
	}

	@Override
	public  List<HashMap<String, String>> getSDetail(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getSDetail",params);
	}

	@Override
	public List<HashMap<String, String>> getSRelList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getSRelList",params);
	}

	@Override
	public List<HashMap<String, String>> getSDList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getSDList",params);
	}

	@Override
	public int AddStock(HashMap<String, Object> insertMap) throws Throwable {
		return  sqlsession.insert("sb.AddStock",insertMap);
	}

	@Override
	public int DiscardStock(HashMap<String, Object> insertMap) throws Throwable {
		return sqlsession.insert("sb.DiscardStock",insertMap);
	}

	@Override
	public List<HashMap<String, String>> getHSHList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getHSHList",params);
	}

	@Override
	public List<HashMap<String, String>> getHSDList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getHSDList",params);
	}

	@Override
	public int getHSDCnt(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getHSDCnt",params);
	}

	@Override
	public int getBSLCnt(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getBSLCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getBSList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBSList",params);
	}

	@Override
	public List<HashMap<String, String>> getBSEList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBSEList",params);
	}

	@Override
	public int EidtBStock(HashMap<String, Object> insertMap) throws Throwable {
		return sqlsession.insert("sb.EidtBStock",insertMap);
	}

	@Override
	public List<HashMap<String, String>> getBStockExpList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBStockExpList",params);
	}

	@Override
	public List<HashMap<String, String>> getBStockUseList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBStockUseList",params);
	}

	@Override
	public List<HashMap<String, String>> getBStockDiscardList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBStockDiscardList",params);
	}

	@Override
	public List<HashMap<String, String>> getBStockStorList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBStockStorList",params);
	}

	@Override
	public int BDiscardStock(HashMap<String, Object> insertMap) throws Throwable {
		return sqlsession.insert("sb.BDiscardStock",insertMap);
	}

	@Override
	public int BSSEdit(HashMap<String, String> params) throws Throwable {
		return sqlsession.update("sb.BSSEdit",params);
	}

	@Override
	public List<HashMap<String, String>> getBSSList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBSSList",params);
	}

	@Override
	public int getBSSCnt(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getBSSCnt",params);
	}

	@Override
	public int getBSUCnt(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getBSUCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getBSUList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBSUList",params);
	}

	@Override
	public int getBSDCnt(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("sb.getBSDCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getBSDList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBSDList",params);
	}

	@Override
	public List<HashMap<String, String>> getBSHList(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("sb.getBSHList",params);
	}

	@Override
	public List<HashMap<String, String>> getCateList() throws Throwable {
		return sqlsession.selectList("sb.getCateList");
	}


}
