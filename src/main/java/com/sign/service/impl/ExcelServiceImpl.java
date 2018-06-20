package com.sign.service.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.sign.dto.ExaminationQuestions;
import com.sign.service.ExcelService;
import com.sign.util.ExcelUtil;

@Service
public class ExcelServiceImpl implements ExcelService{

	@Override
	public void exportExcel(List<ExaminationQuestions> questions, String[] titles, ServletOutputStream outputStream) {
        // 创建一个workbook 对应一个excel应用文件  
        XSSFWorkbook workBook = new XSSFWorkbook();  
        // 在workbook中添加一个sheet,对应Excel文件中的sheet  
        XSSFSheet sheet = workBook.createSheet("题目excel");  
        ExcelUtil exportUtil = new ExcelUtil(workBook, sheet);  
        XSSFCellStyle headStyle = exportUtil.getHeadStyle();  
        XSSFCellStyle bodyStyle = exportUtil.getBodyStyle();  
        // 构建表头  
        XSSFRow headRow = sheet.createRow(0);  
        XSSFCell cell = null;  
        for (int i = 0; i < titles.length; i++)  
        {  
            cell = headRow.createCell(i);  
            cell.setCellStyle(headStyle);  
            cell.setCellValue(titles[i]);  
        }  
        // 构建表体数据  
        if (questions != null && questions.size() > 0)  
        {  
            for (int j = 0; j < questions.size(); j++)  
            {  
                XSSFRow bodyRow = sheet.createRow(j + 1);  
                ExaminationQuestions goods = questions.get(j);  
  
                cell = bodyRow.createCell(0);  
                cell.setCellStyle(bodyStyle);  
                cell.setCellValue(goods.getSubject());  
  
                cell = bodyRow.createCell(1);  
                cell.setCellStyle(bodyStyle);  
                cell.setCellValue(goods.getTypes());  
  
                cell = bodyRow.createCell(2);  
                cell.setCellStyle(bodyStyle);  
                cell.setCellValue(goods.getExtend()); 
                
                cell = bodyRow.createCell(3);  
                cell.setCellStyle(bodyStyle);  
                cell.setCellValue(goods.getQuestion());  
                
                cell = bodyRow.createCell(4);  
                cell.setCellStyle(bodyStyle);  
                cell.setCellValue(goods.getExtend2()); 
                
                cell = bodyRow.createCell(5);  
                cell.setCellStyle(bodyStyle);  
                cell.setCellValue(goods.getAnswer());  
            }  
        }  
        try  
        {  
            workBook.write(outputStream);  
            outputStream.flush();  
            outputStream.close();  
        }  
		catch (IOException e)  
        {  
            e.printStackTrace();  
        }  
        finally  
        {  
            try  
            {  
                outputStream.close();  
            }  
            catch (IOException e)  
            {  
                e.printStackTrace();  
            }  
        }  
  		
	}

}
