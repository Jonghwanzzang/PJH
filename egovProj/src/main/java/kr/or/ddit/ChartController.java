package kr.or.ddit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/chart")
@Controller
public class ChartController {
	
	//요청URI : /chart/chart01
	//json 구글차트
	@GetMapping("/chart01")
	public String chart01() {
		//forwarding
		return "chart/chart01";
	}
	
	//요청URI : /chart/chart01
	//json 구글 멀티 차트
	@GetMapping("/chart01Multi")
	public String chart01Multi() {
		//forwarding
		return "chart/chart01Multi";
	}
	
	//요청URI : /chart/chart01
	//oracle 구글차트
	@GetMapping("/chart02Multi")
	public String chart02() {
		//forwarding
		return "chart/chart02";
	}
	
	
	
}

