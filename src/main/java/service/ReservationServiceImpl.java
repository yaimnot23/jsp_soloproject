package service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import domain.ReservationVO;
import repository.ReservationDAO;
import repository.ReservationDAOImpl;

public class ReservationServiceImpl implements ReservationService {
    private static final Logger log = LoggerFactory.getLogger(ReservationServiceImpl.class);
    private ReservationDAO rdao;
    
    public ReservationServiceImpl() {
        rdao = new ReservationDAOImpl();
    }

    @Override
    public int reserve(ReservationVO rvo) {
        return rdao.insert(rvo);
    }

    @Override
    public List<ReservationVO> getList() {
        return rdao.selectList();
    }
}