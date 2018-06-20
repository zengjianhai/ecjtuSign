package com.sign.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sign.dao.IAddDao;
import com.sign.dto.ExaminationQuestions;
import com.sign.service.AddService;

@Service
public class AddServiceImpl implements AddService{
	@Autowired
	private IAddDao addDao;
	@Override
	public List<String> findAllSubject() {
		return addDao.findAllSubject();
	}

	@Override
	public List<String> findAllQuestionType() {
		return addDao.findAllQuestionType();
	}

	@Override
	public void addQuestion(ExaminationQuestions questions) {
		addDao.addQuestion(questions);
	}

	@Override
	public ExaminationQuestions findQuestion(ExaminationQuestions questions) {
		questions.setQuestion(questions.getQuestion().substring(0, 4));
		questions.setAnswer(questions.getAnswer().substring(0, 0));
		return addDao.findQuestion(questions);
	}

	@Override
	public List<ExaminationQuestions> findQuestionByExcel(List<ExaminationQuestions> questionLists) {
		return addDao.findQuestionByExcel(questionLists);
	}

	@Override
	public void addQuestionList(List<ExaminationQuestions> questionLists) {
		addDao.addQuestionList(questionLists);
	}

	@Override
	public void addSubject(String subject) {
		addDao.addSubject(subject);
		
	}

	@Override
	public void addType(String type) {
		addDao.addType(type);
		
	}

	@Override
	public void delSubject(List<String> subjects) {
		// TODO Auto-generated method stub
		addDao.delSubject(subjects);
	}

	@Override
	public void delType(List<String> types) {
		// TODO Auto-generated method stub
		addDao.delType(types);
	}

}
