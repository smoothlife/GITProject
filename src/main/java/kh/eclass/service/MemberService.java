package kh.eclass.service; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.eclass.dao.MemberDAO;
import kh.eclass.dto.MemberDTO;
import kh.eclass.utils.EncryptUtils;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO mdao;
	
	public int idDupleCk(MemberDTO dto) {
		return mdao.idDupleCk(dto);
	}
	
	public int join(MemberDTO dto) {
		return mdao.join(dto);
	}
	
	public MemberDTO getMyData(String id) {
		return mdao.getMyData(id);
	}
	
	public void revise(MemberDTO dto) {
		mdao.revise(dto);
	}
	
	public boolean loginCheck(String id, String pw) throws Exception {
		return mdao.loginCheck(id, pw);
	}
	
	public int resign(String id) throws Exception{
		return mdao.resign(id);
	}

}
