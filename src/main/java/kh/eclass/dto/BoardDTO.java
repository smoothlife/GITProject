package kh.eclass.dto;

import java.sql.Date;

public class BoardDTO {
	private int seq;
	private String title;
	private String contents;
	private String writerId;
	private Date writeDate;
	
	public BoardDTO() {}
	public BoardDTO(int seq, String title, String contents, String writerId, Date writeDate) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.writerId = writerId;
		this.writeDate = writeDate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
}
