package kh.eclass.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.eclass.dao.BoardDAO;
import kh.eclass.dto.BoardDTO;
import oracle.net.aso.d;
import kh.eclass.statics.Configurator;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO bdao; 

	
	//용국
	public List<BoardDTO> getBoardList(int cpage){
		int startRowNum = (cpage-1)*Configurator.recordCountPerPage+1;
		int endRowNum = cpage *Configurator.recordCountPerPage+1;
		return bdao.getBoardList(startRowNum,endRowNum);
	}
	
	public List<BoardDTO> getBoardSearchList(int cpage,String title){
		int startRowNum = (cpage-1)*Configurator.recordCountPerPage+1;
		int endRowNum = cpage *Configurator.recordCountPerPage+1;
		return bdao.getBoardSearchList(title,startRowNum,endRowNum);
		
	}
	public int getBoardTotalCount() {
		return bdao.getBoardTotalCount();
	}
	
	public int getBoardSearchTotalCount(String title) {
		return bdao.getBoardSearchTotalCount(title);
	}
	
	public String getSerchNavi(int cpage,String title) {
		int recordTotalCount = bdao.getBoardSearchTotalCount(title);
		int pageTotalCount;
		if(recordTotalCount % Configurator.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configurator.recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount / Configurator.recordCountPerPage;
		}
		
		if(cpage < 1) {
			cpage=1;
		}else if(cpage > pageTotalCount) {
			cpage=pageTotalCount;
		}
		int startNavi = (cpage-1) / Configurator.naviCountPerPage * Configurator.naviCountPerPage +1;
		int endNavi = startNavi + Configurator.naviCountPerPage-1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}
		
		StringBuilder sb = new StringBuilder();
		
		if(needPrev) {
			sb.append("<li class=page-item disabled><a class=page-link href=/board/boardsearchlist.board?cpage="+(startNavi-1)+"&title="+title+">Previous</a></li>");
		}
		for(int i = startNavi; i<=endNavi; i++){
			sb.append("<li class=page-item><a class=page-link href =/board/boardsearchlist.board?cpage="+i+"&title="+title+" id=naviNum"+i+">"+i+"</a></li>");
		}
		if(needNext) {
			sb.append("<li class=page-item><a class=page-link href=/board/boardsearchlist.board?cpage="+(endNavi+1)+"&title="+title+">Next</a></li>");
		}
		return sb.toString();
		
	}
	
	public String getNavi(int cpage) {
		int recordTotalCount = bdao.getBoardTotalCount();
		int pageTotalCount;
		if(recordTotalCount % Configurator.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / Configurator.recordCountPerPage +1;
		}else {
			pageTotalCount = recordTotalCount / Configurator.recordCountPerPage;
		}
		
		if(cpage < 1) {
			cpage=1;
		}else if(cpage > pageTotalCount) {
			cpage=pageTotalCount;
		}
		int startNavi = (cpage-1) / Configurator.naviCountPerPage * Configurator.naviCountPerPage +1;
		int endNavi = startNavi + Configurator.naviCountPerPage-1;
		
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}
		
		boolean needPrev = true;
		boolean needNext = true;
		
		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}
		
		StringBuilder sb = new StringBuilder();
		
		if(needPrev) {
			sb.append("<li class=page-item disabled><a class=page-link href=/board/toboard.board?cpage="+(startNavi-1)+">Previous</a></li>");
		}
		for(int i = startNavi; i<=endNavi; i++){
			sb.append("<li class=page-item><a class=page-link href =/board/toboard.board?cpage="+i+" id=naviNum"+i+">"+i+"</a></li>");
		}
		if(needNext) {
			sb.append("<li class=page-item><a class=page-link href=/board/toboard.board?cpage="+(endNavi+1)+">Next</a></li>");
		}
		return sb.toString();
		
	}
	
	
	
	//지영
	
	public BoardDTO selectContents(int seq) {
		return bdao.selectContents(seq);
	}
	public String getWriterId(int seq) {
		return bdao.getWriterId(seq);
	}
	//수정된 내용 업로드
	public int updateContents(BoardDTO dto) {
		System.out.println("서비스 seq : " + dto.getSeq());
		System.out.println("서비스 contents : " + dto.getContents());
		System.out.println("서비스 title : " + dto.getTitle());
		return bdao.updateContents(dto);
	}
	//게시글 삭제
	public int delContents(int seq) {
		return bdao.delContents(seq);
	}
	// 작성자 일때만 수정/삭제 보이기 - 테스트
	public int isWriterContents(String writerId) {
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
//	 public int isWriterContents(BoardDTO dto) {
//		 return bdao.isWriterContents(dto); 
//	}
}
