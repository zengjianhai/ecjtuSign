package com.sign.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.sign.dto.ExaminationQuestions;
import com.sign.dto.RecordInfo;
import com.sign.dto.SearchInfo;


@Repository
public interface IRecordDao {
	List<RecordInfo> findRecords(SearchInfo searchInfo);
	List<ExaminationQuestions> findQuestionByIdList(List<String> questionLists);
}