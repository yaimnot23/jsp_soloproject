package controller;

import java.util.List;
import domain.RoomVO;
import repository.BoardDAO;
import repository.BoardDAOImpl;

public class TestMain {

	public static void main(String[] args) {
		// 1. DAO 객체 생성 (이때 DB 연결 시도함)
		BoardDAO dao = new BoardDAOImpl();
		
		// 2. 리스트 가져오기 실행
		System.out.println(">>> DB 조회 시작...");
		List<RoomVO> list = dao.selectList();
		
		// 3. 결과 출력
		System.out.println(">>> 조회 성공! 데이터 개수: " + list.size() + "개");
		
		for(RoomVO room : list) {
			System.out.println("--------------------------------");
			System.out.println("방 번호: " + room.getRoomNum());
			System.out.println("방 타입: " + room.getRoomType());
			System.out.println("가 격 : " + room.getPrice());
			System.out.println("상 태 : " + room.getRoomStatus());
		}
	}
}