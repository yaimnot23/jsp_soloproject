package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domain.CommentVO;
import service.CommentService;
import service.CommentServiceImpl;

@WebServlet("/cmt/*")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommentService csv;
       
    public CommentController() {
        csv = new CommentServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String path = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1);
		
		if(path.equals("register")) {
			// 후기 등록
			int rno = Integer.parseInt(request.getParameter("rno"));
			String writer = request.getParameter("writer");
			String content = request.getParameter("content");
			int rating = Integer.parseInt(request.getParameter("rating"));
			
			CommentVO cvo = new CommentVO(rno, writer, content, rating);
			csv.post(cvo);
			
			// 다시 상세 페이지로 돌아가기
			response.sendRedirect("/brd/detail?rno=" + rno);
			
		} else if(path.equals("remove")) {
			// 후기 삭제
			int cno = Integer.parseInt(request.getParameter("cno"));
			int rno = Integer.parseInt(request.getParameter("rno"));
			
			csv.remove(cno);
			
			response.sendRedirect("/brd/detail?rno=" + rno);
		}
	}
}