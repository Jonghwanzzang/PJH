package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.impl.MyInfoServiceImpl;
import kr.or.ddit.vo.InfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/my")
public class MyController {
	
	@Autowired
	MyInfoServiceImpl myinfoservice;
	
	@GetMapping("/info")
	public String list(Model model) {
		log.info("IN");
		
		  List<InfoVO> info = this.myinfoservice.list(); 
		  model.addAttribute("info",info);
		  log.info("info : " + info);
		 
		
		
		return "myInfo/Info";
	}

}
