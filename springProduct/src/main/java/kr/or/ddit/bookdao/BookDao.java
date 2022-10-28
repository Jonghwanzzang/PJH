package kr.or.ddit.bookdao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.ddit.bookvo.BookVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Repository
public class BookDao {
	
	@Autowired
	SqlSessionTemplate sqlsessiontemplage;
	
	
	public List<BookVO> selectAll(){
		log.info("dao select 들어간다");
		return this.sqlsessiontemplage.selectList("book.selectlist");
	}
	
	public int insertbook(BookVO vo) {
		log.info("dao insertbook IN");
		return this.sqlsessiontemplage.insert("book.insertbook",vo);
	
	}
	
	public BookVO detail(String bookId){
		log.info("dao detail IN");
		log.info(bookId);
		return this.sqlsessiontemplage.selectOne("book.detail",bookId);
	}
	
	
}
