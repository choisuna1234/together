package paw.togaether.board_comm.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	
	// 공지사항 글쓰기
	public void boardWrite(Map<String, Object> map) throws Exception {
		insert("Board.board_write", map);
	}

}
