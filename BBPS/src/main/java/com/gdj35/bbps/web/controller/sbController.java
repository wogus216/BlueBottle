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
	
	//품목 상세조회 내 가격 변동 테이블 불러오기 (품목수정 페이지에도 노출)
	@RequestMapping(value = "/Item_Dtl_Price_History",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HPDetailPHis(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> pricehistorylist = isbservice.getPHList(params);
		
		modelMap.put("pricehistorylist", pricehistorylist);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//품목추가  (기능x 화면전환)
	@RequestMapping(value = "/Item_Add")
	public ModelAndView HPAdd (ModelAndView mav) throws Throwable{
			
		mav.setViewName("sb/Item_Add");
			
		return mav;
	}
	
	//품목추가 (기능)
	@RequestMapping(value = "/Item_Adds",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HPAdds(@RequestParam ArrayList<String> itemCate,@RequestParam ArrayList<String> itemName,@RequestParam ArrayList<String> itemPrice,@RequestParam ArrayList<String> itemMinOrdUnit,@RequestParam ArrayList<String> itemComProdFlag) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();

		HashMap<String,Object> insertMap = new HashMap<String, Object>();
		
		try {
			
			for(int i = 0; i < itemName.size(); i++) {
				insertMap.put("itemCate", itemCate.get(i));
				insertMap.put("itemName", itemName.get(i));
				insertMap.put("itemPrice", itemPrice.get(i));
				insertMap.put("itemMinOrdUnit", itemMinOrdUnit.get(i));
				insertMap.put("itemComProdFlag", itemComProdFlag.get(i));
				
			
				int cnt = isbservice.AddItem(insertMap);
				
				int cnt2 = isbservice.AddItemPrice(insertMap);
				
				if(cnt > 0 && cnt2 > 0) {
					modelMap.put("msg", "success");
				} else {
					modelMap.put("msg", "failed");
					}
				}
			
		} catch (Throwable e) {
			e.printStackTrace();
			
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//품목수정  (기능x 화면전환)
	@RequestMapping(value = "/Item_Edit")
	public ModelAndView HPEdit (@RequestParam HashMap<String,String> params,ModelAndView mav) throws Throwable{
			
		HashMap<String,String> data = isbservice.getPDetail(params);
			
		mav.addObject("data",data);
		mav.setViewName("sb/Item_Edit");
				
		return mav;
	}
	
	//품목수정 (기능)
	@RequestMapping(value = "/Item_Edits",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HPEidts(@RequestParam int OlditemPrice,@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		try {
				
				
				if(Integer.parseInt(params.get("itemPrice")) != OlditemPrice) { //가격 변동이 일어났을 때 가격 테이블 데이터 인서트
					
					int cnt = isbservice.EditItem(params);
					
					int cnt2 = isbservice.EditItemPrice(params);
					
					if(cnt > 0 && cnt2 > 0) {
						modelMap.put("msg", "success");
					} else {
						modelMap.put("msg", "failed");
					}
				} else { //가격 변동 없이 수정이 이루어진 경우
					
					int cnt = isbservice.EditItem(params);
					
					if(cnt > 0) {
						modelMap.put("msg", "success");
					} else {
						modelMap.put("msg", "failed");
					}
				}
			
		} catch (Throwable e) {
			e.printStackTrace();
			
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//품목삭제 (기능)
	@RequestMapping(value = "/Item_Del",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HPDel(@RequestParam HashMap<String,String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		try {
				int cnt = isbservice.DelItem(params);
					
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
		
	//재고 상세(품목 tr 선택 시 노출)
	@RequestMapping(value = "/Stock_Dtl")
	public ModelAndView HSDetail(ModelAndView mav) throws Throwable {
		
		mav.setViewName("sb/Stock_Dtl");
		
		return mav;
	}
}