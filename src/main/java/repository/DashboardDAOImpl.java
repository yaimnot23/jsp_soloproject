package repository;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import domain.CommentVO;
import orm.DBConfig;

public class DashboardDAOImpl implements DashboardDAO {
    // 멤버 변수에서 SqlSession 제거 (메서드 안에서 생성해야 함)
    private String NS = "dashMapper.";
    
    // 생성자에서는 아무것도 하지 않음 (또는 팩토리만 로드)
    public DashboardDAOImpl() {
    }
    
    @Override
    public int getTotalRoomCount() {
        // 메서드 실행 시마다 세션을 새로 열고(open), 작업 후 닫음(try-with-resources가 자동 close)
        try (SqlSession sql = DBConfig.getSqlSessionFactory().openSession(true)) {
            return sql.selectOne(NS + "totalRoom");
        }
    }

    @Override
    public int getStatusCount(String status) {
        try (SqlSession sql = DBConfig.getSqlSessionFactory().openSession(true)) {
            return sql.selectOne(NS + "countStatus", status);
        }
    }

    @Override
    public int getTotalRsvCount() {
        try (SqlSession sql = DBConfig.getSqlSessionFactory().openSession(true)) {
            return sql.selectOne(NS + "totalRsv");
        }
    }

    @Override
    public List<CommentVO> getRecentComments() {
        try (SqlSession sql = DBConfig.getSqlSessionFactory().openSession(true)) {
            return sql.selectList(NS + "recentComments");
        }
    }
}