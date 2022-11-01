package kr.or.ddit.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.MemberDao;
import kr.or.ddit.service.MemberService;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDao memberdao;
	
	//메서드에 골뱅이Transactional 애너테이션을 부여
	/*
	 	회원 정보를 저장하다가 실행하거나 주소 정보를 저장하다가 실패하거나
	 	정보를 저장하다가 실패하면 모두 저장이 되지 않고 rollback이 된다.
	 */
	@Transactional
	@Override
	public int memberInsert(MemberVO memberVO) {
		//.insert("namespace".id",파라미터
		int one = this.memberdao.memberInsert(memberVO);
		log.info("one : " + one);
		
		//ADDRESS 테이블에 insert
		int two = this.memberdao.addressInsert(memberVO);
		log.info("two: " + two);
		

		//CARD 테이블에 insert
		List<CardVO> cardVOList = memberVO.getCardVOList();  // userId가 NULL
		List<CardVO> cardVOList2 = new ArrayList<CardVO>(); // userId가 채워짐
		for(CardVO vo : cardVOList ) {
			
			vo.setUserId(memberVO.getUserId());
			
			cardVOList2.add(vo);
		}
		
		return this.memberdao.insertCard(cardVOList2);
		
		

	}
}
