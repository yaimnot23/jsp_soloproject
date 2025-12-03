package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import domain.CommentVO;
import repository.DashboardDAO;
import repository.DashboardDAOImpl;

public class DashboardServiceImpl implements DashboardService {
    private DashboardDAO ddao;
    
    public DashboardServiceImpl() {
        ddao = new DashboardDAOImpl();
    }
    
    @Override
    public Map<String, Integer> getStats() {
        Map<String, Integer> map = new HashMap<>();
        
        map.put("total", ddao.getTotalRoomCount());
        // [수정] "empty"는 예약어라서 "vacant"로 변경!
        map.put("vacant", ddao.getStatusCount("빈방")); 
        map.put("occupied", ddao.getStatusCount("사용중"));
        map.put("cleaning", ddao.getStatusCount("청소중"));
        map.put("rsv", ddao.getTotalRsvCount());
        
        return map;
    }
    
    @Override
    public List<CommentVO> getRecentReviews() {
        return ddao.getRecentComments();
    }
}