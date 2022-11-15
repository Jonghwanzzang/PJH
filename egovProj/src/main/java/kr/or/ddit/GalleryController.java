package kr.or.ddit;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.serviceImpl.BookServiceImpl;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/gallery")
public class GalleryController {

	@Autowired
	BookServiceImpl bookserviceImpl;
	
	@GetMapping("/list")
	public String list(Model model , BookVO vo) {
		
		
		  BookVO list = this.bookserviceImpl.filelist(vo);
		  List<AttachVO> attach = list.getAttachVOList();
		  log.info("list : " + list);
		 
		
		//공통 약속
		model.addAttribute("bodyTitle", "이미지 목록");
		model.addAttribute("list",list);
		model.addAttribute("attach",attach);
		return "gallery/list";
	}
	
	//도서 목록 가져와서 select에 추가
	@ResponseBody
	@GetMapping("/bookList")
	public List<BookVO> bookList() {
		List<BookVO> list = this.bookserviceImpl.bookList();
		
		return list;
	}
}
