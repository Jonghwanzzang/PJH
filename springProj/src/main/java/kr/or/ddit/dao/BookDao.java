package kr.or.ddit.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;


// 메퍼xml(book_SQL.xml)을 실행시키는 DAO(Data Access Object) 클래스
// Repository 어노테이션 : 데이터에 접근하는 자바빈 객체로 스프링에 등록해줌
// 스프링아, 이거 데이터를 관리하는 특별한 클래스야.
@Slf4j
@Repository
public class BookDao {
	// DI(Dependency Injection) : 의존성 주입
	// new 키워드를 통해 직접 생성하지 않고, 스프링이 미리 만들어 놓은(서버 실행 시 미리 root-context.xml을 읽어서
	// 자바 빈 객체로 인스턴스화 해놓음) sqlSessionTemplage 타입 객체를 BookDao 객체에 주입하여 사용함
	// BookDao 클래스에서 다른 클래스에 있는 객체를 BookDao 클래스에 갖다 씀
	// 2. IoC(Inversion of Control) : 제어의 역전
	@Autowired 
	SqlSessionTemplate sqlSessionTempate;
	
	//BOOK 테이블에 insert
	public int insert(BookVO bookVo) {
		//book_SQL.xml 파일의 namespace가 book이고, id가 insert인 태그를 찾아
		// 그 안에 들어있는 sql을 실행함
		// insert 가 성공 : 1이상, 실패면 0
		return this.sqlSessionTempate.insert("book.insert",bookVo);
	}
	
	//책 상세보기
	public BookVO selectDetail(BookVO bookVO) {
		// sqlSessionTempate : 쿼리를 실행해주는 객체(root-context.xml)
		// selectOne() 메소드 : 1행을 가져올 때 사용  /selectList() 메소드 : 결과 집합 목록 변환(다중행)
		// 결과 행 수가 0이면 null 변환
		// 결과 행 수가 2 이상이면 ? TooManyResultException 예외 발생
		// .selectOne("namespace.id",파라미터)
		return this.sqlSessionTempate.selectOne("book.select_detail",bookVO);
	}
 
	//책 목록보기
	public List<BookVO> list(String keyword){
		//select 결과를 목록으로 받음. selectList("namespace","파라미터")로 받음 
		return this.sqlSessionTempate.selectList("book.list",keyword);
	}
	
	// 책 수정하기
	// insert , update , delete resultType은 생략합니다.
	public int update(BookVO bookVO) {
		// .update("namespace",파라미터)
		return this.sqlSessionTempate.update("book.update",bookVO);
	}
	public int delete(int bookId) {
		// .update("namespace",파라미터)
		return this.sqlSessionTempate.update("book.delete",bookId);
	}
	//ATTACH 테이블에 다중 insert
		public int insertAttach(List<AttachVO> attachVOList) {
			log.info("DAO attachVOList : "+attachVOList);
			return this.sqlSessionTempate.insert("book.insertAttach",attachVOList);
		}

}
