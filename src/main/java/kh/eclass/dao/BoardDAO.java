package kh.eclass.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.eclass.dto.BoardDTO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession db;

	public BoardDTO selectContents(int seq) {
		return db.selectOne("Board.selectContents",seq);
	}
	public String getWriterId(int seq) {
		return db.selectOne("Board.getWriterId",seq);
	}
	//수정된 내용 업로드
	public int updateContents(BoardDTO dto) {
		return db.update("Board.updateContents",dto);
	}
	//게시글 삭제
	public int delContents(int seq) {
		return db.delete("Board.delContents",seq);
	}
	// 작성자 일때만 수정/삭제 보이기  - 테스트
	public int isWriterContents(String writerId) {
		return db.selectOne("Board.isWriterContents",writerId); 
	}
	// 작성자 일때만 수정/삭제 보이기
//	public int isWriterContents(BoardDTO dto) { return
//			db.selectOne("Board.isWriterContents",dto); 
//	}
	
	// 게시글 작성
	public int getSeq() {
		return db.selectOne("Board.selectSeq");
	}
	public int writing(BoardDTO dto) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("dto", dto);
		return db.insert("Board.insertBoard", param);
	}
}
