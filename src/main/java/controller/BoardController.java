package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.RoomVO;
import service.BoardService;
import service.BoardServiceImpl;

@WebServlet("/brd/*")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 15     // 15MB
)
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 여기 이름을 logger에서 log로 통일했습니다.
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	private RequestDispatcher rdp;
	private String destPage;
	private BoardService bsv;
       
    public BoardController() {
        bsv = new BoardServiceImpl();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/") + 1);
		
		log.info(">>> 요청 경로(path): " + path);
		
		switch(path) {
		case "register":
			destPage = "/register.jsp";
			break;
			
		case "insert":
			try {
				// 1. 파일 저장 경로 설정 (webapp/upload 폴더)
				String savePath = getServletContext().getRealPath("/upload");
				File fileSaveDir = new File(savePath);
				if (!fileSaveDir.exists()) fileSaveDir.mkdirs();

				// 2. 파라미터 받기
				String roomNum = request.getParameter("roomNum");
				String roomType = request.getParameter("roomType");
				// 숫자 변환 시 공백이나 null 체크가 필요할 수 있으나 일단 진행
				int price = Integer.parseInt(request.getParameter("price"));
				String content = request.getParameter("content");

				// 3. 파일 처리
				Part filePart = request.getPart("imageFile");
				String fileName = getFileName(filePart);
				
				if (fileName != null && !fileName.isEmpty()) {
					filePart.write(savePath + File.separator + fileName);
				} else {
					fileName = "default.jpg";
				}

				// 4. DB 저장
				RoomVO rvo = new RoomVO(roomNum, roomType, price, content, fileName);
				int isOk = bsv.register(rvo);
				log.info(">>> 글 등록 성공여부: " + (isOk > 0 ? "성공" : "실패"));

				destPage = "/index.jsp";

			} catch (Exception e) {
				e.printStackTrace();
				log.info(">>> 파일 업로드 및 등록 중 에러 발생");
			}
			break;

		case "list":
			log.info(">>> 리스트 진입");
			// 1. 화면에서 보낸 검색어 받기
			String status = request.getParameter("status");
			String keyword = request.getParameter("keyword");
			
			// 2. DB에서 검색 결과 가져오기
			List<RoomVO> list = bsv.getList(status, keyword);
			
			// 3. 화면으로 데이터 보내기
			request.setAttribute("list", list);
			
			destPage = "/list.jsp";
			break;
			
		case "detail": 
			// 1. 글 번호 받기
			int rno = Integer.parseInt(request.getParameter("rno"));
			// 2. DB에서 가져오기
			RoomVO rvo = bsv.getDetail(rno);
			// 3. 화면으로 보내기
			request.setAttribute("rvo", rvo);
			destPage = "/detail.jsp";
			break;
			
		case "modify": 
			// 수정 화면으로 이동 (데이터 들고 가야 함)
			rno = Integer.parseInt(request.getParameter("rno"));
			rvo = bsv.getDetail(rno);
			request.setAttribute("rvo", rvo);
			destPage = "/modify.jsp";
			break;
			
		case "update":
			try {
				String savePath = getServletContext().getRealPath("/upload");
				
				// 파라미터 수집
				rno = Integer.parseInt(request.getParameter("rno"));
				String roomNum = request.getParameter("roomNum");
				String roomType = request.getParameter("roomType");
				int price = Integer.parseInt(request.getParameter("price"));
				String content = request.getParameter("content");
				String roomStatus = request.getParameter("roomStatus");
				
				// 기존 파일명 가져오기 (hidden으로 보낼 예정)
				String oldFile = request.getParameter("old_imageFile");
				
				// 새 파일 처리
				Part filePart = request.getPart("imageFile");
				String newFile = getFileName(filePart);
				
				String saveFile = oldFile; // 기본값은 기존 파일
				
				if(newFile != null && !newFile.isEmpty()) {
					// 새 파일이 들어왔으면 덮어쓰기
					saveFile = newFile;
					filePart.write(savePath + File.separator + saveFile);
				}
				
				// 객체 생성 (이미지 파일명은 결정된 saveFile 사용)
				RoomVO updateRvo = new RoomVO(roomNum, roomType, price, content, saveFile);
				updateRvo.setRno(rno);
				updateRvo.setRoomStatus(roomStatus);
				
				bsv.modify(updateRvo);
				
				// 수정 후 상세 페이지로 이동
				destPage = "/brd/detail?rno="+rno;
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
						
		case "status":
			// 1. 파라미터 받기 (바꿀 상태값과 방 번호)
			String newStatus = request.getParameter("status");
			rno = Integer.parseInt(request.getParameter("rno"));
			
			// 2. VO에 담아서 DB 업데이트 요청
			RoomVO statusRvo = new RoomVO();
			statusRvo.setRno(rno);
			statusRvo.setRoomStatus(newStatus);
			
			bsv.statusChange(statusRvo);
			
			// 3. 다시 목록으로 돌아가기 (새로고침 효과)
			destPage = "/brd/list";
			break;
			
		case "remove":
			rno = Integer.parseInt(request.getParameter("rno"));
			// 파일 삭제 기능은 생략 (DB만 삭제)
			bsv.remove(rno);
			destPage = "/brd/list"; // 목록으로 이동
			break;
			
		default:
			log.info(">>> 잘못된 경로");
			destPage = "/index.jsp";
			break;
		}
		
		// 페이지 이동
		rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}
	
	// 파일명 추출 도우미 메서드
	private String getFileName(Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 2, content.length() - 1);
			}
		}
		return "";
	}
}