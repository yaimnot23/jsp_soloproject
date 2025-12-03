package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/mem/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	private RequestDispatcher rdp;
	private String destPage;
	private MemberService msv;
       
    public MemberController() {
        msv = new MemberServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/") + 1);
		
		log.info(">>> Member Path: " + path);
		
		switch(path) {
		case "join": // 회원가입 페이지 이동
			destPage = "/join.jsp";
			break;
			
		case "register": // 회원가입 실행
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			
			MemberVO mvo = new MemberVO(id, pwd, email);
			int isOk = msv.register(mvo);
			log.info(">>> 회원가입 " + (isOk>0 ? "성공" : "실패"));
			
			destPage = "/index.jsp"; // 가입 후 홈으로
			break;
			
		case "loginPage": // 로그인 페이지 이동
			destPage = "/login.jsp";
			break;
			
		case "login": // 로그인 실행
			String loginId = request.getParameter("id");
			String loginPwd = request.getParameter("pwd");
			
			MemberVO loginMvo = msv.login(new MemberVO(loginId, loginPwd));
			
			if(loginMvo != null) {
				// 로그인 성공! 세션에 정보 저장
				HttpSession session = request.getSession();
				session.setAttribute("ses", loginMvo);
				// 세션 유지 시간 설정 (30분)
				session.setMaxInactiveInterval(60 * 30); 
				log.info(">>> 로그인 성공: " + loginMvo.getId());
				destPage = "/index.jsp";
			} else {
				// 로그인 실패
				log.info(">>> 로그인 실패");
				request.setAttribute("msg_login", 0); // 실패 메시지용
				destPage = "/login.jsp";
			}
			break;
			
		case "logout": // 로그아웃
			HttpSession session = request.getSession();
			session.invalidate(); // 세션 전체 삭제
			log.info(">>> 로그아웃 완료");
			destPage = "/index.jsp";
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