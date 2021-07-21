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
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
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
		
		PagingBean pb = iPagingServcie.getPagingBean(page, cnt,10,5);
		
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
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
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
				
				System.out.println("이것은 인서트맵" + insertMap);
				
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
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
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
		
	//재고 상세(품목명 선택 시 노출)
	@RequestMapping(value = "/Stock_Dtl")
	public ModelAndView HSDetail(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
		
		mav.setViewName("sb/Stock_Dtl");
		
		return mav;
	}
	
	//재고상세 내 유통기한 별 재고리스트
	@RequestMapping(value = "/Item_Stock_List",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HSStockList(@RequestParam HashMap<String,String> params) throws Throwable{
					
			ObjectMapper mapper = new ObjectMapper();
			Map<String,Object> modelMap = new HashMap<String,Object>();
			
			List<HashMap<String,String>> stocklist = isbservice.getSDetail(params); // 유통기한 별 재고 상세
			
			int result = stocklist.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
					
			modelMap.put("stocklist",stocklist);
			modelMap.put("result",result);
			
			return mapper.writeValueAsString(modelMap);
		}
	
	//재고상세 내 출고재고 리스트 그리기
	@RequestMapping(value = "/Item_Rel_List",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HSRelList(@RequestParam HashMap<String,String> params) throws Throwable{
				
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> Rellist = isbservice.getSRelList(params);
				
		int result = Rellist.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
		
			modelMap.put("Rellist",Rellist);
			modelMap.put("result",result);
			
			return mapper.writeValueAsString(modelMap);
		}
	
	
	//재고상세 내 폐기 리스트 그리기(폐기목록x) >> 재고상세 내 폐기버튼 클릭 시 변경되는 폐기 가능 리스트 그리기
	@RequestMapping(value = "/Item_Stock_Discard_List",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HSDiscardList(@RequestParam HashMap<String,String> params) throws Throwable{
					
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
				
		List<HashMap<String,String>> stockdiscardlist = isbservice.getSDetail(params); // 유통기한 별 재고 상세
					
			modelMap.put("stockdiscardlist",stockdiscardlist);
				
			return mapper.writeValueAsString(modelMap);
		}
	
	//재고상세 내 폐기 리스트 그리기(폐기목록!!!!)
	@RequestMapping(value = "/Item_Discard_List",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HDiscardList(@RequestParam HashMap<String,String> params) throws Throwable{
						
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> discardlist = isbservice.getSDList(params); // 유통기한 별 재고 상세
		
		int result = discardlist.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
		
			modelMap.put("discardlist",discardlist);
			modelMap.put("result",result);
					
			return mapper.writeValueAsString(modelMap);
		}
	
	//본사재고 추가
	@RequestMapping(value = "/Stock_Add")
	public ModelAndView HSAdd(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
		mav.setViewName("sb/Stock_Add");
		
		return mav;
	}
	
	//본사 재고 추가  행 추가 시 카테고리 계속 불러오기
	@RequestMapping(value = "/Stock_Addcate", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HSAddcate() throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		modelMap.put("catelist", catelist);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//본사재고추가(기능)
	@RequestMapping(value = "/Stock_Adds", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HSAdds(@RequestParam ArrayList<String> itemNo,@RequestParam ArrayList<String> stockCnt,@RequestParam ArrayList<String> stockExpiryDate) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		

		HashMap<String,Object> insertMap = new HashMap<String, Object>();
		
		try {
			
			for(int i = 0; i < itemNo.size(); i++) {
				
				insertMap.put("itemNo", itemNo.get(i));
				insertMap.put("stockCnt", stockCnt.get(i));
				insertMap.put("stockExpiryDate", stockExpiryDate.get(i));
				
				int cnt = isbservice.AddStock(insertMap);
				
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
	
	//본사 재고 폐기
	@RequestMapping(value = "/Stock_Discards", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HSDiscards(@RequestParam ArrayList<String> itemNo,@RequestParam ArrayList<String> discardCnt,@RequestParam ArrayList<String> discardNote,@RequestParam ArrayList<String> expDate) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		HashMap<String,Object> insertMap = new HashMap<String, Object>();
		
		try {
			
			for(int i = 0; i < itemNo.size(); i++) {
				
				if(discardCnt.get(i).equals("0")) {
					
				}else {
				
				insertMap.put("itemNo", itemNo.get(i));
				insertMap.put("discardCnt", discardCnt.get(i));
				insertMap.put("discardNote", discardNote.get(i));
				insertMap.put("expDate", expDate.get(i));
				
				int cnt = isbservice.DiscardStock(insertMap);
				
				if(cnt > 0) {
					modelMap.put("msg", "success");
				} else {
					modelMap.put("msg", "failed");
					}
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
			
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	//본사 재고입고이력 리스트 그리기
	@RequestMapping(value = "/Stock_Stor_History", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HSHistory(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> StorHistorylist = isbservice.getHSHList(params);
		
		modelMap.put("StorHistorylist",StorHistorylist);
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	
	//본사 폐기 목록 조회
	@RequestMapping(value = "/Stock_Discard_List")
	public ModelAndView HSDList (@RequestParam HashMap<String,String> params,ModelAndView mav) throws Throwable{
			
		int page = 1;
			
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
		
		mav.addObject("page",page);
		mav.setViewName("sb/Stock_Discard_List");
			
		return mav;
	}
	
	//본사폐기리스트 그리기 (페이징과 같이)
	@RequestMapping(value = "/Stock_Discard_Lists",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String HSDLists(@RequestParam HashMap<String,String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		int page = Integer.parseInt(params.get("page"));
			
		//게시글 수 가져오겠다
		int cnt  = isbservice.getHSDCnt(params);
			
		PagingBean pb = iPagingServcie.getPagingBean(page, cnt,10,5);
			
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
			
		List<HashMap<String,String>> list = isbservice.getHSDList(params);
		
		int result = list.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
		
		modelMap.put("list", list);
		modelMap.put("result", result);
		modelMap.put("pb", pb);
			
		return mapper.writeValueAsString(modelMap);
	}
	
/************여기부터 지점*********************************************************************************************************************/	
	
	//지점 재고 목록 조회
	@RequestMapping(value = "/B_Stock_List")
	public ModelAndView BSList (@RequestParam HashMap<String,String> params,ModelAndView mav) throws Throwable{
				
		int page = 1;
				
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
		mav.addObject("page",page);
		mav.setViewName("sb/B_Stock_List");
				
		return mav;
	}
	
	//지점재고리스트 그리기 (페이징과 같이)
	@RequestMapping(value = "/B_Stock_Lists",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BSLists(@RequestParam HashMap<String,String> params) throws Throwable{
				
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
				
		int page = Integer.parseInt(params.get("page"));
				
		//게시글 수 가져오겠다
		int cnt  = isbservice.getBSLCnt(params);
				
		PagingBean pb = iPagingServcie.getPagingBean(page, cnt,10,5);
				
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
				
		List<HashMap<String,String>> list = isbservice.getBSList(params);
		
			
		int result = list.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
			
		modelMap.put("list", list);
		modelMap.put("result", result);
		modelMap.put("pb", pb);
				
		return mapper.writeValueAsString(modelMap);
	}
	
	//지점 재고 상세(재고 리스트 내 tr 선택 시 노출)
	@RequestMapping(value = "/B_Stock_Dtl")
	public ModelAndView BSDetail(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
						
		mav.setViewName("sb/B_Stock_Dtl");
					
		return mav;
	}	
	
	//지점 재고상세 내 유통기한 별 재고리스트
	@RequestMapping(value = "/B_Stock_ExpList",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BStockExpList(@RequestParam HashMap<String,String> params) throws Throwable{
						
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
				
		List<HashMap<String,String>> stocklist = isbservice.getBStockExpList(params); // 유통기한 별 재고 상세
				
		int result = stocklist.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
						
		modelMap.put("stocklist",stocklist);
		modelMap.put("result",result);
				
		return mapper.writeValueAsString(modelMap);
	}
	
	//지점 재고상세 내  재고 입고 리스트
	@RequestMapping(value = "/B_Stock_StorList",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BStockStorList(@RequestParam HashMap<String,String> params) throws Throwable{
									
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> storlist = isbservice.getBStockStorList(params);
		  
		int result = storlist.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
		  
		modelMap.put("storlist",storlist); 
		modelMap.put("result",result);
		 
						
		return mapper.writeValueAsString(modelMap);
	}
	
	//지점 재고상세 내  재고 사용 리스트
	@RequestMapping(value = "/B_Stock_UseList",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BStockUseList(@RequestParam HashMap<String,String> params) throws Throwable{
							
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
					
		List<HashMap<String,String>> uselist = isbservice.getBStockUseList(params); // 유통기한 별 재고 상세
					
		int result = uselist.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
							
		modelMap.put("uselist",uselist);
		modelMap.put("result",result);
					
		return mapper.writeValueAsString(modelMap);
	}
	
	//지점 재고상세 내  재고 폐기 리스트
	@RequestMapping(value = "/B_Stock_DiscardList",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BStockDiscardList(@RequestParam HashMap<String,String> params) throws Throwable{
								
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
						
		List<HashMap<String,String>> discardlist = isbservice.getBStockDiscardList(params); // 유통기한 별 재고 상세
						
		int result = discardlist.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
								
		modelMap.put("discardlist",discardlist);
		modelMap.put("result",result);
						
		return mapper.writeValueAsString(modelMap);
	}
	
	//지점 재고상세 내  재고 폐기기능을 할 리스트 그리기
	@RequestMapping(value = "/B_Stock_Discard",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BSDiscard(@RequestParam HashMap<String,String> params) throws Throwable{
										
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		List<HashMap<String,String>> stockdiscardlist = isbservice.getBStockExpList(params); //유통기한별 재고를 그리기 위해 같은 쿼리 사용
			  
		int result = stockdiscardlist.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
			  
		modelMap.put("stockdiscardlist",stockdiscardlist); 
		modelMap.put("result",result);
			 
							
		return mapper.writeValueAsString(modelMap);
	}
	

	//지점 재고 폐기
	@RequestMapping(value = "/B_Stock_Discards", method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BSDiscards (@RequestParam ArrayList<String> itemNo,@RequestParam ArrayList<String> discardCnt,@RequestParam ArrayList<String> discardNote,@RequestParam ArrayList<String> expDate) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		HashMap<String,Object> insertMap = new HashMap<String, Object>();
		
		try {
			
			for(int i = 0; i < itemNo.size(); i++) {
				
				if(discardCnt.get(i).equals("0")) {
					
				}else {
				
				insertMap.put("itemNo", itemNo.get(i));
				insertMap.put("discardCnt", discardCnt.get(i));
				insertMap.put("discardNote", discardNote.get(i));
				insertMap.put("expDate", expDate.get(i));
				
				int cnt = isbservice.BDiscardStock(insertMap);
				
				if(cnt > 0) {
					modelMap.put("msg", "success");
				} else {
					modelMap.put("msg", "failed");
					}
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
			
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
		
	}
	
	
	
	//지점안전재고수정 기능
	@RequestMapping(value = "/B_Safe_Stock_edit",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BSSEdit(@RequestParam HashMap<String,String> params) throws Throwable{
						
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		try {
				int cnt = isbservice.BSSEdit(params);
				
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
	
	
	//지점재고 수정
	@RequestMapping(value = "/B_Stock_Edit")
	public ModelAndView BSEList(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
		mav.setViewName("sb/B_Stock_Edit");
			
		return mav;
	}
	
	//지점재고수정리스트 그리기
	@RequestMapping(value = "/B_Stock_edit_Lists",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BSELists(@RequestParam HashMap<String,String> params) throws Throwable{
					
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
					
					
		List<HashMap<String,String>> list = isbservice.getBSEList(params);
				
		int result = list.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
				
		modelMap.put("list", list);
		modelMap.put("result", result);
					
		return mapper.writeValueAsString(modelMap);
	}
	
	//지점 재고 수정 기능
	@RequestMapping(value = "/B_Stock_edit",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BSEdit(@RequestParam ArrayList<String> itemNo,@RequestParam ArrayList<String> editcurCnt,@RequestParam ArrayList<String> chkcurCnt,@RequestParam ArrayList<String> expDate) throws Throwable{
				//editcurCnt : 수정원하는 재고 수 	chkcurCnt : 수정 전 재고 수 (두 값의 차이를 보고 변동이 있는 항목만 쿼리가 진행되도록처리)
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		HashMap<String,Object> insertMap = new HashMap<String, Object>();
		
		try {
			
			for(int i = 0; i < itemNo.size(); i++) {
				
				if(chkcurCnt.get(i).equals(editcurCnt.get(i))) {
					//수정전 재고 수와 변경원하는 재고 수가 동일한 경우 아무 작업도 진행하지 않음
				}else {
				
				insertMap.put("itemNo", itemNo.get(i));
				insertMap.put("editcurCnt", editcurCnt.get(i));
				insertMap.put("chkcurCnt", chkcurCnt.get(i)); //재고 수 받을 때 수정 전 재고에서 수정 후 재고를 뺀 값을 인서트 할 것임
				insertMap.put("expDate", expDate.get(i));
				
				int cnt = isbservice.EidtBStock(insertMap);
				//int cnt2 = isbservice 해야될거 간단히 적어두자면, 수정 시 사용insert 되고 안전재고 update 진행
				// 다만 해당 작업 시 유저번호를 가져와야함 << 쿼리에 로그인된 유저와 맞는지 조건 추가필요함(ord 조인 후 ord 테이블에서 brchno 찾으면됨
				
				if(cnt > 0) {
					modelMap.put("msg", "success");
				} else {
					modelMap.put("msg", "failed");
					}
				}
			}
		} catch (Throwable e) {
			e.printStackTrace();
			
			modelMap.put("msg", "error");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	//지점 재고 입고 리스트
	@RequestMapping(value = "/B_Stor_List")
	public ModelAndView BSSList(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
		
		mav.addObject("page",page);
		mav.setViewName("sb/B_Stor_List");
				
		return mav;
	}
	
	//지점 재고 입고 리스트 그리기
	@RequestMapping(value = "/B_Stor_Lists",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BSSLists(@RequestParam HashMap<String,String> params) throws Throwable{
						
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		//게시글 수 가져오겠다
		int cnt  = isbservice.getBSSCnt(params);
			
		PagingBean pb = iPagingServcie.getPagingBean(page, cnt,10,5);
			
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
						
		List<HashMap<String,String>> list = isbservice.getBSSList(params);
					
		int result = list.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
					
		modelMap.put("list", list);
		modelMap.put("result", result);
		modelMap.put("pb", pb);
						
		return mapper.writeValueAsString(modelMap);
	}
	
	
	//지점 재고 사용 리스트
	@RequestMapping(value = "/B_Use_List")
	public ModelAndView BUSList(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
			
		int page = 1;
			
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
			
		mav.addObject("page",page);
		mav.setViewName("sb/B_Use_List");
				
		return mav;
	}
		
	//지점 재고 사용 리스트 그리기
	@RequestMapping(value = "/B_Use_Lists",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BUSLists(@RequestParam HashMap<String,String> params) throws Throwable{
							
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		int page = Integer.parseInt(params.get("page"));
			
		//게시글 수 가져오겠다
		int cnt  = isbservice.getBSUCnt(params);
				
		PagingBean pb = iPagingServcie.getPagingBean(page, cnt,10,5);
				
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
							
		List<HashMap<String,String>> list = isbservice.getBSUList(params);
						
		int result = list.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
					
		modelMap.put("list", list);
		modelMap.put("result", result);
		modelMap.put("pb", pb);
						
		return mapper.writeValueAsString(modelMap);
	}
	
	
	//지점 재고 폐기 리스트
	@RequestMapping(value = "/B_Discard_List")
	public ModelAndView BDSList(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
				
		int page = 1;
				
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		List<HashMap<String,String>> catelist = isbservice.getCateList();
		
		mav.addObject("catelist",catelist);
		
		mav.addObject("page",page);
		mav.setViewName("sb/B_Discard_List");
					
		return mav;
	}
			
	//지점 재고 폐기 리스트 그리기
	@RequestMapping(value = "/B_Discard_Lists",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BDSLists(@RequestParam HashMap<String,String> params) throws Throwable{
								
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		int page = Integer.parseInt(params.get("page"));
				
		//게시글 수 가져오겠다
		int cnt  = isbservice.getBSDCnt(params);
					
		PagingBean pb = iPagingServcie.getPagingBean(page, cnt,10,5);
					
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
			
								
		List<HashMap<String,String>> list = isbservice.getBSDList(params);
							
		int result = list.size(); // 쿼리 수행 시 결과 행이 존재하는지 여부를 따질 변수
						
		modelMap.put("list", list);
		modelMap.put("result", result);
		modelMap.put("pb", pb);
							
		return mapper.writeValueAsString(modelMap);
	}
	
	//지점 입고이력 리스트 그리기 (버튼 클릭 시 나오는 팝업)
	@RequestMapping(value = "/B_Stock_Stor_History",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String BSSHLists(@RequestParam HashMap<String,String> params) throws Throwable{
								
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> StorHistorylist = isbservice.getBSHList(params);
		
		modelMap.put("StorHistorylist",StorHistorylist);
		
		return mapper.writeValueAsString(modelMap);
	}
}
