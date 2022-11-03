package kr.or.ddit.Controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.annotation.MultipartConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.Member1Service;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.FileUploadUtil;
import kr.or.ddit.vo.Member1VO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Member1Controller {
	
	@Autowired
	Member1Service member1Service;
	
	@Inject
	FileUploadUtil fileUploadUtil;
	
	//요청 URI http: /board/list?currentPage=2
	//요청 파라미터 : currentPage = 2
	@RequestMapping(value="/hwlist" , method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav , 
			@RequestParam(defaultValue="1", required=false) int currentPage, @RequestParam Map<String,String> map ) {
		log.info("currentPage : " + currentPage);
		String cPage = map.get("currentPage");
		String show = map.get("show");
		String keyword = map.get("keyword");
				if(cPage == null) {
					map.put("currentPage","1");
				}
				if(show==null) {
					map.put("show","10");
				}
				/*
				 * if(keyword==null) { map.put("keyword",""); }
				 */
		log.info("map : " + map);
		
		List<Member1VO> list = this.member1Service.list(map);
		
		//한 화면에 보여질 행 수
		int size = Integer.parseInt(map.get("show"));
		
		// member1_bak 테이블 행 총 갯수
		int total = this.member1Service.getTotal(map);
		
		log.info("list : " + list);
		//(전체 글 수, 현재 페이지 , 한 화면에 보여질 행 수 , SELECT 결과 list)
		mav.addObject("list",new ArticlePage<Member1VO>(total, currentPage, size, list));
		mav.setViewName("board/list");
		
		return mav;
	}
	
	@RequestMapping("/hwinsert")
	public String insertform() {
		return "board/signUp";
	}
	
	
	@PostMapping(value = "/insert")
	public String insert(Member1VO memberVO , MultipartFile[] pictureArray) {
			log.info("memberVO : " + memberVO.toString());
			
			MultipartFile[] file = memberVO.getPictureArray();
			
			for(MultipartFile vo : file) {
				log.info("getOriginalFilename : " + vo.getOriginalFilename());
				log.info("getContentType : " + vo.getContentType());
				log.info("size : " + vo.getSize());
			}
			
	

			this.member1Service.insert(memberVO);
			
			/*
			 * if(result <0) { log.
			 * info("인설트 실패-------------------------------------------------------------------------------------------------------------"
			 * ); }else { log.
			 * info("인설트 성공-------------------------------------------------------------------------------------------------------------"
			 * ); }
			 */
		return "board/list";
	}
	
	// ajax로 요청된 JSON 데이터는 무조건 RequestBody로 받자
	@ResponseBody
	@PostMapping("/insertIdCheck")
	public int insertIdCheck(@RequestBody Map<String,String> memId) { //아이디 중복확인 컨트롤러
		String chkMemId = memId.get("memId");
		
		int result = this.member1Service.insertIdCheck(chkMemId);
		return  result;
	}
	
	 
	/*
	  	파일업로드 폼 방식 요청 처리
	  	파일업로드 폼 파일 <input type="file" ... 요소(=태그) 값을
	  	스프링 MVC가 지원하는 MultipartFile 매개변수로 처리함
	 */
	@GetMapping("/registerFile06")
	public String register06() {
		log.info("레지스러 입성");
		return "register/register06";
	}
	
	@PostMapping("/registerFile06")
	public String registerFile06(MultipartFile picture) {
		// <input type="file" name="picture" >		
		// 위의 name과 받을 매개변수이름과 동일해야 한다.
		
		log.info("originalName :" + picture.getOriginalFilename());
		log.info("size :" + picture.getSize());
		log.info("contentType : " + picture.getContentType());
		
		//forwarding
		return "register/success";
	}
	@PostMapping("/registerFile02")
	public String registerFile02(String userId , String password,
			MultipartFile picture) {
		// <input type="file" name="picture" >		
		// 위의 name과 받을 매개변수이름과 동일해야 한다.
		
		log.info(userId);
		log.info(password);
		
		log.info("originalName :" + picture.getOriginalFilename());
		log.info("size :" + picture.getSize());
		log.info("contentType : " + picture.getContentType());
		
		//forwarding
		return "register/success";
	}
	@PostMapping("/registerFile03")
	public String registerFile03(Member1VO memberVO,
			MultipartFile picture) {
		// <input type="file" name="picture" >		
		// 위의 name과 받을 매개변수이름과 동일해야 한다.
		log.info("memberVO :  "+memberVO.toString());
		log.info(memberVO.getUserId());
		log.info(memberVO.getPassword());
		
		log.info("originalName :" + picture.getOriginalFilename());
		log.info("size :" + picture.getSize());
		log.info("contentType : " + picture.getContentType());
		
		//forwarding
		return "register/success";
	}
	
	@PostMapping("/registerFile05")
	public String registerFile05(Member1VO memberVO,
			MultipartFile picture,MultipartFile picture2) {
		// <input type="file" name="picture" >		
		// 위의 name과 받을 매개변수이름과 동일해야 한다.
		log.info("memberVO :  "+memberVO.toString());
		log.info(memberVO.getUserId());
		log.info(memberVO.getPassword());
		
		log.info("originalName :" + picture.getOriginalFilename());
		log.info("size :" + picture.getSize());
		log.info("contentType : " + picture.getContentType());
		
		log.info("originalName :" + picture2.getOriginalFilename());
		log.info("size :" + picture2.getSize());
		log.info("contentType : " + picture2.getContentType());

		//forwarding
		return "register/success";
	}
	@PostMapping("/registerFile07")
	public String registerFile07(Member1VO memberVO, List<MultipartFile> picturelist) {
		// <input type="file" name="picture" >		
		// 위의 name과 받을 매개변수이름과 동일해야 한다.
		log.info("memberVO :  "+memberVO.toString());
		log.info(memberVO.getUserId());
		log.info(memberVO.getPassword());
		
		for(MultipartFile vo : picturelist) {
			log.info(vo.getOriginalFilename());
			log.info(vo.getName());
			//log.info(vo.getSize()); 
		}
		
		//forwarding
		return "register/success";
	}
	
	@PostMapping("/registerFile08")
	public String registerFile08(Member1VO memberVO, MultipartFile[] pictures) {
		// <input type="file" name="picture" >		
		// 위의 name과 받을 매개변수이름과 동일해야 한다.
		log.info("memberVO :  "+memberVO.toString());
		log.info(memberVO.getUserId());
		log.info(memberVO.getPassword());
		
		MultipartFile[] pictureArray = memberVO.getPictureArray();
		
		for(MultipartFile vo : pictureArray) {
			log.info(vo.getOriginalFilename());
			log.info(vo.getContentType());
			log.info("size : " + vo.getSize());
		}
		
		//forwarding
		return "register/success";
	}
	
	@GetMapping("/board/register07")
	public String register07Get() {
		//forwarding
		return "board/register07";
	}
	
	@RequestMapping(value="/board/uploadAjax", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile[] file){
		//formData.append("file",file);
		// 받을 매개변수 변수명과 동일함
		String originalFileName = file[0].getOriginalFilename();
		log.info("originalFileName : " +  originalFileName);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCESS"+originalFileName,HttpStatus.OK);
		
		UUID uuid = UUID.randomUUID();
		
		this.fileUploadUtil.fileUploadAction(file, uuid.toString());
		
		return entity;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
