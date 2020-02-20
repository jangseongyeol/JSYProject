package noticeboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.Pager;
import noticeboard.dao.NoticeBoardDAO;
import noticeboard.dto.NoticeBoardCommentDTO;
import noticeboard.dto.NoticeBoardDTO;


@WebServlet("/noticemain_servlet/*")
public class NoticeMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String contextPath=request.getContextPath();
		NoticeBoardDAO dao=new NoticeBoardDAO();

		if(url.indexOf("noticeMain.do")!=-1){
			//레코드 갯수 계산
			int count=dao.noticeCount();
			System.out.println(count);
			//페이지 나누기를 위한 처리
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			System.out.println(curPage);
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<NoticeBoardDTO> list=dao.noticeList(start,end);
			request.setAttribute("list",list);
			//페이지 네비게이션 출력을 위한 정보전달
			request.setAttribute("page", pager);
			String page="/BSProject/notice_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("main_noticeView.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//조회수 증가처리
			dao.noticePlusReadCount(num, session);
			//줄바꿈처리
			NoticeBoardDTO dto=dao.noticeViewReplace(num);
//			BoardDTO dto=dao.view(num);
			request.setAttribute("dto", dto);
			String page="/BSProject/notice_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("main_noticeCommentList.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
		    //댓글 목록 리턴
			List<NoticeBoardCommentDTO> list=dao.noticeCommentList(num);
			request.setAttribute("list",list);
			//출력페이지 이동
			String page="/BSProject/noticeComment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {


		doGet(request, response);
	}

}
