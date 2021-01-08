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
}
