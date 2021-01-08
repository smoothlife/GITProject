package kh.eclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.eclass.dao.BoardDAO;
import kh.eclass.dto.BoardDTO;
import kh.eclass.statics.Configurator;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO bdao; 
	
	public List<BoardDTO> getBoardList(int cpage){
		int startRowNum = (cpage-1)*Configurator.recordCountPerPage+1;
		int endRowNum = cpage *Configurator.recordCountPerPage;
		System.out.println(startRowNum + ": "+endRowNum);
		return bdao.getBoardList(startRowNum,endRowNum);
	}
	public int getBoardTotalCount() {
		return bdao.getBoardTotalCount();
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
	
}
