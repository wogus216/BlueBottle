package com.gdj35.bbps.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.IshDao;

@Service
public class shService implements IshService{
	@Autowired
	public IshDao ishDao;
}
