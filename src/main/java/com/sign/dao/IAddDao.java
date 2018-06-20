package com.sign.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sign.dto.ExaminationQuestions;

@Repository
public interface IAddDao {

	List<String> findAllSubject();

	List<String> findAllQuestionType();

	void addQuestion(ExaminationQuestions questions);

	ExaminationQuestions findQuestion(ExaminationQuestions questions);
	
	List<ExaminationQuestions> findQuestionByExcel(List<ExaminationQuestions> questionLists);
	
	void addQuestionList(List<ExaminationQuestions> questionLists);

	void addSubject(String subject);

	void addType(String type);

	void delSubject(List<String> subjects);

	void delType(List<String> types);
}