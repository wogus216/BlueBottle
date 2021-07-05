package com.gdj35.bbps.web.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gdj35.bbps.common.service.IPagingService;
import com.gdj35.bbps.web.service.sbService;

@Controller
public class sbController {
	@Autowired
	public sbService sbservice;
	
	@Autowired
	public IPagingService iPagingServcie;
	
	@RequestMapping(value = "/H_product_list")
	public ModelAndView product_list (ModelAndView mav) throws Throwable{
		
		List<HashMap<String,String>> list = sbservice.getproductlist();
		
		mav.addObject("list",list);
		mav.setViewName("sb/H_product_list");
		
		return mav;
	}
}
