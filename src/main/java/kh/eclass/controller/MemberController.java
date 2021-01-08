package kh.eclass.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.eclass.dto.MemberDTO;
import kh.eclass.service.MemberService;
import kh.eclass.utils.EncryptUtils;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService mservice;

	//아이디 중복확인
	@RequestMapping(value="idDupleCk.mem", produces="text/plain; charset=UTF8")
	@ResponseBody
	public String idDuple(MemberDTO dto) {
		System.out.println("id " + dto.getId());
		int result = mservice.idDupleCk(dto);
		System.out.println(result);
		if(result>0) {
			return "이미 존재하는 아이디입니다.";
		}else {
			return "사용가능한 아이디입니다.";
		}
	}

	//회원가입
	@RequestMapping("join.mem")
	public String join(MemberDTO dto) {
		//비밀번호 암호화
		dto.setPw(EncryptUtils.getSHA512(dto.getPw()));

		mservice.join(dto);
		return "/home";
	}

	//마이페이지 이동
	@RequestMapping("toMyPage.mem")
	public String toMyPage(Model model) {
		//세션에서 받아오는걸로 수정필요
		String id = "91714741";

		MemberDTO dto = mservice.getMyData(id);
		model.addAttribute("dto", dto);
		return "/member/mypage";
	}

	//수정페이지 이동
	@RequestMapping("toRevisePage.mem")
	public String toRevisePage(Model model) {
		//세션에서 받아오는걸로 수정필요
		String id = "91714741";

		MemberDTO dto = mservice.getMyData(id);
		model.addAttribute("dto", dto);
		return "/member/revise";
	}

	//수정
	@RequestMapping("revise.mem")
	public String revise(MemberDTO dto) {
		//세션에서 받아오는걸로 수정필요
		String id = "91714741";
		dto.setId(id);
		
		//비밀번호 암호화
		dto.setPw(EncryptUtils.getSHA512(dto.getPw()));
		
		System.out.println(dto.getId());
		System.out.println(dto.getName());
		System.out.println(dto.getPw());
		System.out.println(dto.getEmail());
	
		mservice.revise(dto);
		return "redirect: toMyPage.mem";
	}

}
