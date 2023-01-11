package paw.togaether.board_comm.service;

import java.util.Map;

public interface BoardService {
	
	//공지사항 글쓰기
	void boardWrite(Map<String, Object> map) throws Exception;
		
}
