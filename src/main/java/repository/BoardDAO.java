package repository;

import java.util.List;
import domain.RoomVO;

public interface BoardDAO {
	int insert(RoomVO rvo);
	List<RoomVO> selectList(String status, String keyword);
	RoomVO selectOne(int rno);
	int update(RoomVO rvo);
	int delete(int rno);
	int updateStatus(RoomVO rvo);
}