package repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.RoomVO;
import orm.DBConfig;

public class BoardDAOImpl implements BoardDAO {
	private static final Logger log = LoggerFactory.getLogger(BoardDAOImpl.class);
	private SqlSession sql;
	
	private String NS = "boardMapper.";
	
	public BoardDAOImpl() {
		sql = DBConfig.getSqlSessionFactory().openSession(true);
	}

	@Override
	public int insert(RoomVO rvo) {
		int isOk = sql.insert(NS + "add", rvo);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public List<RoomVO> selectList(String status, String keyword) {
		// 파라미터가 2개라 Map 사용
		Map<String, String> map = new HashMap<>();
		map.put("status", status);
		map.put("keyword", keyword);
		return sql.selectList(NS + "list", map);
	}
	
	@Override
	public RoomVO selectOne(int rno) {
		return sql.selectOne(NS + "detail", rno);
	}

	@Override
	public int update(RoomVO rvo) {
		int isOk = sql.update(NS + "mod", rvo);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public int delete(int rno) {
		int isOk = sql.delete(NS + "del", rno);
		if(isOk > 0) sql.commit();
		return isOk;
	}
	
	@Override
	public int updateStatus(RoomVO rvo) {
	    int isOk = sql.update(NS + "status", rvo);
	    if(isOk > 0) sql.commit();
	    return isOk;
	}
}