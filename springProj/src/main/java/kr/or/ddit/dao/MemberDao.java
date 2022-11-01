package kr.or.ddit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BookVO;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;


// 메퍼xml(book_SQL.xml)을 실행시키는 DAO(Data Access Object) 클래스
// Repository 어노테이션 : 데이터에 접근하는 자바빈 객체로 스프링에 등록해줌
// 스프링아, 이거 데이터를 관리하는 특별한 클래스야.
@Slf4j
@Repository
public class MemberDao {
	// DI(Dependency Injection) : 의존성 주입
	// new 키워드를 통해 직접 생성하지 않고, 스프링이 미리 만들어 놓은(서버 실행 시 미리 root-context.xml을 읽어서
	// 자바 빈 객체로 인스턴스화 해놓음) sqlSessionTemplage 타입 객체를 BookDao 객체에 주입하여 사용함
	// BookDao 클래스에서 다른 클래스에 있는 객체를 BookDao 클래스에 갖다 씀
	// 2. IoC(Inversion of Control) : 제어의 역전
	@Autowired 
	SqlSessionTemplate sqlSessionTempate;
	
	//MEMBER 테이블에 insert
	public int memberInsert(MemberVO memberVO) {
		//.insert("namespace".id",파라미터
		return this.sqlSessionTempate.insert("member.memberInsert",memberVO);
	}
	
	//ADDRESS 테이블에 insert
	public int addressInsert(MemberVO memberVO) {
		return this.sqlSessionTempate.insert("member.addressInsert",memberVO);
	}
	
	public int insertCard(List<CardVO> cardVOList) {
		return this.sqlSessionTempate.insert("member.insertCard",cardVOList);
				
	}

}
