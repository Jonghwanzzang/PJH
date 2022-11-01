package kr.or.ddit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.Member1VO;

@Repository
public class Member1Dao {
	
	@Autowired
	SqlSessionTemplate sqlsessiontemplate;
	
	public List<Member1VO> list(){
		return this.sqlsessiontemplate.selectList("memeber1.selectall");
	}
	
	

}
