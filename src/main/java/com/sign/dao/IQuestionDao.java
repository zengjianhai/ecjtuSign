package com.sign.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sign.dto.ExaminationQuestions;
import com.sign.dto.SearchInfo;

@Repository
public interface IQuestionDao {

	public List<ExaminationQuestions> search(SearchInfo searchInfo);
	
	public void updateQuestion(ExaminationQuestions questions);
}