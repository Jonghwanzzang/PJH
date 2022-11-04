package kr.or.ddit.service.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.StudentMapper;
import kr.or.ddit.service.StudentInterface;
import kr.or.ddit.vo.StudentVO;

@Service
public class StudentServiceImpl implements StudentInterface {

	
	  @Autowired StudentMapper stmapper;

	@Override
	public List<StudentVO> list() {
		 return this.stmapper.list();
		
	}
	  
	 
}
