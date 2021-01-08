package kh.eclass.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.eclass.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession db;
	
	public int idDupleCk(MemberDTO dto) {
		return db.selectOne("Member.idDupleCk", dto);
	}
	
	public int join(MemberDTO dto) {
		return db.insert("Member.join", dto);
	}
	
	public MemberDTO getMyData(String id) {
		return db.selectOne("Member.getMyData", id);
	}
	
	public void revise(MemberDTO dto) {
		db.update("Member.revise", dto);
	}
	
}
