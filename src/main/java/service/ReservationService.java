package service;

import java.util.List;
import domain.ReservationVO;

public interface ReservationService {
    int reserve(ReservationVO rvo);
    List<ReservationVO> getList();
}