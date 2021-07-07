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
	
	@RequestMapping(value="/cateList", method=RequestMethod.POST, produces ="text/json;charset=UTF-8")
	@ResponseBody
	public String cateList() throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iNyService.getCateList();
		
		modelMap.put("list", list);
		System.out.println("list"+list);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	@RequestMapping(value="cateAdd", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cateAdd(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.addCate(params);
			
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
	
	@RequestMapping(value="/cateUpdate", method=RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cateUpdate(@RequestParam HashMap<String, String> params) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iNyService.updateCate(params);
			
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
	
}
