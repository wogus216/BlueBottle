package com.gdj35.bbps.web.controller;

import java.util.HashMap;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gdj35.bbps.web.service.IjhService;

@Controller
public class jhController {
	
	@Autowired
	public IjhService ijhService;
	
	@RequestMapping(value="/Menu")
	public ModelAndView Menu(ModelAndView mav) {
			
		mav.setViewName("jh/Menu");
		
		return mav;
}
	
	@RequestMapping(value="/b_Menu")
		
		public ModelAndView b_Menu(
				ModelAndView mav) {
			
			mav.setViewName("jh/b_Menu");
			
			return mav;
			
		}
	

//로그인 페이지
	@RequestMapping(value="/logIn")
	public ModelAndView logIn(HttpSession session, ModelAndView mav) {
			if(session.getAttribute("sUSERNo") != null	) { //로그인상태
				mav.setViewName("redirect:logIn");
			} else { // 비 로그인 상태
				mav.setViewName("jh/logIn");
			}
			
			return mav;
	}
	
	
	@RequestMapping(value="/hq_Login")
	public ModelAndView hq_Login(HttpSession session, ModelAndView mav) {
			if(session.getAttribute("sUSERNo") != null	) { //로그인상태
				mav.setViewName("redirect:hq_Menu");
			} else { // 비 로그인 상태
				mav.setViewName("jh/hq_Login");
			}
			
			return mav;
	}
	
	
		
	@RequestMapping(value="/hq_Logins")
	public ModelAndView hq_Logins(
			//스프링이 세션을 알아서 갖고온다.
			HttpSession session,
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
	
		HashMap<String, String> data
						= ijhService.getHQ(params);
		
		System.out.println("data값"+data);
		
		if(data != null) {
			//HttpSession session = req.getSession();
			session.setAttribute("sUSERNo", data.get("USER_NO"));
			session.setAttribute("sAUTHNo", data.get("AUTH_NO"));
			session.setAttribute("sDEPNo", data.get("DEP_NO"));
			System.out.println(session.getAttribute("DEP_NO"));
	
	
			mav.addObject("res", "success");
		} else {
			mav.addObject("res", "failed");
		}
		mav.setViewName("jh/hq_Logins");
	
		return mav;
	
	}
	
	
	
	
}
