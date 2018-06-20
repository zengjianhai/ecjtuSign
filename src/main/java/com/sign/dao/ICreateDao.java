package com.sign.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.sign.dto.ExaminationQuestions;
import com.sign.dto.RecordInfo;


@Repository
public interface ICreateDao {
	void addRecord(RecordInfo recordInfo);
	List<ExaminationQuestions> findQuesetionByTypes(String subject,String types,int count);
}