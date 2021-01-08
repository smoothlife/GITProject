package kh.eclass.controller;

import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.eclass.dto.BoardDTO;
import kh.eclass.dto.CommentDTO;
import kh.eclass.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private CommentService cservice;
	
	@RequestMapping("/")
	public String toComment(Model model) {
		// boardView로 넘어갈 때 뭐가 필요하징
		BoardDTO dto = new BoardDTO();
		dto.setSeq(5);
		dto.setWriterId("권용국");
		model.addAttribute("dto",dto);
		return "/comment";
	}
	
	@ResponseBody
	@RequestMapping("writeComment.comment")
	public String writeComment(CommentDTO dto) {
		String writerId = "jej";
		dto.setWriterId(writerId);
		
		int boardSeq = 5;
		dto.setBoardSeq(boardSeq);
		
		int result = cservice.writeComment(dto);
		JsonObject obj = new JsonObject();
		obj.addProperty("result", result);
		return new Gson().toJson(obj);
	}
	
	@ResponseBody
	@RequestMapping("updateComment.comment")
	public String updateComment(CommentDTO dto) {
		int result = cservice.updateComment(dto);
		JsonObject obj = new JsonObject();
		obj.addProperty("result", result);
		return new Gson().toJson(obj);
	}
	
	@ResponseBody
	@RequestMapping("deleteComment.comment")
	public String deleteComment(int seq) {
		int result = cservice.deleteComment(seq);
		JsonObject obj = new JsonObject();
		obj.addProperty("result", result);
		return new Gson().toJson(obj);
	}
	
	@ResponseBody
	@RequestMapping("getListComment.comment")
	public String getListComment(CommentDTO dto) {
		HashMap<String,Object> param = null;
		JSONArray jArray = new JSONArray();
		List<CommentDTO> list = cservice.getListComment(dto.getBoardSeq());
		// list를 JsonArray로 바꾼다.
		for (int i = 0; i < list.size(); i++) {
			param = new HashMap<>();
			param.put("seq", list.get(i).getSeq());
			param.put("contents", list.get(i).getContents());
			param.put("boardSeq", list.get(i).getBoardSeq());
			param.put("writerId", list.get(i).getWriterId());
			param.put("writeDate", list.get(i).getWriteDate());
			jArray.put(param);
		}
		return jArray.toString();
	}
}
