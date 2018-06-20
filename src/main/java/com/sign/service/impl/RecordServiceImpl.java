package com.sign.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sign.dao.IRecordDao;
import com.sign.dto.ExaminationQuestions;
import com.sign.dto.RecordInfo;
import com.sign.dto.SearchInfo;
import com.sign.service.RecordService;

@Service
public class RecordServiceImpl implements RecordService{
	@Autowired
	private IRecordDao recordDao;
	@Override
	public List<RecordInfo> findRecords(SearchInfo searchInfo) {
		return recordDao.findRecords(searchInfo);
	}
	@Override
	public List<ExaminationQuestions> findQuestionByIdList(List<String> questionLists) {
		return recordDao.findQuestionByIdList(questionLists);
	}

}
