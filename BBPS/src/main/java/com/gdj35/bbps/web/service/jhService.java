package com.gdj35.bbps.web.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj35.bbps.web.dao.IjhDao;

@Service
public class jhService implements IjhService {

	@Autowired
	public IjhDao ijhDao;
	
	@Override
	public HashMap<String, String> getHQ(HashMap<String, String> params) throws Throwable {
		return ijhDao.getHQ(params);
	}

}
