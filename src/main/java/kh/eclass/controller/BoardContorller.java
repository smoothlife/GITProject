package kh.eclass.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.eclass.dto.BoardDTO;
import kh.eclass.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardContorller {
	
	@Autowired
	private BoardService bservice;
	
	@Autowired
	private HttpSession session;
	
	//게시글 가져오기
	@RequestMapping("contentsPage.board")
	public String contentsPage( Model model) {
		String writerId = "권용국";
		int seq = 16;
		
		//String getWriterId = bservice.getWriterId(seq);
		
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
		
		return "/board/boardContentsView";
	}
	//게시글 수정
	@RequestMapping("contentsModify.board")
	public String contentsModify(BoardDTO dto,Model model) {
		System.out.println("글수정 컨트롤러 도착");
		
		String writerId ="권용국";
		int seq = 2;
		
		//seq으로 제목,작성자,날짜 가져오기
		BoardDTO bdto = bservice.selectContents(seq);
		model.addAttribute("bdto",bdto);
		
		return "/board/boardContentsModify";
	}
	//게시글 수정 완료
	@RequestMapping("contentsModifyDone.board")
	public String contentsModifyDone(BoardDTO dto) {
		//테스트용으로 임의 작성
		int seq = 2;
		System.out.println("수정완료 컨드롤러 seq: "+seq);
		System.out.println("수정완료 컨트롤러 contents: "+dto.getContents());
		
		int result = bservice.updateContents(dto);
		System.out.println("result :" +result);
		return "redirect:/board/contentsPage.board";
	}
	//게시글 삭제
	@RequestMapping("delContents.board")
	public String delContents(int seq) {
		int result = bservice.delContents(seq);
		return "redirect:/보드목록으로 되돌아가기/";
	}
	
	//게시글 작성
	@RequestMapping("boardWriting.board")
	public void boardWriteContentsWriting(MultipartHttpServletRequest mtfRequest, BoardDTO bdto) {
		// 세션 login_id가 작성자
		String writer = (String)session.getAttribute("login_id");
		System.out.println(writer);
		System.out.println(mtfRequest.getParameter("title"));
		System.out.println(mtfRequest.getParameter("contents"));
		bdto.setWriterId(writer);
		bdto.setTitle(mtfRequest.getParameter("title"));
		bdto.setContents(mtfRequest.getParameter("contents"));
		int seqN = bservice.getSeq();
		bdto.setSeq(seqN);
		bservice.writing(bdto);
	}
}
