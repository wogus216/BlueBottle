package com.gdj35.bbps.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj35.bbps.common.service.IPagingService;
import com.gdj35.bbps.web.service.InyService;

@Controller
public class nyController {

	@Autowired
	public InyService iNyService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/H_notice_cate")
	public ModelAndView H_notice_cate(ModelAndView mav) {
		
		mav.setViewName("ny/H_notice_cate");
		
		return mav;
	}
}
