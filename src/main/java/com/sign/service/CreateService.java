package com.sign.service;

import java.util.List;

import com.sign.dto.ExaminationQuestions;
import com.sign.dto.RecordInfo;

/**
 * 添加题目页面
 * @author xunfeng
 *
 */
public interface CreateService {
	public void addRecord(RecordInfo recordInfo);
	List<ExaminationQuestions> findQuesetionByTypes(String subject,String types,int count);
}
