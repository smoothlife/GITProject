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
	
	public List<BoardDTO> getBoardList(int startRowNum,int endRowNum){
		Map<String,Object> map = new HashMap<>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return db.selectList("Board.getBoardList",map);
	}
	public int getBoardTotalCount() {
		return db.selectOne("Board.getBoardTotalCount");
	}
}
