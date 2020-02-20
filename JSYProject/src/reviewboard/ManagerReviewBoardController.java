package reviewboard;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import reviewboard.dao.ReviewBoardDAO;
import reviewboard.dto.ReviewBoardCommentDTO;
import reviewboard.dto.ReviewBoardDTO;

@WebServlet("/managerreviewboard_servlet/*")
public class ManagerReviewBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String contextPath=request.getContextPath();
		ReviewBoardDAO dao=new ReviewBoardDAO();
		if(url.indexOf("reviewList.do")!=-1){
			//레코드 갯수 계산
			int count=dao.reviewCount();
			//페이지 나누기를 위한 처리
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			System.out.println(curPage);
			ReviewPager pager=new ReviewPager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<ReviewBoardDTO> list=dao.reviewList(start,end);
			request.setAttribute("list",list);
			//페이지 네비게이션 출력을 위한 정보전달
			request.setAttribute("page", pager);
			String page="/BSProject/manager_reviewBoard_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		
		}else if(url.indexOf("reviewBoard_insert.do")!=-1){
			//파일업로드 처리
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드 디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			MultipartRequest multi=new MultipartRequest(request,Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD,"utf-8",new DefaultFileRenamePolicy());
					
			
			String userid=multi.getParameter("userid");
			String subject=multi.getParameter("subject");
			String contents=multi.getParameter("contents");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소 
			String filename=" ";//공백 1개
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음요소가 있으면
				while(files.hasMoreElements()){
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 !=null) {
						filesize=(int)f1.length();//파일의 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			ReviewBoardDTO dto=new ReviewBoardDTO();
		
			dto.setUserid(userid);
			dto.setSubject(subject);
			dto.setContents(contents);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//파일 첨부하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			if(filename==null || filename.trim().equals("")){
				filename="-";
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			dao.reviewInsert(dto);
			String page="/managerreviewboard_servlet/reviewList.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("reviewDownload.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao.reviewGetFileName(num);
			System.out.println("첨부파일 이름 : "+filename);
			//다운로드 할 파일경로
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[10000];//바이트배열 생성
			//서버에 저장된 파일을 읽기 위한 스트림 생성
			FileInputStream fis=new FileInputStream(path);
			//mimeType(파일의 종류-img, mp3, txt..등)
			String mimeType=getServletContext().getMimeType(path);
			if(mimeType==null){
				mimeType="application/octet-stream;charset=utf-8";
			}
			//파일 이름 한글이 포함된 경우 header 값을 보내게 되는데
			//header에는 한글이나 특수문자가 올 수 없기 때문에
			//8859_1 (서유럽언어)를 utf-8로 변환해서 
			//한글,특수문자 처리를 해야함.
			filename=new String(filename.getBytes("utf-8"),"8859_1");
			//http header
			response.setHeader("contents-Disposition", "attachment;filename="+filename);
			//OutputStream 생성(서버에서 클라이언트에 쓰기)
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true){
				numRead=fis.read(b,0,b.length);//데이터 읽음
				if(numRead==-1) break;//더이상 내용이 없으면
				out.write(b,0,numRead);//데이터 쓰기
			}
			//파일 처리 관련 리소스 정리
			out.flush();
			out.close();
			fis.close();
			//다운로드 횟수 증가 처리
			dao.reviewPlusDown(num);
		}else if(url.indexOf("managerReviewView.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//조회수 증가처리
			dao.reviewPlusReadCount(num, session);
			//줄바꿈처리
			ReviewBoardDTO dto=dao.reviewViewReplace(num);
//			ReviewBoardDTO dto=dao.view(num);
			request.setAttribute("dto", dto);
			String page="/BSProject/manager_reviewBoard_edit.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("reviewCommentList.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호 : "+num);
		    //댓글 목록 리턴
			List<ReviewBoardCommentDTO> list=dao.reviewCommentList(num);
			request.setAttribute("list",list);
			System.out.println(list);
			//출력페이지 이동
			String page="/BSProject/manager_reviewBoard_comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("reviewComment_add.do")!=-1){
			ReviewBoardCommentDTO dto=new ReviewBoardCommentDTO();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String userid=request.getParameter("userid");
			System.out.println(userid);
			String contents=request.getParameter("contents");
			System.out.println(contents);
			dto.setBoard_num(board_num);
			dto.setUserid(userid);
			dto.setContents(contents);
			dao.reviewCommentAdd(dto);
			//이곳은 백그라운드로 실행되기 때문에 어디로 page이동이 불필요
		}else if(url.indexOf("reviewReply.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			ReviewBoardDTO dto=dao.reviewView(num);
			dto.setContents("===게시물의 내용===\n"+dto.getContents());
			request.setAttribute("dto",dto);
			String page="/BSProject/manager_reviewBoard_reply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("reviewInsertReply.do")!=-1){
			int num=Integer.parseInt(request.getParameter("num"));
			ReviewBoardDTO dto=dao.reviewView(num);
			int ref=dto.getRef();//답변 그룹 번호
			int re_step=dto.getRe_step()+1;//출력 순번
			int re_level=dto.getRe_level()+1;//답변 단계
			String userid=request.getParameter("userid");
			String subject=request.getParameter("subject");
			String contents=request.getParameter("contents");
			String passwd=request.getParameter("passwd");
			dto.setUserid(userid);
			dto.setSubject(subject);
			dto.setContents(contents);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_step(re_step);
			dto.setRe_level(re_level);
			//첨부파일 관련 정보
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);
			//답글 순서 조정
			dao.reviewUpdateStep(ref,re_step);
			//답글 쓰기
			dao.reviewReply(dto);
			//목록으로 이동
			String page="/managerreviewboard_servlet/reviewList.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("reviewPass_check.do")!=-1){
			//게시물 번호
			int num=Integer.parseInt(request.getParameter("num"));
			//비밀번호 확인
			String passwd=request.getParameter("passwd");
			//비번 check
			String result=dao.reviewPasswdCheck(num,passwd);
			String page="";
			if(result!=null){//비밀번호가 맞으면
				page="/BSProject/manager_reviewBoard_edit.jsp";
				request.setAttribute("dto", dao.reviewView(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//비밀번호가 틀리면
				page=contextPath+"/managerreviewboard_servlet/reviewView.do?num="+num+"&message=error";
				response.sendRedirect(page);
			}
		}else if(url.indexOf("reviewUpdate.do")!=-1){
			//파일업로드 처리
			//디렉토리가 없으면 생성
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드 디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			MultipartRequest multi=new MultipartRequest(request,Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD,"utf-8",new DefaultFileRenamePolicy());
			//requst.getParameter 대신 multi.getParameter로 바꿔야함
			//MultipartRequest를 쓰는 순간 			
			int num=Integer.parseInt(multi.getParameter("num"));
			String userid=multi.getParameter("userid");
			String subject=multi.getParameter("subject");
			String contents=multi.getParameter("contents");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소 
			String filename=" ";//공백 1개
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음요소가 있으면
				while(files.hasMoreElements()){
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 !=null) {
						filesize=(int)f1.length();//파일의 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			ReviewBoardDTO dto=new ReviewBoardDTO();
			dto.setNum(num);
			dto.setUserid(userid);
			dto.setSubject(subject);
			dto.setContents(contents);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//파일 첨부하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			if(filename==null || filename.trim().equals("")){
				//새로운 첨부파일이 없을 때(테이블의 기존정보를 가져옴)
				ReviewBoardDTO dto2=dao.reviewView(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else {
				//새로운 첨부파일이 있을때
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			//첨부파일 삭제 처리
			String fileDel=multi.getParameter("fileDel");
			
			//체크박스에 체크되었으면, value없이 썼기때문에 on이 디폴트가 됨
			if(fileDel != null && fileDel.equals("on")) {
				String fileName=dao.reviewGetFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete();//파일 삭제
				//첨부파일 정보를 지움
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			//레코드 수정
			dao.reviewUpdate(dto);
			//페이지 이동
			String page="/BSProject/manager_reviewBoard_index.jsp";
			response.sendRedirect(contextPath+page);			
		}else if(url.indexOf("reviewDelete.do")!=-1){
			//파일 업로드를 안쓰더라도 MultipartRequest 처리해야한다.
			MultipartRequest multi=new MultipartRequest(request,Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD,"utf-8",new DefaultFileRenamePolicy());
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			System.out.println(num);
			dao.reviewDelete(num);
			//페이지 이동
			String page="/BSProject/manager_reviewBoard_index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("reviewSearch.do")!=-1){
				String keyword=request.getParameter("keyword");
				String search_option=request.getParameter("search_option");
				System.out.println(keyword);
				System.out.println(search_option);
				int count=dao.reviewCountSearch(search_option,keyword);

				int curPage=1;
				if(request.getParameter("curPage")!=null) {
					curPage=Integer.parseInt(request.getParameter("curPage"));
				}
				ReviewPager pager=new ReviewPager(count, curPage);
				int start=pager.getPageBegin();
				int end=pager.getPageEnd();
				List<ReviewBoardDTO> list=dao.reviewSearchList(search_option,keyword,start,end);
				/*					List<ReviewBoardDTO> list2=dao.list(start,end);*/	
				System.out.println(list);
				request.setAttribute("list",list);
				request.setAttribute("page", pager);
				request.setAttribute("search_option",search_option);
				request.setAttribute("keyword", keyword);
/*                    String page="/reviewboard_servlet/list.do";*/
			String page="/BSProject/manager_reviewBoard_search.jsp";
/*					response.sendRedirect(contextPath+page);*/
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		doGet(request, response);
	}

}
