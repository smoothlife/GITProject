package kh.eclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.eclass.dao.BoardDAO;
import kh.eclass.dto.BoardDTO;
import oracle.net.aso.d;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO bdao;
	
	public BoardDTO selectContents(int seq) {
		return bdao.selectContents(seq);
	}
	public String getWriterId(int seq) {
		return bdao.getWriterId(seq);
	}
	//수정된 내용 업로드
	public int updateContents(BoardDTO dto) {
		return bdao.updateContents(dto);
	}
	//게시글 삭제
	public int delContents(int seq) {
		return bdao.delContents(seq);
	}
	// 작성자 일때만 수정/삭제 보이기 - 테스트
	public int isWriterContents( String writerId) {
		return bdao.isWriterContents(writerId); 
	}
	// 작성자 일때만 수정/삭제 보이기 
//	 public int isWriterContents(BoardDTO dto) { return
//	 bdao.isWriterContents(dto); }
	
	// 게시글 작성
	public int getSeq() {
		return bdao.getSeq();
	}
	public int writing(BoardDTO dto) {
		return bdao.writing(dto);
	}
}
