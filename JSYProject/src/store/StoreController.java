package store;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import board.Pager;
import board.dto.BoardDTO;
import crypt.BCrypt;
import store.dao.StoreMemberDAO;
import store.dto.StoreMemberDTO;


@WebServlet("/store_servlet/*")
public class StoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		StoreMemberDAO dao=new StoreMemberDAO();
		if(url.indexOf("insertmember.do")!=-1) {
			StoreMemberDTO dto=new StoreMemberDTO();
			String username=request.getParameter("username");
			String userid=request.getParameter("userid");
			String passwd=BCrypt.hashpw(request.getParameter("passwd"), BCrypt.gensalt());
//			String passwd=request.getParameter("passwd");
			String useremail=request.getParameter("useremail");
			String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"
			+request.getParameter("phone3");
			String birthday=request.getParameter("birthday1")+"년"+request.getParameter("birthday2")+"월"
			+request.getParameter("birthday3")+"일";
			String postcode=request.getParameter("postcode");
			String address=request.getParameter("address");
			String address2=request.getParameter("address2");
			System.out.println(username);
			dto.setUsername(username);
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setUseremail(useremail);
			dto.setPhone(phone);
			dto.setBirthday(birthday);
			dto.setPostcode(postcode);
			dto.setAddress(address);
			dto.setAddress2(address2);
			dao.insertMember(dto);
			String page="/BSProject/login.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);			
		}else if(url.indexOf("loginstore.do")!=-1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			StoreMemberDTO dto=new StoreMemberDTO();
			dto.setUserid(userid);
			String result="";
			result=dao.passwdCheck(userid,passwd);
			StoreMemberDTO dto2=dao.storememberDetail(userid);
			userid=dto2.getUserid();
			String email=dto2.getUseremail();
			String postcode=dto2.getPostcode();
			String address=dto2.getAddress();
			String address2=dto2.getAddress2();
			String username=dto2.getUsername();
			String page="/BSProject/login.jsp?message=error";
			if(!result.equals("로그인실패")){
				HttpSession session=request.getSession();
				session.setAttribute("userid",userid);
				session.setAttribute("email",email);
				session.setAttribute("postcode",postcode);
				session.setAttribute("address",address);
				session.setAttribute("address2",address2);
				session.setAttribute("username",username);
				session.setAttribute("result",result);
				page="/BSProject/index.jsp";
				response.sendRedirect(contextPath+page);				
			}else {
				response.sendRedirect(contextPath+page);
			}			
		}else if(url.indexOf("member_list.do")!=-1) {
			int count=dao.memberCount();
			System.out.println(count);
			//페이지 나누기를 위한 처리
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<StoreMemberDTO> list=dao.memberList(start,end);
			request.setAttribute("list",list);
			//페이지 네비게이션 출력을 위한 정보전달
			request.setAttribute("page", pager);
			String page="/BSProject/manager_member_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("member_view.do")!=-1) {
			int usernum=Integer.parseInt(request.getParameter("usernum"));
			//줄바꿈처리
			StoreMemberDTO dto=dao.memberViewReplace(usernum);
			request.setAttribute("dto", dto);
			System.out.println(dto);
			String page="/BSProject/manager_member_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);		
		}else if(url.indexOf("member_search.do")!=-1){
			String keyword=request.getParameter("keyword");
			String search_option=request.getParameter("search_option");
			int count=dao.countMemberSearch(search_option,keyword);
			System.out.println(count);
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<StoreMemberDTO> list=dao.memberSearchList(search_option,keyword,start,end);
			System.out.println(list);
			request.setAttribute("list",list);
			request.setAttribute("page", pager);
			request.setAttribute("keyword", keyword);
		String page="/BSProject/manager_member_search.jsp";
/*					response.sendRedirect(contextPath+page);*/
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if (url.indexOf("logoutstore.do")!=-1) {//로그아웃 처리
			//세션객체 생성
			HttpSession session=request.getSession();
			//세션을 비움(초기화)
			session.invalidate();
			//로그인 페이지로 이동
			String page=request.getContextPath()+"/BSProject/login.jsp?message=logout";
			response.sendRedirect(page);
		}else if(url.indexOf("memberDelete.do")!=-1){
			int usernum=Integer.parseInt(request.getParameter("usernum"));
			dao.memberDelete(usernum);
			String page="/BSProject/manager_member_index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("memberUpdate.do")!=-1){
			int usernum=Integer.parseInt(request.getParameter("usernum"));
			StoreMemberDTO dto=new StoreMemberDTO();
			String username=request.getParameter("username");
			String userid=request.getParameter("userid");
			String useremail=request.getParameter("useremail");
			String phone=request.getParameter("phone");
			String birthday=request.getParameter("birthday");
			String postcode=request.getParameter("postcode");
			String address=request.getParameter("address");
			String address2=request.getParameter("address2");
			dto.setUsername(username);
			dto.setUserid(userid);
			dto.setUseremail(useremail);
			dto.setPhone(phone);
			dto.setBirthday(birthday);
			dto.setPostcode(postcode);
			dto.setAddress(address);
			dto.setAddress2(address2);
			dto.setUsernum(usernum);
			dao.memberUpdate(dto);
			String page="/BSProject/manager_member_index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("memberMain_view.do")!=-1) {
			String userid=request.getParameter("userid");
			//줄바꿈처리
			StoreMemberDTO dto=dao.memberMainViewReplace(userid);
			request.setAttribute("dto", dto);
			System.out.println(dto);
			String page="/BSProject/member_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
