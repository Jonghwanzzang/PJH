package kr.or.ddit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.dao.Member1Dao;
import kr.or.ddit.service.Member1Service;
import kr.or.ddit.vo.Member1VO;

@Service
public class Member1ServiceImpl implements Member1Service {
	
	@Autowired
	Member1Dao member1dao;
	
	@Override
	public List<Member1VO> list() {
		return this.member1dao.list();
		
		
	}
	
	

}
