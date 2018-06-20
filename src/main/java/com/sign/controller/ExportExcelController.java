package com.sign.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sign.dto.ExaminationQuestions;
import com.sign.service.AddService;
import com.sign.service.ExcelService;

@Controller
@RequestMapping("/excel")
public class ExportExcelController {
	@Autowired
	private ExcelService excelService;
	@Autowired
	private AddService addService;
	private HttpSession session;
	private List<ExaminationQuestions> excelQuestion;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/export")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
		response.setContentType("application/binary;charset=ISO8859_1");
		try {
			ServletOutputStream outputStream = response.getOutputStream();
			String fileName = new String(("题目excel").getBytes(), "ISO8859_1");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xlsx");// 组装附件名称和格式
			List<ExaminationQuestions> questions = (List<ExaminationQuestions>) session.getAttribute("questions");
			String[] titles = { "科目", "类型", "子类型", "选项", "题目", "答案" };
			excelService.exportExcel(questions, titles, outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 导出模板
	 * 
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/downloadTemplate")
	public void downloadTemplate(HttpServletRequest request, HttpServletResponse response) {
		session = request.getSession();
		response.setContentType("application/binary;charset=ISO8859_1");
		try {
			ServletOutputStream outputStream = response.getOutputStream();
			String fileName = new String(("题目excel").getBytes(), "ISO8859_1");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName + ".xlsx");// 组装附件名称和格式
			String[] titles = { "科目", "类型", "子类型", "题目", "选项", "答案" };
			List<ExaminationQuestions> questions = new ArrayList<>();
			ExaminationQuestions question = new ExaminationQuestions();
			question.setSubject("语文");
			question.setTypes("选择题");
			question.setExtend("多选");
			question.setExtend2("A...B...C...D...");
			question.setQuestion("问题");
			question.setAnswer("答案");
			questions.add(question);
			excelService.exportExcel(questions, titles, outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public Map<String, Object> upload(HttpServletRequest request, HttpServletResponse response) {
		MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = mulRequest.getFile("file");
		String filename = file.getOriginalFilename();
		Map<String, Object> map = new HashMap<String, Object>();
		if (filename == null || "".equals(filename)) {
			return null;
		}

		List<ExaminationQuestions> questions = new ArrayList<>();
		try {
			InputStream input = file.getInputStream();
			XSSFWorkbook workBook = new XSSFWorkbook(input);
			XSSFSheet sheet = workBook.getSheetAt(0);
			if (sheet != null) {
				for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
					ExaminationQuestions equestion = new ExaminationQuestions();
					XSSFRow row = sheet.getRow(i);
					XSSFCell cell = row.getCell(0);
					String subject = cell.toString();
					cell = row.getCell(1);
					String type = cell.toString();
					cell = row.getCell(2);
					String extend = cell.toString();
					cell = row.getCell(3);
					String question = cell.toString();
					cell = row.getCell(4);
					String extend2 = cell.toString();
					cell = row.getCell(5);
					String answer = cell.toString();
					equestion.setSubject(subject);
					equestion.setTypes(type);
					equestion.setExtend(extend);
					equestion.setQuestion(question);
					equestion.setExtend2(extend2);
					equestion.setAnswer(answer);
					questions.add(equestion);
				}
			}
			excelQuestion = addService.findQuestionByExcel(questions);
			StringBuilder sBuilder = new StringBuilder();
			if (excelQuestion.size() != 0) {
				map.put("code", "1");
			} else {
				map.put("code", "0");
/*				addService.addQuestionList(questions);
*/				for (ExaminationQuestions row : questions) {
					addService.addQuestion(row);
				}
			}
			if (excelQuestion.size() == 0) {
				return map;
			}
			sBuilder.append("第");
			for (int j = 0; j < excelQuestion.size(); j++) {
				for (int i = 0; i < questions.size(); i++) {
					if (excelQuestion.get(j).getQuestion().equals(questions.get(i).getQuestion())) {
						sBuilder.append(i + 2);
					}
				}
				if (j != excelQuestion.size() - 1) {
					sBuilder.append("、");
				}
			}
			sBuilder.append("行题目存在，导入失败");
			map.put("value", sBuilder.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

}
