package repository;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import domain.CommentVO;
import orm.DBConfig;

public class DashboardDAOImpl implements DashboardDAO {
    private SqlSession sql;
    private String NS = "dashMapper.";
    
    public DashboardDAOImpl() {
        sql = DBConfig.getSqlSessionFactory().openSession(true);
    }
    
    @Override
    public int getTotalRoomCount() {
        return sql.selectOne(NS + "totalRoom");
    }
    @Override
    public int getStatusCount(String status) {
        return sql.selectOne(NS + "countStatus", status);
    }
    @Override
    public int getTotalRsvCount() {
        return sql.selectOne(NS + "totalRsv");
    }
    @Override
    public List<CommentVO> getRecentComments() {
        return sql.selectList(NS + "recentComments");
    }
}