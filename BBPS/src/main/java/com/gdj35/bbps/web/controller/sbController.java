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
import com.gdj35.bbps.web.service.IsbService;

@Controller
public class sbController {
	@Autowired
	public IsbService isbservice;
	
	@Autowired
	public IPagingService iPagingServcie;
	
	//첫 페이지 지정
	@RequestMapping(value = "/Item_List")
	public ModelAndView HPList (@RequestParam HashMap<String,String> params,ModelAndView mav) throws Throwable{
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page",page);
		mav.setViewName("sb/Item_List");
		
		return mav;
	}
	
	//리스트 그리기 (페이징과 같이)
	@RequestMapping(value = "/Item_Lists",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HPLists(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		//게시글 수 가져오겠다
		int cnt  = isbservice.getPCnt(params);
		
		PagingBean pb = iPagingServcie.getPagingBean(page, cnt);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String,String>> list = isbservice.getPList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//품목조회 상세보기
	@RequestMapping(value = "/Item_Dtl")
	public ModelAndView HPDetail (@RequestParam HashMap<String,String> params,ModelAndView mav) throws Throwable{
		
		HashMap<String,String> data = isbservice.getPDetail(params);
		
		mav.addObject("data",data);
		mav.setViewName("sb/Item_Dtl");
		
		return mav;
	}
}
