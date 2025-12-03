package repository;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import orm.DBConfig;

public class MemberDAOImpl implements MemberDAO {
	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	private SqlSession sql;
	private String NS = "memberMapper."; // memberMapper 사용

	public MemberDAOImpl() {
		sql = DBConfig.getSqlSessionFactory().openSession(true);
	}

	@Override
	public int insert(MemberVO mvo) {
		int isOk = sql.insert(NS + "reg", mvo);
		if(isOk > 0) sql.commit();
		return isOk;
	}

	@Override
	public MemberVO selectOne(MemberVO mvo) {
		return sql.selectOne(NS + "login", mvo);
	}
}