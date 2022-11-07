package kr.or.ddit.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MyMapper;
import kr.or.ddit.service.MyInfo;
import kr.or.ddit.vo.InfoVO;

@Service
public class MyInfoServiceImpl implements MyInfo {

	@Autowired
	MyMapper mymapper;
	
	@Override
	public List<InfoVO> list() {

		return mymapper.list();
	}
	
	

}
