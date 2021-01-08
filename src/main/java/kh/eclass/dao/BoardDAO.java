package kh.eclass.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.eclass.dto.BoardDTO;

@Repository
public class BoardDAO {



	@Autowired
	private SqlSession db;
	//용국
	public List<BoardDTO> getBoardList(int startRowNum,int endRowNum){
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return db.selectList("Board.getBoardList",map);
	}
	public int getBoardTotalCount() {
		return db.selectOne("Board.getBoardTotalCount");
	}
	
	
	//지영
	public BoardDTO selectContents(int seq) {
		return db.selectOne("Board.selectContents",seq);
	}
	public String getWriterId(int seq) {
		return db.selectOne("Board.getWriterId",seq);
	}
	//수정된 내용 업로드
	public int updateContents(BoardDTO dto) {
		System.out.println("dao contents : " + dto.getContents());
		System.out.println("dao title : " + dto.getTitle());
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
}
