package storemanager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import crypt.BCrypt;
import store.dto.StoreMemberDTO;
import storemanager.dao.StoreManagerDAO;
import storemanager.dto.StoreManagerDTO;

/**
 * Servlet implementation class StoreManagerController
 */
@WebServlet("/storemanager_servlet/*")
public class StoreManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		StoreManagerDAO dao=new StoreManagerDAO();
		if(url.indexOf("insertManager.do")!=-1) {
			StoreManagerDTO dto=new StoreManagerDTO();
			String managername=request.getParameter("managername");
			String managerid=request.getParameter("managerid");
			String passwd=BCrypt.hashpw(request.getParameter("passwd"), BCrypt.gensalt());
			String manageremail=request.getParameter("manageremail");
			String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"
			+request.getParameter("phone3");
			String birthday=request.getParameter("birthday1")+"년"+request.getParameter("birthday2")+"월"
			+request.getParameter("birthday3")+"일";
			String postcode=request.getParameter("postcode");
			String address=request.getParameter("address");
			String address2=request.getParameter("address2");
			System.out.println(managername+managerid+manageremail);
			dto.setManagername(managername);
			dto.setManagerid(managerid);
			dto.setPasswd(passwd);
			dto.setManageremail(manageremail);
			dto.setPhone(phone);
			dto.setBirthday(birthday);
			dto.setPostcode(postcode);
			dto.setAddress(address);
			dto.setAddress2(address2);
			dao.insertManager(dto);
			String page="/BSProject/manager_index.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);			
		}else if(url.indexOf("loginManager.do")!=-1) {
			StoreManagerDTO dto=new StoreManagerDTO();
			String managerid=request.getParameter("managerid");
			String passwd=request.getParameter("passwd");
			dto.setManagerid(managerid);
			String result="";
			String message="";
			result=dao.passwdManagerCheck(managerid,passwd);
			StoreManagerDTO dto2=dao.storeManagerDetail(managerid);
			managerid=dto2.getManagerid();
			String manager=dto2.getManager();
			String manageremail=dto2.getManageremail();
			String managername=dto2.getManagername();
			String page="/BSProject/manager_login.jsp";
			if(!result.equals("로그인실패")){
				HttpSession session=request.getSession();
				session.setAttribute("result",result);
				session.setAttribute("managerid",managerid);
				session.setAttribute("manageremail",manageremail);
				session.setAttribute("managername",managername);
				session.setAttribute("manager",manager);
				page="/BSProject/manager_member_index.jsp";
				response.sendRedirect(contextPath+page);					
			}else {
				response.sendRedirect(contextPath+page);
			}			
		}else if (url.indexOf("logoutManager.do")!=-1) {//로그아웃 처리
			//세션객체 생성
			HttpSession session=request.getSession();
			//세션을 비움(초기화)
			session.invalidate();
			//로그인 페이지로 이동
			String page=request.getContextPath()+"/BSProject/manager_login.jsp";
			response.sendRedirect(page);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
