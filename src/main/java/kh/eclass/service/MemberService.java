package kh.eclass.service; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.eclass.dao.MemberDAO;
import kh.eclass.dto.MemberDTO;

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
}
