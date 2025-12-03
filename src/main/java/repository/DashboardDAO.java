package repository;
import java.util.List;
import domain.CommentVO;

public interface DashboardDAO {
    int getTotalRoomCount();
    int getStatusCount(String status);
    int getTotalRsvCount();
    List<CommentVO> getRecentComments();
}