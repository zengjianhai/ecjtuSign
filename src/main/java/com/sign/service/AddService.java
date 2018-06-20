package com.sign.service;

import java.util.List;

import com.sign.dto.ExaminationQuestions;

/**
 * 添加题目页面
 * @author xunfeng
 *
 */
public interface AddService {
	public List<String> findAllSubject();
	
	public List<String> findAllQuestionType();
	
	public void addQuestion(ExaminationQuestions questions);
	public ExaminationQuestions findQuestion(ExaminationQuestions questions);
	public List<ExaminationQuestions> findQuestionByExcel(List<ExaminationQuestions> questionLists);
	public void addQuestionList(List<ExaminationQuestions> questionLists);
	
	public void addSubject(String subject);
	public void addType(String type);
	public void delSubject(List<String> subjects);
	public void delType(List<String> types);
}
