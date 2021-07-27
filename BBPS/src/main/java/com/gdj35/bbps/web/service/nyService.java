package com.gdj35.bbps.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.InyDao;

@Service
public class nyService implements InyService{

	@Autowired
	public InyDao iNyDao;

	@Override
	public List<HashMap<String, String>> getNoticeCate() throws Throwable {

		return iNyDao.getNoticeCate();
	}

	@Override
	public int addNoticeCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.addNoticeCate(params);
	}

	@Override
	public int updateNoticeCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.updateNoticeCate(params);
	}

	@Override
	public int deleteNoticeCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.deleteNoticeCate(params);
	}

	@Override
	public List<HashMap<String, String>> getItemCate() throws Throwable {

		return iNyDao.getItemCate();
	}

	@Override
	public int addItemCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.addItemCate(params);
	}

	@Override
	public int updateItemCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.updateItemCate(params);
	}

	@Override
	public int deleteItemCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.deleteItemCate(params);
	}

	@Override
	public List<HashMap<String, String>> getMenuCate() throws Throwable {

		return iNyDao.getMenuCate();
	}

	@Override
	public int addMenuCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.addMenuCate(params);
	}

	@Override
	public int updateMenuCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.updateMenuCate(params);
	}

	@Override
	public int deleteMenuCate(HashMap<String, String> params) throws Throwable {

		return iNyDao.deleteMenuCate(params);
	}

	@Override
	public List<HashMap<String, String>> getSalesList(HashMap<String, String> params) throws Throwable {
		
		return iNyDao.getSalesLists(params);
	}

	@Override
	public int getSalesCnt(HashMap<String, String> params) throws Throwable {

		return iNyDao.getSalesCnt(params);
	}


	@Override
	public List<HashMap<String, String>> getSalesDetail(HashMap<String, String> params) throws Throwable {
		System.out.println("db돌았습니다");
		return iNyDao.getSalesDetail(params);
	}

	@Override
	public int getSalesDetailCnt(HashMap<String, String> params) throws Throwable {

		return iNyDao.getSalesDetailCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSalesDetailAll(HashMap<String, String> params) throws Throwable {

		return iNyDao.getSalesDetailAll(params);
	}

	@Override
	public List<HashMap<String, String>> getSalesDetailDetail(HashMap<String, String> params) throws Throwable {

		return iNyDao.getSalesDetailDetail(params);
	}

	@Override
	public List<HashMap<String, String>> getTotSales(HashMap<String, String> params) throws Throwable {

		return iNyDao.getTotSales(params);
	}

	@Override
	public int cnlSales(HashMap<String, String> params) throws Throwable {

		return iNyDao.cnlSales(params);
	}

	@Override
	public List<HashMap<String, String>> getBrchList() throws Throwable {

		return iNyDao.getBrchList();
	}

	@Override
	public List<HashMap<String, String>> getBrchSalesList(HashMap<String, String> params) throws Throwable {

		return iNyDao.getBrchSalesList(params);
	}

	@Override
	public int getBrchSalesCnt(HashMap<String, String> params) throws Throwable {

		return iNyDao.getBrchSalesCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBrchTotSales(HashMap<String, String> params) throws Throwable {

		return iNyDao.getBrchTotSales(params);
	}

	@Override
	public List<HashMap<String, String>> getDailyChartData(HashMap<String, String> params) throws Throwable {

		return iNyDao.getDailyChartData(params);
	}

	@Override
	public List<HashMap<String, String>> getMonthlyChartData(HashMap<String, String> params) throws Throwable {

		return iNyDao.getMonthlyChartData(params);
	}

	@Override
	public List<HashMap<String, String>> getMenuChartData(HashMap<String, String> params) throws Throwable {

		return iNyDao.getMenuChartData(params);
	}

	@Override
	public List<HashMap<String, String>> getMenuChartDataDetail(HashMap<String, String> params) throws Throwable {

		return iNyDao.getMenuChartDataDetail(params);
	}

	@Override
	public List<HashMap<String, String>> getHeadMonthlyChartData(HashMap<String, String> params) throws Throwable {

		return iNyDao.getHeadMonthlyChartData(params);
	}



}
