package com.sign.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sign.dao.IQuestionDao;
import com.sign.dto.ExaminationQuestions;
import com.sign.dto.SearchInfo;
import com.sign.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService{
	@Autowired
	private IQuestionDao questionDao;
	@Override
	public List<ExaminationQuestions> search(SearchInfo searchInfo) {
		return questionDao.search(searchInfo);
	}
	@Override
	public void updateQuestion(ExaminationQuestions questions) {
		questionDao.updateQuestion(questions);
	}

}
