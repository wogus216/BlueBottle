package com.gdj35.bbps.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gdj35.bbps.common.service.IPagingService;
import com.gdj35.bbps.web.service.INyService;

@Controller
public class nyController {

	@Autowired
	public INyService iNyService;
	
	@Autowired
	public IPagingService iPagingService;
}
