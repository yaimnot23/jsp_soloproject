package service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import domain.RoomVO;
import repository.BoardDAO;
import repository.BoardDAOImpl;

public class BoardServiceImpl implements BoardService {
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	private BoardDAO bdao;
	
	public BoardServiceImpl() {
		bdao = new BoardDAOImpl();
	}

	@Override
	public int register(RoomVO rvo) {
		return bdao.insert(rvo);
	}

	@Override
	public List<RoomVO> getList(String status, String keyword) {
		// DAO로 검색어 2개 전달
		return bdao.selectList(status, keyword);
	}

	@Override
	public RoomVO getDetail(int rno) {
		return bdao.selectOne(rno);
	}

	@Override
	public int modify(RoomVO rvo) {
		return bdao.update(rvo);
	}

	@Override
	public int remove(int rno) {
		return bdao.delete(rno);
	}
	
	@Override
	public int statusChange(RoomVO rvo) {
	    return bdao.updateStatus(rvo);
	}
}