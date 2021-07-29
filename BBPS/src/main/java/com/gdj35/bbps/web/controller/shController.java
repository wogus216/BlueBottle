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
import com.gdj35.bbps.web.service.IshService;

@Controller
public class shController {

	@Autowired
	public IshService ishService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/Ord_Mang")
	public ModelAndView Ord_Mang(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		int page=1;
		
		if(params.get("page") != null) {
			  page=Integer.parseInt(params.get("page"));
		}
		List<HashMap<String,String>> brchList = ishService.getBrchList();
		
		mav.addObject("brchList",brchList);   
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
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt,10,5);
		
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
		HashMap<String,String> data = ishService.getODtl(params);
		List<HashMap<String,String>> list = ishService.getODtlList(params);
		HashMap<String,String> data2 = ishService.getRDtl(params);
	    List<HashMap<String,String>> list2 = ishService.getRDtlList(params);

		mav.addObject("list",list);
		mav.addObject("data",data);
		mav.addObject("list2",list2);
		mav.addObject("data2",data2);
		mav.setViewName("sh/Ord_Mang_dtl");
		return mav;
	   }
	@RequestMapping(value = "/ord_history",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ord_history(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> OrdHistoryList = ishService.getOWholeList(params);
		modelMap.put("OrdHistoryList", OrdHistoryList);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/ord_apv",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ord_apv(@RequestParam HashMap<String,String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		try {
				int cnt = ishService.apvOrd(params);
					
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
	@RequestMapping(value = "/ord_non_apv",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ord_non_apv(@RequestParam HashMap<String,String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		try {
				int cnt = ishService.nonApvOrd(params);
					
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
	@RequestMapping(value = "/ref_apv",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ref_apv(@RequestParam HashMap<String,String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		try {
				int cnt = ishService.apvRef(params);
					
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
	@RequestMapping(value = "/ref_non_apv",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ref_non_apv(@RequestParam HashMap<String,String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		try {
				int cnt = ishService.nonApvRef(params);
					
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
	@RequestMapping(value = "/ord_send",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ord_send(@RequestParam ArrayList<String> expDate, @RequestParam ArrayList<String> oNo, @RequestParam ArrayList<String> iNo, @RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String,Object> insertMap = new HashMap<String, Object>();
		
		try {
	         for(int i = 0; i < expDate.size(); i++) {
	            insertMap.put("expDate", expDate.get(i));
	            insertMap.put("oNo", oNo.get(i));
	            insertMap.put("iNo", iNo.get(i));
	            
	            int cnt = ishService.sendO(params);
	            int cnt2 = ishService.sendExp(insertMap);
	            
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
	@RequestMapping(value = "/B_Ord_List")
	public ModelAndView B_Ord_List(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		int page=1;
		
		if(params.get("page") != null) {
			  page=Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("sh/B_Ord_List");
		return mav;   
	}
	@RequestMapping(value = "/B_Ord_Lists",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String B_Ord_Lists(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt  = ishService.getBOCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt,10,5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String,String>> list = ishService.getBOList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/B_Ord_dtl")
	public ModelAndView B_Ord_dtl(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		HashMap<String,String> data = ishService.getBODtl(params);
		List<HashMap<String,String>> list = ishService.getBODtlList(params);
		HashMap<String,String> data2 = ishService.getBRDtl(params);
		List<HashMap<String,String>> list2 = ishService.getBRDtlList(params);
		mav.addObject("list",list);
		mav.addObject("data",data);
		mav.addObject("list2",list2);
		mav.addObject("data2",data2);
		
		mav.setViewName("sh/B_Ord_dtl");
		return mav;
	   }
	@RequestMapping(value = "/ord_cnl",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ord_cnl(@RequestParam HashMap<String,String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		try {
				int cnt = ishService.cnlO(params);
					
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
	@RequestMapping(value = "/ref_cnl",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ref_cnl(@RequestParam HashMap<String,String> params) throws Throwable{
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
			
		try {
				int cnt = ishService.cnlRef(params);
					
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
	@RequestMapping(value="/B_Ref")
	public ModelAndView B_Ref(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		mav.setViewName("sh/B_Ref");
		return mav;
	   }
	@RequestMapping(value = "/RefItem",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String RefItem(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> list = ishService.getRefItem(params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/B_Ord_Req")
	public ModelAndView B_Ord_Req(
			@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		List<HashMap<String,String>> catelist = ishService.getCateList();
		
		mav.addObject("catelist",catelist);
		mav.setViewName("sh/B_Ord_Req");
		return mav;   
	}
	@RequestMapping(value = "/Ord_Item_List",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Ord_Item_List(@RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> list = ishService.getOrdItem(params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/ref",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ref(@RequestParam ArrayList<String> ref_cnt, @RequestParam ArrayList<String> rsn_note, @RequestParam ArrayList<String> iNo, @RequestParam ArrayList<String> oNo, @RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String,Object> insertMap = new HashMap<String, Object>();
		
		try {
			int cnt = ishService.writeRef(params);
			
			if(cnt > 0) {
				modelMap.put("msg", "success");
			} else {
				modelMap.put("msg", "failed");
			}    
			
	         for(int i = 0; i < ref_cnt.size(); i++) {
	            insertMap.put("ref_cnt", ref_cnt.get(i));
	            insertMap.put("rsn_note", rsn_note.get(i));
	            insertMap.put("iNo", iNo.get(i));
	            insertMap.put("oNo", oNo.get(i));
				
	            int cnt2 = ishService.writeRefItem(insertMap);
	            
	            if(cnt2 > 0) {
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
	@RequestMapping(value = "/ord",method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ord(@RequestParam ArrayList<String> iNo, @RequestParam ArrayList<String> ord_cnt, @RequestParam ArrayList<String> price, @RequestParam HashMap<String,String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		HashMap<String,Object> insertMap = new HashMap<String, Object>();
		
		try {
	         int cnt = ishService.writeOrd(params);
				
				if(cnt > 0) {
					modelMap.put("msg", "success");
				} else {
					modelMap.put("msg", "failed");
				}    
				for(int i = 0; i < iNo.size(); i++) {
		            insertMap.put("iNo", iNo.get(i));
		            insertMap.put("ord_cnt", ord_cnt.get(i));
		            insertMap.put("price", price.get(i));
					 
					 
					 int cnt2 = ishService.writeOrdItem(insertMap);
					 
					 if(cnt2 > 0) { 
						 modelMap.put("msg", "success"); 
					 } else {
					 modelMap.put("msg", "failed"); 
					 }
		         }//for-end
	
	      } catch (Throwable e) {
	         e.printStackTrace();
	            
	         modelMap.put("msg", "error");
	      }
			
		return mapper.writeValueAsString(modelMap);
	}
}
