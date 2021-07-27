package com.gdj35.bbps.web.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class nyDao implements InyDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getNoticeCate() throws Throwable {
		System.out.println("db돌았습니다");
		return sqlSession.selectList("NY.getNoticeCate");
	}

	@Override
	public int addNoticeCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.insert("NY.addNoticeCate", params);
	}

	@Override
	public int updateNoticeCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.update("NY.updateNoticeCate", params);
	}

	@Override
	public int deleteNoticeCate(HashMap<String, String> params) throws Throwable {
		System.out.println("db돌았습니다");
		return sqlSession.update("NY.deleteNoticeCate", params);
	}

	@Override
	public List<HashMap<String, String>> getItemCate() throws Throwable {

		return sqlSession.selectList("NY.getItemCate");
	}

	@Override
	public int addItemCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.insert("NY.addItemCate", params);
	}

	@Override
	public int updateItemCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.update("NY.updateItemCate", params);
	}

	@Override
	public int deleteItemCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.update("NY.deleteItemCate", params);
	}

	@Override
	public List<HashMap<String, String>> getMenuCate() throws Throwable {

		return sqlSession.selectList("NY.getMenuCate");
	}

	@Override
	public int addMenuCate(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("NY.addMenuCate", params);
	}

	@Override
	public int updateMenuCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.update("NY.updateMenuCate", params);
	}

	@Override
	public int deleteMenuCate(HashMap<String, String> params) throws Throwable {

		return sqlSession.update("NY.deleteMenuCate", params);
	}

	@Override
	public List<HashMap<String, String>> getSalesLists(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getSalesList", params);
	}

	@Override
	public int getSalesCnt(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectOne("NY.getSalesCnt", params);
	}


	@Override
	public List<HashMap<String, String>> getSalesDetail(HashMap<String, String> params) throws Throwable {
		System.out.println("db돌았습니다");
		return sqlSession.selectList("NY.getSalesDetail", params);
	}

	@Override
	public int getSalesDetailCnt(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectOne("NY.getSalesDetailCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSalesDetailAll(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getSalesDetailAll", params);
	}

	@Override
	public List<HashMap<String, String>> getSalesDetailDetail(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getSalesDetailDetail", params);
	}

	@Override
	public List<HashMap<String, String>> getTotSales(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getTotSales", params);
	}

	@Override
	public int cnlSales(HashMap<String, String> params) throws Throwable {

		return sqlSession.update("NY.cnlSales", params);
	}

	@Override
	public List<HashMap<String, String>> getBrchList() throws Throwable {

		return sqlSession.selectList("NY.getBrchList");
	}

	@Override
	public List<HashMap<String, String>> getBrchSalesList(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getBrchSalesList", params);
	}

	@Override
	public int getBrchSalesCnt(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectOne("NY.getBrchSalesCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getBrchTotSales(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getBrchTotSales", params);
	}

	@Override
	public List<HashMap<String, String>> getDailyChartData(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getDailyChartData", params);
	}

	@Override
	public List<HashMap<String, String>> getMonthlyChartData(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getMonthlyChartData", params);
	}

	@Override
	public List<HashMap<String, String>> getMenuChartData(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getMenuChartData", params);
	}

	@Override
	public List<HashMap<String, String>> getMenuChartDataDetail(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getMenuChartDataDetail", params);
	}

	@Override
	public List<HashMap<String, String>> getHeadMonthlyChartData(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("NY.getHeadMonthlyChartData", params);
	}

		
}
