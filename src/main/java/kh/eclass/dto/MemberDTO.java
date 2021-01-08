package kh.eclass.dto;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String name;
	private String pw;
	private String email;
	private Date regDate;
	
	public MemberDTO() {}
	public MemberDTO(String id, String name, String pw, String email, Date regDate) {
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.email = email;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
}
