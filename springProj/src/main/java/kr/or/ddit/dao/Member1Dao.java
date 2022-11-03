package kr.or.ddit.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.Member1VO;

@Repository
public class Member1Dao {
	
	@Autowired
	SqlSessionTemplate sqlsessiontemplate;
	
	
	public List<Member1VO> list(Map<String,String> map){
		return this.sqlsessiontemplate.selectList("member1.selectall", map);
	}
	
//	<!-- 테이블의 전체 행 수 구함 -->
// 	<select id="getTotal" resultType="int">
	public int getTotal(Map<String,String> map) {
		return this.sqlsessiontemplate.selectOne("member1.getTotal",map);
	}
	
	public int insert(Member1VO memberVO) {
		return this.sqlsessiontemplate.insert("member1.insert" , memberVO);
	}
	
	public int insertIdCheck(String memId) {
		return this.sqlsessiontemplate.selectOne("member1.insertIdCheck",memId);
	}
	

}
