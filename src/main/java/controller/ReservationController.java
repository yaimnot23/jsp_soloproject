package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.ReservationVO;
import service.ReservationService;
import service.ReservationServiceImpl;

@WebServlet("/rsv/*")
public class ReservationController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger log = LoggerFactory.getLogger(ReservationController.class);
    
    private RequestDispatcher rdp;
    private String destPage;
    private ReservationService rsvService;
       
    public ReservationController() {
        rsvService = new ReservationServiceImpl();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String uri = request.getRequestURI();
        String path = uri.substring(uri.lastIndexOf("/") + 1);
        
        log.info(">>> Reservation Path: " + path);
        
        switch(path) {
        case "join":
            // 예약 화면으로 이동 (방 번호와 호수를 받아서 넘김)
            request.setAttribute("rno", request.getParameter("rno"));
            request.setAttribute("roomNum", request.getParameter("roomNum"));
            destPage = "/reserve.jsp";
            break;
            
        case "register":
            // 예약 데이터 저장
            try {
                int rno = Integer.parseInt(request.getParameter("rno"));
                String roomNum = request.getParameter("roomNum");
                String guestName = request.getParameter("guestName");
                String guestPhone = request.getParameter("guestPhone");
                String checkIn = request.getParameter("checkIn");
                String checkOut = request.getParameter("checkOut");
                
                ReservationVO rvo = new ReservationVO(rno, roomNum, guestName, guestPhone, checkIn, checkOut);
                rsvService.reserve(rvo);
                log.info(">>> 예약 완료");
                
                destPage = "/rsv/list"; // 예약 목록으로 이동
            } catch (Exception e) {
                e.printStackTrace();
            }
            break;
            
        case "list":
            // 예약 현황 보기
            List<ReservationVO> list = rsvService.getList();
            request.setAttribute("list", list);
            destPage = "/reserve_list.jsp";
            break;
        }
        
        rdp = request.getRequestDispatcher(destPage);
        rdp.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }
}