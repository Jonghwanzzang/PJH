package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.serviceImpl.StudentServiceImpl;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	StudentServiceImpl studentService;
	

	@GetMapping("/list")
	public String list(Model model ){
//		List<StudentVO>
		List<StudentVO> list = this.studentService.list();
		log.info(" list : " + list);
		model.addAttribute("list", list);
		
		return "student/list";
	}
}
