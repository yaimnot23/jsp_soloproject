package service;
import java.util.List;
import java.util.Map;
import domain.CommentVO;

public interface DashboardService {
    // 통계 숫자들을 Map에 담아서 리턴
    Map<String, Integer> getStats();
    // 최신 후기 리스트 리턴
    List<CommentVO> getRecentReviews();
}