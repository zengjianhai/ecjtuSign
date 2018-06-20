package com.sign.service;


import java.util.List;

import javax.servlet.ServletOutputStream;

import com.sign.dto.ExaminationQuestions;


/**
 * 添加题目页面
 * @author xunfeng
 *
 */
public interface ExcelService {
	 public void exportExcel(List<ExaminationQuestions> questions,String [] titles,ServletOutputStream outputStream);
}
