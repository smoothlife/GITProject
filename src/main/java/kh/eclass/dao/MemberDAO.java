package kh.eclass.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.eclass.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession db;
	
	public boolean loginCheck(String id, String pw) throws Exception{
		MemberDTO dto = new MemberDTO();
		dto.setId(id); 
		dto.setPw(pw);
		return db.selectOne("Member.loginCheck", dto);	
	}
	
	public int resign(String id) throws Exception{
		return db.delete("Member.deleteById",id);
	}

}
