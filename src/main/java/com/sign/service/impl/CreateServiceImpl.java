package com.sign.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sign.dao.ICreateDao;
import com.sign.dto.ExaminationQuestions;
import com.sign.dto.RecordInfo;
import com.sign.service.CreateService;

@Service
public class CreateServiceImpl implements CreateService{
	@Autowired
	private ICreateDao iCreateDao;

	@Override
	public void addRecord(RecordInfo recordInfo) {
		iCreateDao.addRecord(recordInfo);
	}

	@Override
	public List<ExaminationQuestions> findQuesetionByTypes(String subject, String types, int count) {
		return iCreateDao.findQuesetionByTypes(subject, types, count);
	}

}
