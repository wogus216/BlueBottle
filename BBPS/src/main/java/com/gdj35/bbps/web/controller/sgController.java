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
			ModelAndView mav) throws Throwable {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String,String>> catelist = isgService.searchDateList();
		
		mav.addObject("catelist",catelist);
		
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
		PagingBean pb = ipagingService.getPagingBean(page, cnt, 10, 5);
		
		// 게시글 시작번호, 종료 번호 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		// 목록 취득
		List<HashMap<String, String>> list = isgService.getNList(params);
		
		int result = list.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
		
		modelMap.put("list", list);
		modelMap.put("result", result);
		modelMap.put("pb", pb);
		
		System.out.println("list를 보자"+list);
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value="/Notice_Write")
	public ModelAndView Notice_Write(ModelAndView mav) { //db붙을 거 아니라 throws~~필요없음
		
		mav.setViewName("sg/Notice_Write");
		
		return mav;
	}
	
	@RequestMapping(value="/Notice_Writes",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Notice_Writes(
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
		System.out.println("params"+params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	@RequestMapping(value="/Notice_Detail")
	public ModelAndView Notice_Detail(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		HashMap<String, String> data = isgService.getN(params);
		
		mav.addObject("data", data);
		System.out.println("상세보기 data"+data);
		mav.setViewName("sg/Notice_Detail");
		
		return mav;
	}
	
	
	@RequestMapping(value="Notice_Update")
	public ModelAndView Notice_Update(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		HashMap<String, String> data = isgService.getN(params);
		
		mav.addObject("data", data);
		
		mav.setViewName("sg/Notice_Update");
		
		return mav;
	}
	
	@RequestMapping(value="/Notice_Updates",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Notice_Updates(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = isgService.updateN(params);
			
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
	
	@RequestMapping(value="/Notice_Deletes",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Notice_Deletes(
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = isgService.deleteN(params);
			
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
	
	
	
	
	
	@RequestMapping(value="/User_List")
	public ModelAndView User_List(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("sg/User_List");
		
		return mav;
	}
	@RequestMapping(value="/User_Lists",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String User_Lists(
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		// 현재 페이지
		
		int page = Integer.parseInt(params.get("page"));
		
		// 총 게시글 수
		int cnt = isgService.getUCnt(params);

		// 페이징 정보 취득
		PagingBean pb = ipagingService.getPagingBean(page, cnt);
		
		// 게시글 시작번호, 종료 번호 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		// 목록 취득
		List<HashMap<String, String>> list = isgService.getUList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		System.out.println("list"+list);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/User_Select")
	public ModelAndView User_Select(
			ModelAndView mav)  {
		
		mav.setViewName("sg/User_Select");
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/User_Add_Hq")
	public ModelAndView User_Add_Hq(ModelAndView mav) { //db붙을 거 아니라 throws~~필요없음
		
		mav.setViewName("sg/User_Add_Hq");
		
		return mav;
	}
	
	@RequestMapping(value="/User_Add_Hqs",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String User_Add_Hqs(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = isgService.addU(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
				
			} else {
				modelMap.put("msg", "failed");
			}
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		} //addObjec가 modelMap으로 바뀐 거 빼고는 똑같다
		System.out.println("params"+params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	@RequestMapping(value="/User_Add_Brch")
	public ModelAndView User_Add_Brch(ModelAndView mav) { //db붙을 거 아니라 throws~~필요없음
		
		mav.setViewName("sg/User_Add_Brch");
		
		return mav;
	}
	
	@RequestMapping(value="/User_Add_Brchs",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String User_Add_Brchs(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = isgService.addB(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
				
			} else {
				modelMap.put("msg", "failed");
			}
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("msg", "error");
		} //addObjec가 modelMap으로 바뀐 거 빼고는 똑같다
		System.out.println("params"+params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	@RequestMapping(value="/User_Detail_Hq")
	public ModelAndView User_Detail_Hq(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		HashMap<String, String> data = isgService.getH(params);
		
		mav.addObject("data", data);
		System.out.println(data + " 본사 상세보기 data가져옴");
		mav.setViewName("sg/User_Detail_Hq");
		
		return mav;
	}
	
	
	@RequestMapping(value="/User_Detail_Brch")
	public ModelAndView User_Detail_Brch(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		HashMap<String, String> data = isgService.getB(params);
		
		mav.addObject("data", data);
		System.out.println(data + " 지점 상세보기 data가져옴");
		mav.setViewName("sg/User_Detail_Brch");
		
		return mav;
	}
	
	
	
	@RequestMapping(value="/User_Update_Hq")
	public ModelAndView User_Update_Hq(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		HashMap<String, String> data = isgService.getH(params);
		
		mav.addObject("data", data);

		mav.setViewName("sg/User_Update_Hq");
		
		return mav;
	}
	@RequestMapping(value="/User_Update_Hqs",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String User_Update_Hqs(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = isgService.updateH(params);
			
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
	
	@RequestMapping(value="/User_Delete_Hqs",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String User_Delete_Hqs(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = isgService.deleteH(params);
			
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
	
	
	
	
	@RequestMapping(value="/User_Update_Brch")
	public ModelAndView User_Update_Brch(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		HashMap<String, String> data = isgService.getB(params);
		
		mav.addObject("data", data);
		System.out.println(data+"수정페이지data받아옴");
		mav.setViewName("sg/User_Update_Brch");
		
		return mav;
	}
	@RequestMapping(value="/User_Update_Brchs",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String User_Update_Brchs(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = isgService.updateB(params);
			
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
	
	@RequestMapping(value="/User_Delete_Brchs",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String User_Delete_Brchs(
			@RequestParam HashMap<String,String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); 
		
		try {
			int cnt = isgService.deleteB(params);
			
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
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/B_Notice")
	public ModelAndView B_Notice(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String,String>> catelist = isgService.searchDateList();
		
		mav.addObject("catelist",catelist);
		
		mav.addObject("page", page);
		mav.setViewName("sg/B_Notice");
		
		return mav;
	}
	@RequestMapping(value="/B_Notices",
			method=RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String B_Notices(
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		
		// 현재 페이지
		
		int page = Integer.parseInt(params.get("page"));
		
		// 총 게시글 수
		int cnt = isgService.getNCnt(params);

		// 페이징 정보 취득
		PagingBean pb = ipagingService.getPagingBean(page, cnt, 10, 5);
		
		// 게시글 시작번호, 종료 번호 할당
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		// 목록 취득
		List<HashMap<String, String>> list = isgService.getNList(params);
		
		int result = list.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
		
		modelMap.put("list", list);
		modelMap.put("result", result);
		modelMap.put("pb", pb);
		
		System.out.println("list를 보자"+list);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/B_Notice_Detail")
	public ModelAndView B_Notice_Detail(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		HashMap<String, String> data = isgService.getN(params);
		
		mav.addObject("data", data);
		System.out.println("상세보기 data"+data);
		mav.setViewName("sg/B_Notice_Detail");
		
		return mav;
	}
}
