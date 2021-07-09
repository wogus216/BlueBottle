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
import com.gdj35.bbps.web.service.IshService;

@Controller
public class shController {

	@Autowired
	public IshService ishService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/Ord_Mang")
	public ModelAndView Ord_Mang(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		int page=1;
		
		if(params.get("page") != null) {
			  page=Integer.parseInt(params.get("page"));
		}
		   
		mav.addObject("page", page);
		mav.setViewName("sh/Ord_Mang");
		return mav;   
	}
	@RequestMapping(value = "/Ord_Mangs",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Ord_Mangs(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt  = ishService.getOCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String,String>> list = ishService.getOList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/Ord_Mang_dtl")
	public ModelAndView Ord_Mang_dtl(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		   mav.setViewName("sh/Ord_Mang_dtl");
		   return mav;
	   }
	@RequestMapping(value = "/Ord_Mang_dtls",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Ord_Mang_dtls(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> list = ishService.getO(params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
}
