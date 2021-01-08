package kh.eclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.eclass.dao.MemberDAO;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO mdao;
	
	public boolean loginCheck(String id, String pw) throws Exception {
		return mdao.loginCheck(id, pw);
	}

}
