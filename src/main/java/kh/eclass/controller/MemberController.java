package kh.eclass.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.eclass.dto.MemberDTO;
import kh.eclass.service.MemberService;
import kh.eclass.utils.EncryptUtils;

import kh.eclass.dto.MemberDTO;
import kh.eclass.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	private HttpSession session;
	
	//===========================================================================

	//login
	@RequestMapping("login.mem")
	public String login(String id, String pw, Model model) throws Exception {
		boolean loginCheck = mservice.loginCheck(id, pw);
		if(loginCheck) {
			session.setAttribute("login_id", id);
		}else {
			model.addAttribute("isLoginSuc", "false");
		}
		return "home";
		
	}
	
	//logout
	@RequestMapping("logout.mem")
	public String logout() {
			session.removeAttribute("login_id");
			session.invalidate();
			return "home";	
	}
	
	//resignView
	@RequestMapping("resignView.mem")
	public String resignView() {
		return "/member/resignView";
	}
	
	//resign
	@RequestMapping("resign.mem")
	public String resign(MemberDTO dto, Model model) throws Exception {
		String id = (String)session.getAttribute("login_id");
		boolean loginCheck = mservice.loginCheck(id, dto.getPw());
		String result;
		if(loginCheck) {
			int resign = mservice.resign(id);
			if(resign>0) {
				result = "resign";
				session.removeAttribute("login_id");
				session.invalidate();
			}else {
				result = "resignError";
			}
		}else {
			result = "nothing";
		}
		model.addAttribute("result", result);
		return "home";
	}
		
	//find pw ===============ON GOING
//	@RequestMapping("findPw.mem")
//	public String findPw() {
//		
//	}

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
	//회원가입 페이지 이동
	@RequestMapping("toJoinpage.mem")
	public String toJoinPage() {
		return "/member/join";
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
		String id = (String)session.getAttribute("login_id");

		MemberDTO dto = mservice.getMyData(id);
		model.addAttribute("dto", dto);
		return "/member/mypage";
	}

	//수정페이지 이동
	@RequestMapping("toRevisePage.mem")
	public String toRevisePage(Model model) {
		//세션에서 받아오는걸로 수정필요
		String id = (String)session.getAttribute("login_id");

		MemberDTO dto = mservice.getMyData(id);
		model.addAttribute("dto", dto);
		return "/member/revise";
	}

	//수정
	@RequestMapping("revise.mem")
	public String revise(MemberDTO dto) {
		dto.setId((String)session.getAttribute("login_id"));
		
		//비밀번호 암호화
		dto.setPw(EncryptUtils.getSHA512(dto.getPw()));
		
		System.out.println(dto.getId());
		System.out.println(dto.getName());
		System.out.println(dto.getPw());
		System.out.println(dto.getEmail());
	
		mservice.revise(dto);
		return "redirect: toMyPage.mem";
	}
	
	/*-----------------------예외처리-----------------------*/
	@ExceptionHandler
	public String exceptionhandler(Exception e) {
		e.printStackTrace();
		return "error";
	}

}
