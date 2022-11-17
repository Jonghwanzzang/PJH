package kr.or.ddit;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.service.serviceImpl.BookServiceImpl;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

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
	
	//첨부파일 이미지 변경
	//파라미터 attachVO{"userNO":"3","seq",:"5"} + 파일객체(name은 uploadFile)
	@ResponseBody
	@PostMapping("/updatePost")
	public AttachVO updatePost(MultipartFile[] uploadFile, @ModelAttribute AttachVO attachVO ) {
				log.info("uploadFile : " + uploadFile);
				log.info("attachVO : " + attachVO);
				log.info("getfolder : " + getFolder());
				
				//업로드 폴더 설정
				String uploadFolder = "C:\\eGovFrameDev-3.10.0-64bit\\workspace\\egovProj\\src\\main\\webapp\\resources\\upload";
				
				//연월일 폴더 생성
				File uploadPath = new File(uploadFolder,getFolder());
				log.info("upload Path : " + uploadPath);
				
				if(uploadPath.exists()==false) {
					uploadPath.mkdirs();
				}
				String uploadFileName = null;
				
				//파일 배열로부터 파일 하나씩 가져와보자
				for(MultipartFile file : uploadFile) {
					log.info("=================================");
					log.info("filename : " + file.getOriginalFilename());
					log.info("size : " + file.getSize());
					log.info("=================================");
	
					//같은 날 같은 이미지 업로드 시 파일 중복 방지 시작-----------------
					//java.util.UUID -> 랜덤값 생성
					UUID uuid = UUID.randomUUID();
					//원래의 파일 이름과 구분하기 위해 _ 를 붙임
					// 개똥이.jsp
					uploadFileName = uuid.toString() + "_" + file.getOriginalFilename();
					
					//File 객체 설계(복사할 대상 경로, 파일명)
					File saveFile = new File(uploadPath,uploadFileName);
					
					try {
					//파일 복사 실행
						file.transferTo(saveFile);
						
						//썸네일 처리
						//이미지인지 체킹
						if(checkImageType(saveFile)) {
							FileOutputStream thumbnail = new FileOutputStream(
									new File(uploadPath,"s_"+uploadFileName));
									
						//썸네일 생성
									Thumbnailator.createThumbnail(file.getInputStream(),			
									thumbnail,100,100);
							thumbnail.close();
									
								
						}
						String filename = "/"+getFolder().replace("\\", "/") + "/" + uploadFileName;
						attachVO.setFileName(filename);
						log.info("zzzzz+"+attachVO.toString()); 
						this.bookserviceImpl.fileupdate(attachVO);
						return attachVO;
					}catch (IllegalStateException e) {
						log.error(e.getMessage());
						return null;
					}catch (IOException e) {
						log.error(e.getMessage());
						return null;
					}
					
					
					
				}
				
				//같은 날 같은 이미지 업로드 시 파일 중복 방지 끝-----------------
				
				
		return null;
	}
	public String getFolder() {
		//2022-11-16형식(fomat) 지정
		//간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//날짜 객체 생성(JAVA.util 패키지)
		Date date = new Date();
		String str = sdf.format(date);
		
		return str.replace("-",File.separator);
		
	}
	//이미지인지 판단, 썸네일은 이미지만 가능하므로..
	public boolean checkImageType (File file) {
	String contentType;
	try {
		contentType = Files.probeContentType(file.toPath());
		return contentType.startsWith("image");
	}catch (IOException e) {
		e.printStackTrace();
	}
	//MIME 타입 알아냄. .jpeg/.ing의IME타입
	return false;
}
	@ResponseBody
	@PostMapping("/deletePost")
	public int deletePost(@RequestBody AttachVO attachVO ) {
		log.info("attach"+attachVO.toString());
		int result = this.bookserviceImpl.deletePost(attachVO);
		log.info("result : " + result);
		return result;
	}
	
	
	/**
	 * 이미지 다중 등록
	 * 요청 URI : /gallery/regist
	 * 방식 : get
	 */
	
	
	@GetMapping("/regist")
	public String regist(Model model) {
		model.addAttribute("bodyTitle", "이미지 다중 등록");
		return "gallery/regist";
	}
	
	@ResponseBody
	@GetMapping("/searchBook")
	public List<BookVO> searchBook(@ModelAttribute BookVO vo) {
		log.info("controller vo :" + vo.toString());
		String title = vo.getTitle();
		
		vo.setTitle(title);
		
		List<BookVO> list = this.bookserviceImpl.searchBook(vo);
		log.info("list : " + list);
		
		return list;
	}
	


}



