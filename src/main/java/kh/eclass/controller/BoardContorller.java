package kh.eclass.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.eclass.dto.BoardDTO;
import kh.eclass.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardContorller {
	@Autowired
	private BoardService bservice;

	@RequestMapping("toboard.board")
	public String toboard(int cpage, Model model) {
		if(cpage==0) {
			cpage=1;
		}
		List<BoardDTO> list = bservice.getBoardList(cpage);
		String navi = bservice.getNavi(cpage);
		System.out.println(navi);
		model.addAttribute("navi",navi);
		model.addAttribute("cpage",cpage);
		model.addAttribute("list",list);
		return "/board/boardlistview";
	}
	
	@RequestMapping("toboarwrite.board")
	public String toboarwrite(int cpage,Model model) {
		model.addAttribute("cpage",cpage);
		return "/board/boardWrite";
	}
	
	@RequestMapping("toboardcontentsview.board")
	public String toBoardContents(int cpage,int seq, Model model) {
		
		//지영
		String writerId = bservice.getWriterId(seq);
		
		//seq으로 게시글 내용 가져와서 내용 뿌려주기
		BoardDTO dto = bservice.selectContents(seq);
		model.addAttribute("dto",dto);
		
		//작성자일때만 수정가능 -테스트용
		 int isWriterContents = bservice.isWriterContents(writerId);
		 model.addAttribute("isWriterContents",isWriterContents);
		
		//작성자일때만 수정가능
//		 BoardDTO bdto = new BoardDTO(); 
//		 int isWriterContents = bservice.isWriterContents(bdto);
//		 model.addAttribute("isWriterContents",isWriterContents);

			model.addAttribute("cpage",cpage);
			model.addAttribute("seq",seq);
		return "/board/boardContentsView";
	}
	
	
	//게시글 수정
	@RequestMapping("contentsModify.board")
	public String contentsModify(BoardDTO dto,int seq,int cpage, Model model) {
		System.out.println("글수정 컨트롤러 도착");
		System.out.println(seq);
		System.out.println(cpage);
		
		//seq으로 제목,작성자,날짜 가져오기
		BoardDTO bdto = bservice.selectContents(seq);
		model.addAttribute("bdto",bdto);
		model.addAttribute("cpage",cpage);
		model.addAttribute("seq",seq);
		
		return "/board/boardContentsModify";
	}
	//게시글 수정 완료
	@RequestMapping("contentsModifyDone.board")
	public String contentsModifyDone(BoardDTO dto,int cpage,Model model) {
		System.out.println("컨트롤러" + dto.getSeq());
		//DB에 정보 수정 업로드
		int result = bservice.updateContents(dto);
		System.out.println("result :" +result);

		model.addAttribute("cpage",cpage);
		return "redirect:/board/toboard.board";
	}
	//게시글 삭제
	@RequestMapping("delContents.board")
	public String delContents(int seq,int cpage,Model model) {
		System.out.println("삭제");
		int result = bservice.delContents(seq);
		
		model.addAttribute("cpage",cpage);
		model.addAttribute("seq",seq);
		return "redirect:/board/toboard.board";
	}
}
