package service;

import java.util.List;
import domain.RoomVO;

public interface BoardService {
	int register(RoomVO rvo);
	List<RoomVO> getList(String status, String keyword);
	RoomVO getDetail(int rno);
	int modify(RoomVO rvo);
	int remove(int rno);
	int statusChange(RoomVO rvo);
}