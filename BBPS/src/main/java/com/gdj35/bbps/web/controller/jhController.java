package com.gdj35.bbps.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj35.bbps.util.Utils;
import com.gdj35.bbps.web.service.IjhService;

@Controller
public class jhController {
	
	@Autowired
	public IjhService ijhService;
	


//로그인 페이지
	
// 로그인 다 구현하면 아이디에 맞게 링크 걸어 놓기
	@RequestMapping(value="/logIn")
	public ModelAndView logIn(
			ModelAndView mav) {
		
		mav.setViewName("jh/logIn");
		
		return mav;
		
	}
	//본사 로그인
	@RequestMapping(value="/H_Login")
	public ModelAndView hq_Login(HttpSession session, ModelAndView mav) {
			if(session.getAttribute("sUSERNo") != null	) { //로그인상태
				mav.setViewName("redirect:hq_Menu");
			} else { // 비 로그인 상태
				mav.setViewName("jh/H_Login");
			}
			
			return mav;
	}
	
		
	@RequestMapping(value="/H_Logins",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String H_Logins(
		HttpSession session,
		@RequestParam HashMap<String, String> params) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	//암호화
	//params.put("hPw", Utils.encryptAES128(params.get("hPw")));
	
	//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("hPw")));
	
	
	HashMap<String, String> data = ijhService.getHQ(params);
	
	System.out.println("로그인data :"+ data);
	if(data != null) { //사용자 정보가 있음
		session.setAttribute("sUSERNo", data.get("USER_NO"));
		session.setAttribute("sAUTHNo", data.get("AUTH_NO"));
		session.setAttribute("sDEPNo", data.get("DEP_NO"));
		session.setAttribute("sId", data.get("ID"));
		System.out.println(session.getAttribute("sUSERNo"));
		
		modelMap.put("resMsg", "success");
	} else { // 사용자 정보가 없음
		modelMap.put("resMsg", "failed");
		
	}
	return mapper.writeValueAsString(modelMap);
	
	}
	
	//로그아웃
	@RequestMapping(value="/H_LogOut")
	public ModelAndView H_LogOut(HttpSession session,
			ModelAndView mav) {
		System.out.println(session.getAttribute("sDEPNo"));
		session.invalidate();
		
		mav.setViewName("redirect:H_Login");
		return mav;
	}
	//지점 로그인
	
	@RequestMapping(value="/B_Login")
	public ModelAndView b_Login(HttpSession session, ModelAndView mav) {
			if(session.getAttribute("sBRCHNo") != null	) { //로그인상태
				mav.setViewName("redirect:B_Menu");
			} else { // 비 로그인 상태
				mav.setViewName("jh/B_Login");
			}
			
			return mav;
	}
	
	@RequestMapping(value="/B_Logins",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String b_Logins(
		HttpSession session,
		@RequestParam HashMap<String, String> params) throws Throwable{
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	//암호화
	//params.put("hPw", Utils.encryptAES128(params.get("hPw")));
	
	//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("hPw")));
	
	
	HashMap<String, String> data = ijhService.getB(params);
	
	System.out.println("data :"+ data);
	if(data != null) { //사용자 정보가 있음
		session.setAttribute("sBRCHNo", data.get("BRCH_NO"));
		session.setAttribute("sId", data.get("ID"));
		session.setAttribute("sBRCHNm", data.get("BRCH_NAME"));
		System.out.println(session.getAttribute("sBRCHNm"));
		
		modelMap.put("resMsg", "success");
	} else { // 사용자 정보가 없음
		modelMap.put("resMsg", "failed");
		
	}
	return mapper.writeValueAsString(modelMap);
	
	}
	
	//로그아웃
		@RequestMapping(value="/B_LogOut")
		public ModelAndView b_LogOut(HttpSession session,
				ModelAndView mav) {
			System.out.println(session.getAttribute("sBRCHNm"));
			session.invalidate();
			
			
			mav.setViewName("redirect:B_Logins");
			return mav;
		}
		
	//포스 로그인
		
		@RequestMapping(value="/Pos_Login")
		public ModelAndView pos_Login(HttpSession session, ModelAndView mav) {
				if(session.getAttribute("sBRCHNo") != null	) { //로그인상태
					mav.setViewName("redirect:Pos");
				} else { // 비 로그인 상태
					mav.setViewName("jh/Pos_Login");
				}
				
				return mav;
		}
		@RequestMapping(value="/pos_Logins",
				method = RequestMethod.POST,
				produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String pos_Logins(
			HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		//암호화
		//params.put("hPw", Utils.encryptAES128(params.get("hPw")));
		
		//System.out.println("비밀번호:"+ Utils.decryptAES128(params.get("hPw")));
		
		
		HashMap<String, String> data = ijhService.getB(params);
		
		System.out.println("data :"+ data);
		if(data != null) { //사용자 정보가 있음
			session.setAttribute("sBRCHNo", data.get("BRCH_NO"));
			session.setAttribute("sId", data.get("ID"));
			session.setAttribute("sBRCHNm", data.get("BRCH_NAME"));
			System.out.println(session.getAttribute("sBRCHNm"));
			
			modelMap.put("resMsg", "success");
		} else { // 사용자 정보가 없음
			modelMap.put("resMsg", "failed");
			
		}
		return mapper.writeValueAsString(modelMap);
		
		}
		
	//로그아웃
		@RequestMapping(value="/Pos_LogOut")
		public ModelAndView pos_LogOut(HttpSession session,
				ModelAndView mav) {
			System.out.println(session.getAttribute("sBRCHNm"));
			session.invalidate();
				
				
			mav.setViewName("redirect:Pos_Login");
			return mav;
		}	
			
		//본사메뉴
		@RequestMapping(value="/H_Menu")
	
		public ModelAndView H_Menu(
				HttpSession session,
				@RequestParam HashMap<String, String> params,
				ModelAndView mav) {
			System.out.println("H_Menu파람:"+params);
			System.out.println("본사유저번호:"+session.getAttribute("sUSERNo"));
			mav.setViewName("jh/H_Menu");
				
			return mav;
		}
		
		@RequestMapping(value="/H_Menus",
		method = RequestMethod.POST,
		produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String H_Menus(
	HttpSession session,
	@RequestParam HashMap<String, String> params) throws Throwable{
			
	System.out.println("H_Menus파람:"+params);
	ObjectMapper mapper = new ObjectMapper();
	
	Map<String, Object> modelMap = new HashMap<String, Object>();
	params.put("hUserNo", String.valueOf(session.getAttribute("sUSERNo")));
	params.put("hDt", "1");
	
	System.out.println("hq_menus에서본사유저번호:"+session.getAttribute("sUSERNo"));
	
	// 메뉴 취득
	List<HashMap<String, String>>menu= ijhService.getHMenu(params);
	
	modelMap.put("menu", menu);
	
	System.out.println("menu"+menu);
	System.out.println("모델맵"+modelMap);
	return mapper.writeValueAsString(modelMap);
	}
			
	@RequestMapping(value="/B_Menu")
				
		public ModelAndView b_Menu(
					ModelAndView mav) {
				
			mav.setViewName("jh/B_Menu");
					
				return mav;
					
		}
	//포스
	@RequestMapping(value="/pos")
			
	public ModelAndView pos(
				ModelAndView mav) {
			
		mav.setViewName("jh/pos");
				
			return mav;
				
			}
		//POS메뉴관리
	@RequestMapping(value="/Menu_List")
	
	public ModelAndView Menu_List(
			ModelAndView mav) {
			
		mav.setViewName("jh/Menu_List");
			
		return mav;
			
		}
			
		
}
