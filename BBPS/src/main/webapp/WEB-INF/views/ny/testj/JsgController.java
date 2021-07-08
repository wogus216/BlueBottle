package com.gd.test.web.testj.controller;

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
import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.web.testj.service.JsgIService;
@Controller
public class JsgController {
	@Autowired
	public JsgIService jsgIService;
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/jsgList")
	public ModelAndView jsgList(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("testj/jsgList");
		
		return mav;
	}
	@RequestMapping(value="/jsgLists",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String jsgLists(
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		System.out.println("리스트:"+params);
		// 현재 페이지
		int page = Integer.parseInt(params.get("page"));
		
		// 총 게시글 수
		int cnt = jsgIService.getSCnt(params);

		// 페이징 정보 취득
		PagingBean pb = iPagingService.getPagingBean(page, cnt);
		
		// 게시글 시작번호, 종료 번호 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		// 목록 취득
		List<HashMap<String, String>> list = jsgIService.getSList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/jsgWrite")
	public ModelAndView testSWrite(ModelAndView mav) {
		
		mav.setViewName("testj/jsgWrite");
		
		return mav;
	}
	
	@RequestMapping(value="/jsgWrites",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String jsgWrites(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		System.out.println("등록:"+params);
		try {
			int cnt = jsgIService.addS(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
				
			} else {
				modelMap.put("msg", "failed");
			}
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value="/jsgDetail")
	public ModelAndView jsgDetail(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		if(params.get("sNo") != null) {
			HashMap<String, String> data
						= jsgIService.getS(params);
			
		mav.addObject("data", data);
		
		mav.setViewName("testj/jsgDetail");
		} else {
			mav.setViewName("redirect:jsgList");
		}
		return mav;
	}
	
	
	
	@RequestMapping(value="/jsgUpdate")
	public ModelAndView jsgUpdate(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		if(params.get("sNo") != null) {
			HashMap<String, String> data
			= jsgIService.getS(params);
			
			mav.addObject("data", data);
			
			mav.setViewName("testj/jsgUpdate");
		} else {
			mav.setViewName("redirect:jsgUpdate");
		}
		return mav;
	}
	@RequestMapping(value="/jsgUpdates",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String jsgUpdates(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = jsgIService.updateS(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
				
			} else {
				modelMap.put("msg", "failed");
			}
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		} //addObjec가 modelMap으로 바뀐 거 빼고는 똑같다
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/jsgDeletes",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String jsgDeletes(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = jsgIService.deleteS(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
				
			} else {
				modelMap.put("msg", "failed");
			}
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		}
		return mapper.writeValueAsString(modelMap);
	}
}
