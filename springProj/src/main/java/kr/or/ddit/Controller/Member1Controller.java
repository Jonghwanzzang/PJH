package kr.or.ddit.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.Member1Service;
import kr.or.ddit.vo.Member1VO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Member1Controller {
	
	@Autowired
	Member1Service member1Service;
	
	@RequestMapping(value="/hwlist" , method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) {
		log.info("list 들어옴====================");
		
		List<Member1VO> list = this.member1Service.list();
		log.info("list : " + list);
		mav.addObject("list",list);
		mav.setViewName("board/list");
		
		return mav;
	}

}
