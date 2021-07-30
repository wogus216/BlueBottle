package com.gdj35.bbps.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj35.bbps.common.bean.PagingBean;
import com.gdj35.bbps.common.service.IPagingService;
import com.gdj35.bbps.web.service.InyService;

@Controller
public class nyController {

	@Autowired
	public  InyService iNyService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/Notice_Cate_Mang")
	public ModelAndView Notice_Cate_Mang(ModelAndView mav) {
		
		mav.setViewName("ny/Notice_Cate_Mang");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeCateList", method=RequestMethod.POST, produces ="text/json;charset=UTF-8")
	@ResponseBody
	public String noticeCateList() throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iNyService.getNoticeCate();
		
		modelMap.put("list", list);
		System.out.println("list"+list);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value="noticeCateAdd", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String noticeCateAdd(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.addNoticeCate(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/noticeCateUpdate", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String noticeCateUpdate(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.updateNoticeCate(params);
			
			if(cnt > 0) {
				modelMap.put("msg","success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/noticeCateDelete", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String noticeCateDelete(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.deleteNoticeCate(params);
			
			if(cnt > 0) {
				modelMap.put("msg","success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/Item_Cate_Mang")
	public ModelAndView Item_Cate_Mang(ModelAndView mav) {
		
		mav.setViewName("ny/Item_Cate_Mang");
		
		return mav;
	}
	
	@RequestMapping(value="/itemCateList", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String itemCateList() throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iNyService.getItemCate();
		
		modelMap.put("list", list);
		System.out.println("list"+list);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value="/itemCateAdd", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String itemCateAdd(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.addItemCate(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/itemCateUpdate", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String itemCateUpdate(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.updateItemCate(params);
			
			if(cnt > 0 ) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/itemCateDelete", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String itemCateDelete(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();		
		try {
			int cnt = iNyService.deleteItemCate(params);
			
			if(cnt > 0 ) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping (value="/Menu_Cate_Mang")
	public ModelAndView Menu_Cate_Mang(ModelAndView mav) {
		
		mav.setViewName("ny/Menu_Cate_Mang");		
		return mav;
	}
	
	@RequestMapping(value="/menuCateList", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String menuCateList() throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
				
		List<HashMap<String, String>> list = iNyService.getMenuCate();
			
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value="/menuCateAdd", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String menuCateAdd(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.addMenuCate(params);
			
			if(cnt > 0 ) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "error");
			}
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/menuCateUpdate", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String menuCateUpdate(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.updateMenuCate(params);
			
			if(cnt > 0 ) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/menuCateDelete", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String menuCateDelete(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();		
		try {
			int cnt = iNyService.deleteMenuCate(params);
			
			if(cnt > 0 ) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/B_Sales")
	public ModelAndView B_Sales(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		int page = 1;
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("ny/B_Sales");
		
		return mav;
	}
	
	@RequestMapping(value="/getSalesLists", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getSalesLists(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String, Object>();
		
		try {
			int page = Integer.parseInt(params.get("page"));
			
			int cnt = iNyService.getSalesCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 10, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iNyService.getSalesList(params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getTotSales", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getTotSales(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String, Object>();
		
		try {
			
			List<HashMap<String, String>> list = iNyService.getTotSales(params);
			
			modelMap.put("list", list);

		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping (value="/B_Sales_Detail")
	public ModelAndView B_Sales_Detail(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		if(params.get("enroll_date") != null) {
			
			mav.setViewName("ny/B_Sales_Detail");
		}
		else {
			mav.setViewName("redirect:B_Sales");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/getSalesDetail", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getSalesDetail(@RequestParam HashMap<String,String> params)throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			List<HashMap<String,String>> list = iNyService.getSalesDetail(params);
			modelMap.put("list", list);
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getSalesDetailAll", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getSalesDetailAll(@RequestParam HashMap<String,String> params)throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			List<HashMap<String, String>> list = iNyService.getSalesDetailAll(params);
	
			modelMap.put("list", list);
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getSalesDetailDetail", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getSalesDetailDetail(@RequestParam HashMap<String,String> params)throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			
			List<HashMap<String,String>> list = iNyService.getSalesDetailDetail(params);
			
			modelMap.put("list", list);
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value="/cnlSales", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String cnlSales(@RequestParam HashMap<String,String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
		try {
			int cnt = iNyService.cnlSales(params);
			
			if(cnt > 0 ) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);

	}
	
	@RequestMapping(value = "/Sales_List")
	public ModelAndView Sales_List(@RequestParam HashMap<String,String> params, ModelAndView mav) {
		
		int page = 1;
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("ny/Sales_List");
		
		return mav;
	}
	
	@RequestMapping(value="/getBrchList", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getBrchList() throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
		try {
			
			List<HashMap<String,String>> list = iNyService.getBrchList();
			
			modelMap.put("list", list);
			
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);

	}
	
	@RequestMapping(value="/B_Chart")
	public ModelAndView B_Chart(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable{
		
		mav.setViewName("ny/B_Chart");
		
		return mav;
	}
	
	@RequestMapping(value="/getDailyChartData", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getDailyChartData(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		String[] type = {"column", "column", "spline"};
		String[] name = {"매출", "지출", "순매출"};
		String[] dataName = {"SALES_PRICE", "ORD_PRICE", "NET_PRICE"};
		
		List<HashMap<String,String>> dataList = iNyService.getDailyChartData(params);
		System.out.println(dataList.size());
		if(dataList.size() == 0) {
			modelMap.put("status","null");
		} else {
			modelMap.put("status","fine");
		}
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		for(int i = 0; i < 3; i++) {
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			data.put("type", type[i]);
			data.put("name", name[i]);
	
			List<Object> y = new ArrayList<Object>(); 
			for(int j = 0; j < dataList.size(); j++) {
				y.add(dataList.get(j).get(dataName[i]));
			}
			
			data.put("data", y);
			
			list.add(data);
			
		}
		
		HashMap<String,String> marker = new HashMap<String,String>();
		
		marker.put("lineWidth", "2");
		marker.put("lineColor", "Highcharts.getOptions().colors[3]");
		marker.put("fillColor", "'white'");
		
		list.get(2).put("marker", marker);
		
		List<Object> day = new ArrayList<Object>();
		for(int i = 0; i < dataList.size(); i++) {
			day.add(dataList.get(i).get("DAY")+"일");
		}
		
		modelMap.put("list", list);
		modelMap.put("day", day);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getMonthlyChartData", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getMonthlyChartData(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		String[] type = {"column", "column", "spline"};
		String[] name = {"매출", "지출", "순매출"};
		String[] dataName = {"SALES_PRICE", "ORD_PRICE", "NET_PRICE"};
		
		List<HashMap<String,String>> dataList = iNyService.getMonthlyChartData(params);
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		for(int i = 0; i < 3; i++) {
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			data.put("type", type[i]);
			data.put("name", name[i]);
	
			List<Object> y = new ArrayList<Object>(); 
			for(int j = 0; j < dataList.size(); j++) {
				y.add(dataList.get(j).get(dataName[i]));
			}
			
			data.put("data", y);
			
			list.add(data);
			
			if(y.size() == 0) {
				modelMap.put("status","null");
			} else {
				modelMap.put("status","fine");
			}
		}
		
		HashMap<String,String> marker = new HashMap<String,String>();
		
		marker.put("lineWidth", "2");
		marker.put("lineColor", "Highcharts.getOptions().colors[3]");
		marker.put("fillColor", "'white'");
		
		list.get(2).put("marker", marker);
		
		List<Object> month = new ArrayList<Object>();
		for(int i = 0; i < dataList.size(); i++) {
			month.add(dataList.get(i).get("MONTH")+"월");
		}
		
		if(list.size() == 0) {
			modelMap.put("status","null");
		} else {
			modelMap.put("status","fine");
		}
		
		modelMap.put("list", list);
		modelMap.put("month", month);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getMenuChartData", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getMenuChartData(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		String[] type = {"column", "column", "column", "column"};
		String[] name = {"음료", "제과", "굿즈", "원두"};
		
		List<HashMap<String,String>> dataList = iNyService.getMenuChartData(params);
		
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		for(int i = 0; i < 4; i++) {
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			data.put("type", type[i]);
			data.put("name", name[i]);
	
			List<Object> y = new ArrayList<Object>(); 
			for(int j = 0; j < dataList.size(); j++) {
				if(dataList.get(j).get("CATE_NAME").equals(name[i])) {
					y.add(dataList.get(j).get("CNT"));
				}
			}
			
			data.put("data", y);
			
			list.add(data);
			
			if(y.size() == 0) {
				modelMap.put("status","null");
			} else {
				modelMap.put("status","fine");
			}
		}

		List<String> month = new ArrayList<String>();

		for(int i = 0; i < dataList.size(); i++) {
			month.add(dataList.get(i).get("MONTH")+"월");
		}
		//중복제거
		for(int i = 0; i < month.size()-1; i++) {
			for(int j = i+1; j < month.size(); j++) {
				if(month.get(i).equals(month.get(j))) {
					month.remove(j);
					j--;
				}
			}
		}
		
		if(list.size() == 0) {
			modelMap.put("status","null");
		}
		
		modelMap.put("list", list);
		modelMap.put("month", month);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getMenuCate", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getMenuCate() throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
	
		try {
			
			List<HashMap<String,String>> list = iNyService.getMenuCate();
			
			modelMap.put("list", list);
			
			System.out.println(list);
		}
		catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);

	}
	
	@RequestMapping(value="/getMenuChartDataDetail", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getMenuChartDataDetail(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> dataList = iNyService.getMenuChartDataDetail(params);
		
		List<Object> name = new ArrayList<Object>(); 
		
		for(int i = 0; i < dataList.size(); i++) {
			name.add(dataList.get(i).get("MENU_NAME"));
		}
			
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		for(int i = 0; i < dataList.size(); i++) {
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			data.put("type", "column");
			data.put("name", name.get(i));
	
			List<Object> y = new ArrayList<Object>(); 
			for(int j = 0; j < dataList.size(); j++) {
				if(dataList.get(j).get("MENU_NAME").equals(name.get(i))) {
					y.add(dataList.get(j).get("CNT"));
				}
			}
			
			data.put("data", y);
			
			list.add(data);
			
			if(y.size() == 0) {
				modelMap.put("status","null");
			} else {
				modelMap.put("status","fine");
			}
		}
		
		if(params.get("menuCate").equals("0")) {
			String[] color = {"#233c11","#457722","#66b032","#82cd4","#9dd874","#b9e39c","#e3f4d7"};
			modelMap.put("color", color);
		} else if(params.get("menuCate").equals("1")) {
			String[] color = {"#644f02","#b08a03","#e2b203","#fccc1a","#fcd74f","#fde281","#feeeb4", "#fff9e6"};
			modelMap.put("color", color);
		} else if(params.get("menuCate").equals("2")) {
			String[] color = {"#142e39","#214d5f","#2e6c85","#3b8bab","#54a5c4","#7ab9d1","#a0cdde", "#c6e1eb" ,"#ecf5f8"};
			modelMap.put("color", color);
		} else {
			String[] color = {"#7e2d01","#ca4802","#fc5a03","#fd6b1c","#54a5c4","#fd8c4e","#fead81", "#feceb3"};
			modelMap.put("color", color);
		}
		
		if(list.size() == 0) {
			modelMap.put("status","null");
		}
		modelMap.put("list", list);
		modelMap.put("name", name);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/Chart")
	public ModelAndView Chart(ModelAndView mav) {
		
		mav.setViewName("ny/Chart");
		
		return mav;
		
	}
	
	@RequestMapping(value="/getHeadMonthlyChartData", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getHeadMonthlyChartData(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> dataList = iNyService.getHeadMonthlyChartData(params);
		
		List<Object> name = new ArrayList<Object>(); 
		
		for(int i = 0; i < dataList.size(); i++) {
			name.add(dataList.get(i).get("BRCH_NAME"));
		}
	
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		
		for(int i = 0; i < dataList.size(); i++) {
			HashMap<String, Object> data = new HashMap<String, Object>();
			
			data.put("type", "column");
			data.put("name", name.get(i));
	
			List<Object> y = new ArrayList<Object>(); 
			for(int j = 0; j < dataList.size(); j++) {
				if(dataList.get(j).get("BRCH_NAME").equals(name.get(i))) {
					y.add(dataList.get(j).get("TOT_NET"));
				}
			}
			
			data.put("data", y);
			
			list.add(data);
			
			
		}
		
		if(list.size() == 0) {
			modelMap.put("status","null");
		} else {
			modelMap.put("status","fine");
		}
		
		modelMap.put("list", list);
		modelMap.put("name", name);
		
		return mapper.writeValueAsString(modelMap);
	}



}







