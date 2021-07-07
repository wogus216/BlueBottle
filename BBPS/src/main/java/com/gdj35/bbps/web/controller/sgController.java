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
import com.gdj35.bbps.web.service.IsgService;

@Controller
public class sgController {
	@Autowired
	public IsgService isgService;
	@Autowired
	public IPagingService ipagingService;
	
	@RequestMapping(value="/Notice")
	public ModelAndView Notice(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("sg/Notice");
		
		return mav;
	}
	@RequestMapping(value="/Notices",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Notices(
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		// 현재 페이지
		
		int page = Integer.parseInt(params.get("page"));
		
		// 총 게시글 수
		int cnt = isgService.getNCnt(params);

		// 페이징 정보 취득
		PagingBean pb = ipagingService.getPagingBean(page, cnt);
		
		// 게시글 시작번호, 종료 번호 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		// 목록 취득
		List<HashMap<String, String>> list = isgService.getNList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		System.out.println("list"+list);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value="/NoticeWrite")
	public ModelAndView NoticeWrite(ModelAndView mav) { //db붙을 거 아니라 throws~~필요없음
		
		mav.setViewName("sg/NoticeWrite");
		
		return mav;
	}
	
	@RequestMapping(value="/NoticeWrites",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String NoticeWrites(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = isgService.addN(params);
			
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
	

}
