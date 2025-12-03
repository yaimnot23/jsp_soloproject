package repository;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import domain.ReservationVO;
import orm.DBConfig;

public class ReservationDAOImpl implements ReservationDAO {
    private static final Logger log = LoggerFactory.getLogger(ReservationDAOImpl.class);
    private SqlSession sql;
    private String NS = "rsvMapper.";

    public ReservationDAOImpl() {
        sql = DBConfig.getSqlSessionFactory().openSession(true);
    }

    @Override
    public int insert(ReservationVO rvo) {
        int isOk = sql.insert(NS + "reg", rvo);
        if(isOk > 0) sql.commit();
        return isOk;
    }

    @Override
    public List<ReservationVO> selectList() {
        return sql.selectList(NS + "list");
    }
}