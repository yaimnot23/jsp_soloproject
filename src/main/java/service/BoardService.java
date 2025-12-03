package service;

import java.util.List;
import domain.RoomVO;
import handler.PagingHandler; // PagingHandler import 필요

public interface BoardService {
	int register(RoomVO rvo);
	// 리턴 타입을 List가 아니라 PagingHandler로 변경 (한 번에 다 보내기 위해)
	PagingHandler getList(String status, String keyword, int pageNo);
	RoomVO getDetail(int rno);
	int modify(RoomVO rvo);
	int statusChange(RoomVO rvo);
	int remove(int rno);
}