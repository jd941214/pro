package com.ezen.mavenBoard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.mavenBoard.model.BoardDTO;

@Service
public class BoardMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardDTO> listBoard(){
		return sqlSession.selectList("listBoard");
	}
	
	public BoardDTO getBoard(int num){
		
		BoardDTO dto = sqlSession.selectOne("getBoard",num);
		return dto;
	}
	
	public void plusReadcount(int num) {
		sqlSession.update("readcountBoard",num);
	}
	
	public int insertBoard(BoardDTO dto){
		
		int res =sqlSession.insert("insertBoard",dto);
		
		return res;
	}
	
	public boolean isPassword(int num,String passwd){
		BoardDTO dto = getBoard(num);
		if (dto.getPasswd().equals(passwd)){
			return true;
		}
		return false;
	}
	
	public int deleteBoard(int num,String passwd){
		boolean isPass = isPassword(num, passwd);
		if (isPass){
			int res = sqlSession.delete("deleteBoard",num);
			return res;
		}else {
			return -1;
		}
	}
	
	public int updateBoard(BoardDTO dto) {
		boolean isPass = isPassword(dto.getNum(), dto.getPasswd());
		if (isPass){
			java.util.Map<String,Object> map = new java.util.Hashtable<String,Object>();
			map.put("writer",dto.getWriter());
			map.put("email",dto.getEmail());
			map.put("subject",dto.getSubject());
			map.put("content",dto.getContent());
			map.put("num",dto.getNum());
			
			
			int res = sqlSession.update("updateBoard",map);
			return res;
		}
			return -1;
		}
		
		public int getCount(){
			int res=sqlSession.selectOne("countBoard");
			return res;
		}

}
