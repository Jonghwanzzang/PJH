package kr.or.ddit.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.BookDao;
import kr.or.ddit.dao.Member1Dao;
import kr.or.ddit.service.Member1Service;
import kr.or.ddit.util.FileUploadUtil;
import kr.or.ddit.vo.Member1VO;

@Service
public class Member1ServiceImpl implements Member1Service {
	
	@Autowired
	Member1Dao member1dao;
	
	@Autowired
	FileUploadUtil fileUploadUtil;
	
	@Override
	public List<Member1VO> list( Map<String,String> map) {
		return this.member1dao.list(map);
	}
	
//	<!-- 테이블의 전체 행 수 구함 -->
	public int getTotal(Map<String,String> map) {
		return this.member1dao.getTotal(map);
	}
	
	public int insert(Member1VO memberVO) {
		this.member1dao.insert(memberVO);
		
		//FileUploadUtil활용 -> 업로드, ATTACH 테이블에 insert
		return fileUploadUtil.fileUploadAction(memberVO.getPictureArray(), memberVO.getMemId());
		
		 
	}
	
	public int insertIdCheck(String memId) {
		return this.member1dao.insertIdCheck(memId);
	}


}
