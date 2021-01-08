package kh.eclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.eclass.dao.CommentDAO;
import kh.eclass.dto.CommentDTO;

@Service
public class CommentService {

	@Autowired
	private CommentDAO cdao;
	
	public int writeComment(CommentDTO dto) {
		return cdao.writeComment(dto);
	}
	
	public int updateComment(CommentDTO dto) {
		return cdao.updateComment(dto);
	}
	
	public int deleteComment(int seq) {
		return cdao.deleteComment(seq);
	}
	
	public List<CommentDTO> getListComment(int boardSeq){
		return cdao.getListComment(boardSeq);
	}
	
}
