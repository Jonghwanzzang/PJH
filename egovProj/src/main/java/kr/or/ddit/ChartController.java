package kr.or.ddit;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.mapper.ProdMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/chart")
@Controller
public class ChartController {
	
	@Autowired
	ProdMapper prodMapper;
	
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
	@ResponseBody
	@GetMapping("/chart02")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	public JSONObject chart02(Model model) {
		//forwarding
		List<Map<String,Object>> list = this.prodMapper.amtSale();
		
		//JSON데이터를 만들어보자
		log.info(" list : " + list.toString());
		log.info(" listsize : " + list.size());
		
		
		  for(int i=0; i<list.size(); i++) { 
			  Map<String,Object> map = list.get(i);
			  
			  log.info(map.toString());
		  }
		  //JSONObject 객체를 만들어보자
		  JSONObject data = new JSONObject();
		
		  // 1. cols 배열에 넣기
		  // JSON 컬럼 객체
		 /*
		  * "cols":[ {"id":"","label":"Topping","pattern":"", "type":"string"} ,
		  * {"id":"","label":"Slices","pattern":"", "type":"number"} ],
		  */
		  JSONObject col1 = new JSONObject(); // 상품먕(속성명)
		  JSONObject col2 = new JSONObject(); // 금액(속성명)
		  
		  JSONArray title = new JSONArray();
		  col1.put("label","상품명");
		  col1.put("type", "string");
		  col2.put("label", "금액");
		  col2.put("type", "number");
		  title.add(col1);
		  title.add(col2);
		  
		  data.put("cols", title);
		  
		 /*
		  * "rows":
		  * [ {"c":[{"v":"Mushromms"},{"v":35000}]} ,
		  * {"c":[{"v":"Onion"},{"v":88000}]} , {"c":[{"v":"Olives"},{"v":16500}]} ,
		  * {"c":[{"v":"Zucchini"},{"v":200000}]} , {"c":[{"v":"Mushromms"},{"v":30000}]}
		  * ]
		  */
		  
		  //2. rows에 넣기
		  
		  JSONArray body = new JSONArray();
		  
		  for(Map<String,Object> map : list) {
			  JSONObject prodName = new JSONObject();
			  prodName.put("v", map.get("PRODNMAE")); // 상품명
			  
			  JSONObject money = new JSONObject();
			  money.put("v", map.get("MONEY"));
			  
			  JSONArray row = new JSONArray();
			  row.add(prodName);
			  row.add(money);
			  
			  JSONObject cell = new JSONObject();
			  cell.put("c", row);
			  
			  body.add(cell); // 레코드 1행 추가
		  }
		  data.put("rows", body);
		  
		  
		return data;
	}
	
	/*
	 	1. hasRole([role]) : 현재 사용자의 권한이 파라미터의 권한과 동일한 경우 true
	 	2. hasAnyRole([role1, role2]) : 현재 사용자의 권한이 파라미터의 권한 중 일치하는 것이 있는 경우 true
	 	3. principal : 사용자를 증명하는 주요객체(Usert)를 직접 접근
	 	4. authentication : SecurityContext에 있는 authentication 객체에 접근 가능
	 	5. permitAll : 모든 접근 허용
	 	6. denyAll : 모든 접근 비허용
	 	7. isAnonymouse() : 현재 사용자가 익명(비로그인)인 상태인 경우 true
	 	8. isrememberMe() : 현재 사용자가 RememberMe 사용자라면 true
	 	9. isAuthenticated() : 현재 사용자가 익명이 아니라면(로그인 상태라면) true
	 	10. isFullyAuthenticated() : 현재 사용자가 익명이거나 RememberMe 사용자가 아니라면 true
	 */
	
	//요청URI : /chart/chart03
	@GetMapping("/chart03")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MEMBER')")
	public String chart03(HttpServletRequest req) {
		// spring 절대경로로 가져오기 --> /resources/upload 윈도 절대경로
		String realPath = req.getRealPath(req.getContextPath());
		log.info("리얼패스 : "+realPath); //절대경로
		
		String uploadPath = realPath + "\\resources\\upload";
		
		log.info("uploadPath : " + uploadPath);
		
		
		
		return "chart/chart03"; 
	}
	
	@GetMapping("/chart04")
	@PreAuthorize("permitAll")
	public String chart04() {
		return "chart/chart04"; 
	}
	
	
	
	
}

