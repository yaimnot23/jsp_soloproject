package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommentVO;
import service.DashboardService;
import service.DashboardServiceImpl;

@WebServlet("/dash/*")
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DashboardService dsv;
       
    public DashboardController() {
        dsv = new DashboardServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String path = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
		
		if(path.equals("main")) {
			// 1. 통계 데이터 가져오기 (총 객실, 빈방, 사용중 등)
			Map<String, Integer> stats = dsv.getStats();
			request.setAttribute("stats", stats);
			
			// 2. 최신 후기 가져오기
			List<CommentVO> recentReviews = dsv.getRecentReviews();
			request.setAttribute("recentReviews", recentReviews);
			
			// 3. 대시보드 화면으로 이동
			RequestDispatcher rdp = request.getRequestDispatcher("/dashboard.jsp");
			rdp.forward(request, response);
		}
	}
}