package repository;

import java.util.List;
import domain.RoomVO;

public interface BoardDAO {
	int insert(RoomVO rvo);
	// 페이징 정보(pageStart, qty) 포함
	List<RoomVO> selectList(String status, String keyword, int pageStart, int qty);
	// 전체 데이터 개수 구하기
	int getTotalCount(String status, String keyword);
	RoomVO selectOne(int rno);
	int update(RoomVO rvo);
	int updateStatus(RoomVO rvo);
	int delete(int rno);
}