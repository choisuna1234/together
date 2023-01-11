package paw.togaether.board_comm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	// 공지사항 글쓰기
	@RequestMapping(value = "/board/boardWrite")
	public ModelAndView noticeWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		boardService.boardWrite(commandMap.getMap());
		return mv;
	}
	
	
}
