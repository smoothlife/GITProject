package kh.eclass.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.eclass.dto.CommentDTO;

@Repository
public class CommentDAO {

	@Autowired
	SqlSession db;
	
	public int writeComment(CommentDTO dto) {
		return db.insert("Comment.writeComment",dto);
	}
	
	public int updateComment(CommentDTO dto) {
		return db.update("Comment.updateComment",dto);
	}
	
	public int deleteComment(int seq) {
		return db.delete("Comment.deleteComment",seq);
	}
	
	public List<CommentDTO> getListComment(int boardSeq){
		return db.selectList("Comment.getListComment", boardSeq);
	}
}
