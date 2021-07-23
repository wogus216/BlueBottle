package com.gdj35.bbps.web.controller;

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
	
	@RequestMapping(value="/getSalesList", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getSalesList(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String, Object>();
		
		try {
			int page = Integer.parseInt(params.get("page"));
			
			int cnt = iNyService.getSalesCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(page, cnt);
			
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
	
	
}
