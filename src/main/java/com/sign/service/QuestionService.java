package com.sign.service;

import java.util.List;

import com.sign.dto.ExaminationQuestions;
import com.sign.dto.SearchInfo;

/**
 * 题库页面
 * @author xunfeng
 *
 */
public interface QuestionService {
	public List<ExaminationQuestions> search(SearchInfo searchInfo);
	
	public void updateQuestion(ExaminationQuestions questions);
}
