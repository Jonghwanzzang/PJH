package kr.or.ddit;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.serviceImpl.BookServiceImpl;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SinglePageController {
	
	@Autowired
	BookServiceImpl bookserviceimpl;
	
	@GetMapping("/index")
	public String mainrm(Model model) {
		List<BookVO> vo = this.bookserviceimpl.list();
		log.info("vo : " + vo);
		model.addAttribute("vo",vo);
		
		
		return "single/index";
		
	}
	
	@ResponseBody
	@PostMapping("/insertdata")
	public String insert(@RequestBody Map<String,String> param , BookVO vo) {
			
		String title=param.get("title");
		String category = param.get("category");
		String price =param.get("price");
		String content =param.get("content");
		vo.setTitle(title);
		vo.setCategory(category);
		vo.setPrice(Integer.parseInt(price));
		vo.setContent(content);
		log.info("vo : " + vo.toString());
		log.info(" param : "  + param);
		
		int result = this.bookserviceimpl.insert(vo);
		log.info(" result : " + result);
		
		if(result ==1) {
			return "1";
		}else {
			return "0";
		}
	}
	@ResponseBody
	@PostMapping("/delete")
	public String delete(@RequestBody Map<String,String> param , BookVO vo) {
		log.info(param.get("bookId")); 
		int bookId = Integer.parseInt(param.get("bookId"));
		int result = this.bookserviceimpl.delete(bookId);
		
		
		  if(result ==1 ) {
			  log.info("성공~"); 
			  return "1"; 
		  }else {
	  		  log.info("실패~"); 
			  return"0"; 
		   }
	}

}
