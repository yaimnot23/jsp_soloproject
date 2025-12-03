package repository;

import java.util.List;
import domain.ReservationVO;

public interface ReservationDAO {
    int insert(ReservationVO rvo);
    List<ReservationVO> selectList();
}