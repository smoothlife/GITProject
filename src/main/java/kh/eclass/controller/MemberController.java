package kh.eclass.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String logout(Model model) {
			System.out.println("로그아웃 컨트롤러 도착");
			session.removeAttribute("login_id");
			session.invalidate();
			return "home";	
	}
	
	//find pw ===============ON GOING
//	@RequestMapping("findPw.mem")
//	public String findPw() {
//		
//	}
	
	/*-----------------------예외처리-----------------------*/
	@ExceptionHandler
	public String exceptionhandler(Exception e) {
		e.printStackTrace();
		return "error";
	}

}
