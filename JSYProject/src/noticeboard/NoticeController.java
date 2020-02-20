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

/**
 * Servlet implementation class NoticeController
 */
@WebServlet("/notice_servlet/*")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//클라이언트에서 요청한 주소

		String url=request.getRequestURL().toString();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String contextPath=request.getContextPath();
		NoticeBoardDAO dao=new NoticeBoardDAO();
		if(url.indexOf("noticeList.do")!=-1){
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
			String page="/BSProject/manager_notice_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insert_notice.do")!=-1) {
			String managerid=request.getParameter("managerid");
			String subject=request.getParameter("subject");
			String contents=request.getParameter("contents");
			String passwd=request.getParameter("passwd");
			NoticeBoardDTO dto= new NoticeBoardDTO();
			dto.setManagerid(managerid);
			dto.setSubject(subject);
			dto.setContents(contents);
			dto.setPasswd(passwd);
			dao.noticeInsert(dto);
			String page="/BSProject/manager_notice_index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("noticeView.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//조회수 증가처리
			dao.noticePlusReadCount(num, session);
			//줄바꿈처리
			NoticeBoardDTO dto=dao.noticeViewReplace(num);
//			BoardDTO dto=dao.view(num);
			request.setAttribute("dto", dto);
			String page="/BSProject/manager_notice_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("noticeCommentList.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
		    //댓글 목록 리턴
			List<NoticeBoardCommentDTO> list=dao.noticeCommentList(num);
			request.setAttribute("list",list);
			//출력페이지 이동
			String page="/BSProject/manager_notice_comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("noticeComment_add.do")!=-1) {
			NoticeBoardCommentDTO dto=new NoticeBoardCommentDTO();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String managerid=request.getParameter("managerid");
			String contents=request.getParameter("contents");
			dto.setBoard_num(board_num);
			dto.setManagerid(managerid);
			dto.setContents(contents);
			dao.noticeCommentAdd(dto);
			//이곳은 백그라운드로 실행되기 때문에 어디로 page이동이 불필요
		}else if(url.indexOf("noticeDelete.do")!=-1) {
			int num=Integer.parseInt(request.getParameter("num"));
			
			dao.noticeDelete(num);
			String page="/BSProject/manager_notice_index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("noticeUpdate.do")!=-1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String managerid=request.getParameter("managerid");
			String subject=request.getParameter("subject");
			String contents=request.getParameter("contents");
			String passwd=request.getParameter("passwd");	
			NoticeBoardDTO dto= new NoticeBoardDTO();
			dto.setManagerid(managerid);
			dto.setSubject(subject);
			dto.setContents(contents);
			dto.setPasswd(passwd);
			dto.setNum(num);
			dao.noticeUpdate(dto);
			String page="/BSProject/manager_notice_index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("noticePass_check.do")!=-1) {
			//게시물 번호
			int num=Integer.parseInt(request.getParameter("num"));
			//비밀번호 확인
			String passwd=request.getParameter("passwd");
			//비번 check
			String result=dao.noticePasswdCheck(num,passwd);
			String page="";
			if(result!=null){//비밀번호가 맞으면
				page="/BSProject/manager_notice_edit.jsp";
				request.setAttribute("dto", dao.noticeViewReplace(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
		}else {//비밀번호가 틀리면
			page=contextPath+"/notice_servlet/noticeView.do?num="+num+"&message=error";
			response.sendRedirect(page);
		}
	}
}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
