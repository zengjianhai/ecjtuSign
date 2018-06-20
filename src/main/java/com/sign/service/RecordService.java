package com.sign.service;

import java.util.List;

import com.sign.dto.ExaminationQuestions;
import com.sign.dto.RecordInfo;
import com.sign.dto.SearchInfo;

/**
 * 添加题目页面
 * @author xunfeng
 *
 */
public interface RecordService {
	
	public List<RecordInfo> findRecords(SearchInfo searchInfo);
	
	public List<ExaminationQuestions> findQuestionByIdList(List<String> questionLists);
}
