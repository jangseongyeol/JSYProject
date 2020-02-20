package storeproduct;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.Pager;
import board.dto.BoardDTO;
import common.Constants;
import storeproduct.dao.StoreProductDAO;
import storeproduct.dto.StoreProductDTO;


@WebServlet("/product_servlet/*")
public class StoreProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String url=request.getRequestURL().toString();
		//컨텍스트 패스(웹프로젝트의 식별자)
		String contextPath=request.getContextPath();
		StoreProductDAO dao=new StoreProductDAO();
		if(url.indexOf("product_insert.do")!=-1){
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드 디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			MultipartRequest multi=new MultipartRequest(request,Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD,"utf-8",new DefaultFileRenamePolicy());
					
			
			String mainmenu=multi.getParameter("mainmenu");
			String submenu=multi.getParameter("submenu");
			String productname=multi.getParameter("productname");
			String price=multi.getParameter("price");
			String product_color1=multi.getParameter("product_color1");
			String product_color2="";
			String product_color3="";
			String product_color4="";
			String product_color5="";
			String product_color6="";
			if(!("".equals(multi.getParameter("product_color2"))) ) {
				product_color2=multi.getParameter("product_color2");
			}
			if(!("".equals(multi.getParameter("product_color3"))) ) {
			    product_color3=multi.getParameter("product_color3");
			}
			if(!("".equals(multi.getParameter("product_color4"))) ) {
				product_color4=multi.getParameter("product_color4");
			}
			if(!("".equals(multi.getParameter("product_color5"))) ) {
				product_color5=multi.getParameter("product_color5");
			}
			if(!("".equals(multi.getParameter("product_color6"))) ) {
				product_color6=multi.getParameter("product_color6");
			}
			String modelsize1=multi.getParameter("modelsize1");
			String modelsize2="";
			String modelsize3="";
			String modelsize4="";
			String modelsize5="";
			String modelsize6="";
			if(!("".equals(multi.getParameter("modelsize2"))) ) {
				modelsize2=multi.getParameter("modelsize2");
			}
			if(!("".equals(multi.getParameter("modelsize3"))) ) {
				modelsize3=multi.getParameter("modelsize3");
			}
			if(!("".equals(multi.getParameter("modelsize4"))) ) {
				modelsize4=multi.getParameter("modelsize4");
			}
			if(!("".equals(multi.getParameter("modelsize5"))) ) {
				modelsize5=multi.getParameter("modelsize5");
			}
			if(!("".equals(multi.getParameter("modelsize6"))) ) {
				modelsize6=multi.getParameter("modelsize6");
			}
			String productcontent=multi.getParameter("productcontent");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소 
			String filename0=" ";
			String filename1=" ";
			String filename2=" ";
			String filename3=" ";
			String filename4=" ";
			String filename5=" ";
			String filename6=" ";
			String filename7=" ";//공백 1개
			String filename8=" ";//공백 1개
			List<String> originFiles = new ArrayList<String>();
			List<String> saveFiles = new ArrayList<String>();
			Enumeration<String> files = multi.getFileNames();
			try {
				//다음요소가 있으면
				while(files.hasMoreElements()){
					String name=files.nextElement();
					saveFiles.add(multi.getFilesystemName(name));
	                originFiles.add(multi.getOriginalFileName(name));
	                System.out.println(originFiles);
				}
                   if(!("".equals(originFiles.get(originFiles.size()-1))) ) {
                	   filename0=originFiles.get(originFiles.size() -1);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-2))) ) {
                	   filename1=originFiles.get(originFiles.size() -2);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-3))) ) {
                	   filename2=originFiles.get(originFiles.size() -3);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-4))) ) {
                	   filename3=originFiles.get(originFiles.size() -4);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-5))) ) {
                	   filename4=originFiles.get(originFiles.size() -5);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-6))) ) {
                	   filename5=originFiles.get(originFiles.size() -6);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-7))) ) {
                	   filename6=originFiles.get(originFiles.size() -7);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-8))) ) {
                	   filename7=originFiles.get(originFiles.size() -8);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-9))) ) {
                	   filename8=originFiles.get(originFiles.size() -9);
                   }
	
				/*	//첨부파일의 집합
			    Enumeration files = multi.getFileNames();
			    //첨부파일의 이름
			    while(files.hasMoreElements()){
			    String mainfile=(String)files.nextElement();
			    main_photo=multi.getOriginalFileName(mainfile);
			    if(files.hasMoreElements()) {
			    	String file0=(String)files.nextElement();
			    	filename0=multi.getOriginalFileName(file0);
			    }
			    if(files.hasMoreElements()) {
			    	String file1=(String)files.nextElement();
			    	filename1=multi.getOriginalFileName(file1);
			    }
			    if(files.hasMoreElements()) {
			    	String file2=(String)files.nextElement();
			    	filename2=multi.getOriginalFileName(file2);
			    }
			    if(files.hasMoreElements()) {
			    	String file3=(String)files.nextElement();
			    	filename3=multi.getOriginalFileName(file3);
			    }
			    if(files.hasMoreElements()) {
			    	String file4=(String)files.nextElement();
			    	filename4=multi.getOriginalFileName(file4);
			    }
			    if(files.hasMoreElements()) {
			    	String file5=(String)files.nextElement();
			    	filename5=multi.getOriginalFileName(file5);
			    }
			    if(files.hasMoreElements()) {
			    	String file6=(String)files.nextElement();
			    	filename6=multi.getOriginalFileName(file6);			    
			    }
			    if(files.hasMoreElements()) {
			    	String file7=(String)files.nextElement();	
			    	filename7=multi.getOriginalFileName(file7);
			    }
			    if(files.hasMoreElements()) {
			    	String file8=(String)files.nextElement();
			    	filename8=multi.getOriginalFileName(file8);
			    }
			  }*/

				
			} catch (Exception e) {
				e.printStackTrace();
			}
			StoreProductDTO dto=new StoreProductDTO();
			dto.setMainmenu(mainmenu);
			dto.setSubmenu(submenu);
			dto.setProductname(productname);
			dto.setPrice(price);
			dto.setProductcontent(productcontent);
			dto.setIp(ip);
			//파일 첨부하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			if(filename0==null || filename0.trim().equals("")){
				filename0="-";
			}
			if(filename1==null || filename1.trim().equals("")){
				filename1="-";
			}
			if(filename2==null || filename2.trim().equals("")){
				filename2="-";
			}
			if(filename3==null || filename3.trim().equals("")){
				filename3="-";
			}
			if(filename4==null || filename4.trim().equals("")){
				filename4="-";
			}
			if(filename5==null || filename5.trim().equals("")){
				filename5="-";
			}
			if(filename6==null || filename6.trim().equals("")){
				filename6="-";
			}
			if(filename7==null || filename7.trim().equals("")){
				filename7="-";
			}
			if(filename8==null || filename8.trim().equals("")){
				filename8="-";
			}
			if(product_color2==null || product_color2.trim().equals("")){
				product_color2=" ";
			}
			if(product_color3==null || product_color3.trim().equals("")){
				product_color3=" ";
			}
			if(product_color4==null || product_color4.trim().equals("")){
				product_color4=" ";
			}
			if(product_color5==null || product_color5.trim().equals("")){
				product_color5=" ";
			}
			if(product_color6==null || product_color6.trim().equals("")){
				product_color6=" ";
			}
			if(modelsize2==null || modelsize2.trim().equals("")){
				modelsize2=" ";
			}
			if(modelsize3==null || modelsize3.trim().equals("")){
				modelsize3=" ";
			}
			if(modelsize4==null || modelsize4.trim().equals("")){
				modelsize4=" ";
			}
			if(modelsize5==null || modelsize5.trim().equals("")){
				modelsize5=" ";
			}
			if(modelsize6==null || modelsize6.trim().equals("")){
				modelsize6=" ";
			}
		
			dto.setProduct_color1(product_color1);
			dto.setProduct_color2(product_color2);
			dto.setProduct_color3(product_color3);
			dto.setProduct_color4(product_color4);
			dto.setProduct_color5(product_color5);
			dto.setProduct_color6(product_color6);
			dto.setModelsize1(modelsize1);
			dto.setModelsize2(modelsize2);
			dto.setModelsize3(modelsize3);
			dto.setModelsize4(modelsize4);
			dto.setModelsize5(modelsize5);
			dto.setModelsize6(modelsize6);
			dto.setFilename0(filename0);
			dto.setFilename1(filename1);
			dto.setFilename2(filename2);
			dto.setFilename3(filename3);
			dto.setFilename4(filename4);
			dto.setFilename5(filename5);
			dto.setFilename6(filename6);
			dto.setFilename7(filename7);
			dto.setFilename8(filename8);
			dao.product_Insert(dto);
			String page="/BSProject/manager_product_index.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("product_list.do")!=-1) {
			int count=dao.product_count();
			System.out.println(count);
			//페이지 나누기를 위한 처리
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
				System.out.println(curPage);
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
//			System.out.println("list.do 호출");
			List<StoreProductDTO> list=dao.product_list(start,end);
			request.setAttribute("list",list);
			//페이지 네비게이션 출력을 위한 정보전달
			request.setAttribute("page", pager);
			String page="/BSProject/manager_product_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("product_view.do")!=-1) {
			int productid=Integer.parseInt(request.getParameter("productid"));
			HttpSession session=request.getSession();
			//조회수 증가처리
			dao.plusReadCount(productid, session);
			//줄바꿈처리
			StoreProductDTO dto=dao.product_viewReplace(productid);
			request.setAttribute("dto", dto);
			String page="/BSProject/manager_product_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);		
		}else if(url.indexOf("product_edit.do")!=-1) {
			int productid=Integer.parseInt(request.getParameter("productid"));
			System.out.println(productid);
			StoreProductDTO dto=dao.productView(productid);
			request.setAttribute("dto", dto);
			
			String page="/BSProject/manager_product_edit.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if(url.indexOf("product_update.do")!=-1) {
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드 디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			MultipartRequest multi=new MultipartRequest(request,Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD,"utf-8",new DefaultFileRenamePolicy());
					
			int productid=Integer.parseInt(request.getParameter("productid"));
			String mainmenu=multi.getParameter("mainmenu");
			String submenu=multi.getParameter("submenu");
			String productname=multi.getParameter("productname");
			String price=multi.getParameter("price");
			String product_color1=multi.getParameter("product_color1");
			String product_color2="";
			String product_color3="";
			String product_color4="";
			String product_color5="";
			String product_color6="";
			if(!("".equals(multi.getParameter("product_color2"))) ) {
				product_color2=multi.getParameter("product_color2");
			}
			if(!("".equals(multi.getParameter("product_color3"))) ) {
			    product_color3=multi.getParameter("product_color3");
			}
			if(!("".equals(multi.getParameter("product_color4"))) ) {
				product_color4=multi.getParameter("product_color4");
			}
			if(!("".equals(multi.getParameter("product_color5"))) ) {
				product_color5=multi.getParameter("product_color5");
			}
			if(!("".equals(multi.getParameter("product_color6"))) ) {
				product_color6=multi.getParameter("product_color6");
			}
			String modelsize1=multi.getParameter("modelsize1");
			String modelsize2="";
			String modelsize3="";
			String modelsize4="";
			String modelsize5="";
			String modelsize6="";
			if(!("".equals(multi.getParameter("modelsize2"))) ) {
				modelsize2=multi.getParameter("modelsize2");
			}
			if(!("".equals(multi.getParameter("modelsize3"))) ) {
				modelsize3=multi.getParameter("modelsize3");
			}
			if(!("".equals(multi.getParameter("modelsize4"))) ) {
				modelsize4=multi.getParameter("modelsize4");
			}
			if(!("".equals(multi.getParameter("modelsize5"))) ) {
				modelsize5=multi.getParameter("modelsize5");
			}
			if(!("".equals(multi.getParameter("modelsize6"))) ) {
				modelsize6=multi.getParameter("modelsize6");
			}
			String productcontent=multi.getParameter("productcontent"); 
			String filename0=" ";
			String filename1=" ";
			String filename2=" ";
			String filename3=" ";
			String filename4=" ";
			String filename5=" ";
			String filename6=" ";
			String filename7=" ";//공백 1개
			String filename8=" ";//공백 1개
			List<String> originFiles = new ArrayList<String>();
			List<String> saveFiles = new ArrayList<String>();
			Enumeration<String> files = multi.getFileNames();
			try {
				//다음요소가 있으면
				while(files.hasMoreElements()){
					String name=files.nextElement();
					System.out.println(name);
					saveFiles.add(multi.getFilesystemName(name));
	                originFiles.add(multi.getOriginalFileName(name));
	                System.out.println(originFiles);
				}
                   if(!("".equals(originFiles.get(originFiles.size()-1))) ) {
                	   filename0=originFiles.get(originFiles.size() -1);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-2))) ) {
                	   filename1=originFiles.get(originFiles.size() -2);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-3))) ) {
                	   filename2=originFiles.get(originFiles.size() -3);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-4))) ) {
                	   filename3=originFiles.get(originFiles.size() -4);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-5))) ) {
                	   filename4=originFiles.get(originFiles.size() -5);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-6))) ) {
                	   filename5=originFiles.get(originFiles.size() -6);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-7))) ) {
                	   filename6=originFiles.get(originFiles.size() -7);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-8))) ) {
                	   filename7=originFiles.get(originFiles.size() -8);
                   }
                   if(!("".equals(originFiles.get(originFiles.size()-9))) ) {
                	   filename8=originFiles.get(originFiles.size() -9);
                   }		
			} catch (Exception e) {
				e.printStackTrace();
			}
			StoreProductDTO dto=new StoreProductDTO();
			dto.setProductid(productid);
			dto.setMainmenu(mainmenu);
			dto.setSubmenu(submenu);
			dto.setProductname(productname);
			dto.setPrice(price);
			dto.setProductcontent(productcontent);
			//파일 첨부하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			if(filename0==null || filename0.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname0=dto2.getFilename0();
				dto.setFilename0(fname0);
			}else {
				dto.setFilename0(filename0);
			}
			if(filename1==null || filename1.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname1=dto2.getFilename1();
				dto.setFilename1(fname1);
			}else {
				dto.setFilename1(filename1);
			}
			if(filename2==null || filename2.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname2=dto2.getFilename2();
				dto.setFilename2(fname2);
			}else {
				dto.setFilename2(filename2);
			}
			if(filename3==null || filename3.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname3=dto2.getFilename3();
				dto.setFilename3(fname3);
			}else {
				dto.setFilename3(filename3);
			}
			if(filename4==null || filename4.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname4=dto2.getFilename4();
				dto.setFilename4(fname4);
			}else {
				dto.setFilename4(filename4);
			}
			if(filename5==null || filename5.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname5=dto2.getFilename5();
				dto.setFilename5(fname5);
			}else {
				dto.setFilename5(filename5);
			}
			if(filename6==null || filename6.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname6=dto2.getFilename6();
				dto.setFilename6(fname6);
			}else {
				dto.setFilename6(filename6);
			}
			if(filename7==null || filename7.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname7=dto2.getFilename7();
				dto.setFilename7(fname7);
			}else {
				dto.setFilename7(filename7);
			}
			if(filename8==null || filename8.trim().equals("")){
				StoreProductDTO dto2=dao.productView(productid);
				String fname8=dto2.getFilename8();
				dto.setFilename8(fname8);
			}else {
				dto.setFilename8(filename8);
			}
			if(product_color2==null || product_color2.trim().equals("")){
				product_color2=" ";
			}
			if(product_color3==null || product_color3.trim().equals("")){
				product_color3=" ";
			}
			if(product_color4==null || product_color4.trim().equals("")){
				product_color4=" ";
			}
			if(product_color5==null || product_color5.trim().equals("")){
				product_color5=" ";
			}
			if(product_color6==null || product_color6.trim().equals("")){
				product_color6=" ";
			}
			if(modelsize2==null || modelsize2.trim().equals("")){
				modelsize2=" ";
			}
			if(modelsize3==null || modelsize3.trim().equals("")){
				modelsize3=" ";
			}
			if(modelsize4==null || modelsize4.trim().equals("")){
				modelsize4=" ";
			}
			if(modelsize5==null || modelsize5.trim().equals("")){
				modelsize5=" ";
			}
			if(modelsize6==null || modelsize6.trim().equals("")){
				modelsize6=" ";
			}
		
			dto.setProduct_color1(product_color1);
			dto.setProduct_color2(product_color2);
			dto.setProduct_color3(product_color3);
			dto.setProduct_color4(product_color4);
			dto.setProduct_color5(product_color5);
			dto.setProduct_color6(product_color6);
			dto.setModelsize1(modelsize1);
			dto.setModelsize2(modelsize2);
			dto.setModelsize3(modelsize3);
			dto.setModelsize4(modelsize4);
			dto.setModelsize5(modelsize5);
			dto.setModelsize6(modelsize6);
			
			String fileDel0=multi.getParameter("fileDel0");
			String fileDel1=multi.getParameter("fileDel1");
			String fileDel2=multi.getParameter("fileDel2");
			String fileDel3=multi.getParameter("fileDel3");
			String fileDel4=multi.getParameter("fileDel4");
			String fileDel5=multi.getParameter("fileDel5");
			String fileDel6=multi.getParameter("fileDel6");
			String fileDel7=multi.getParameter("fileDel7");
			String fileDel8=multi.getParameter("fileDel8");
						
				if(fileDel0 != null && fileDel0.equals("on")) {
					String fileName0=dao.getFileName0(productid);
					File f0=new File(Constants.UPLOAD_PATH+fileName0);		
					f0.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename0("-");
				}
				if(fileDel1 != null && fileDel1.equals("on")) {
					String fileName1=dao.getFileName1(productid);
					File f1=new File(Constants.UPLOAD_PATH+fileName1);
					f1.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename1("-");
				}
				if(fileDel2 != null && fileDel2.equals("on")) {
				 String fileName2=dao.getFileName2(productid);
					File f2=new File(Constants.UPLOAD_PATH+fileName2);
					f2.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename2("-");
				}
				if(fileDel3 != null && fileDel3.equals("on")) {
				 String fileName3=dao.getFileName3(productid);
					File f3=new File(Constants.UPLOAD_PATH+fileName3);
					f3.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename3("-");
				}
				if(fileDel4 != null && fileDel4.equals("on")) {
					String fileName4=dao.getFileName4(productid);
					File f4=new File(Constants.UPLOAD_PATH+fileName4);
					f4.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename4("-");
				}
				if(fileDel5 != null && fileDel5.equals("on")) {
					String fileName5=dao.getFileName5(productid);
					File f5=new File(Constants.UPLOAD_PATH+fileName5);
					f5.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename5("-");
				}
				if(fileDel6 != null && fileDel6.equals("on")) {
					String fileName6=dao.getFileName6(productid);
					File f6=new File(Constants.UPLOAD_PATH+fileName6);
					f6.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename6("-");
				}
				if(fileDel7 != null && fileDel7.equals("on")) {
					String fileName7=dao.getFileName7(productid);
					File f7=new File(Constants.UPLOAD_PATH+fileName7);
					f7.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename7("-");
				}
				if(fileDel8 != null && fileDel8.equals("on")) {
					String fileName8=dao.getFileName8(productid);
					File f8=new File(Constants.UPLOAD_PATH+fileName8);
					f8.delete();//파일 삭제
					//첨부파일 정보를 지움
					dto.setFilename8("-");
				}
			
			dao.productUpdate(dto);
			String page="/BSProject/manager_product_index.jsp";
			response.sendRedirect(contextPath+page);
		} else if(url.indexOf("product_delete.do")!=-1) {
			MultipartRequest multi=new MultipartRequest(request,Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD,"utf-8",new DefaultFileRenamePolicy());
			//삭제할 게시물 번호
			int productid=Integer.parseInt(multi.getParameter("productid"));
			dao.productDelete(productid);
			String page="/product_servlet/product_list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("product_Customer_page.do")!=-1) {
			int count=dao.product_count();
			System.out.println(count);
			//페이지 나누기를 위한 처리
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
				System.out.println(curPage);
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
//			System.out.println("list.do 호출");
			List<StoreProductDTO> list=dao.product_list(start,end);
			request.setAttribute("list",list);
			//페이지 네비게이션 출력을 위한 정보전달
			request.setAttribute("page", pager);
			String page="/BSProject/Best_Baby_Result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("product_detail_view.do")!=-1){
			int productid=Integer.parseInt(request.getParameter("productid"));
			System.out.println(productid);
			HttpSession session=request.getSession();
			//조회수 증가처리
			dao.plusReadCount(productid, session);
			//줄바꿈처리
			StoreProductDTO dto=dao.product_viewReplace(productid);
			request.setAttribute("dto", dto);
			String page="/BSProject/categoryPage.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);		
		}else if(url.indexOf("menuPage_list.do")!=-1) {
			String submenu=request.getParameter("submenu");
			System.out.println(submenu);
			int count=dao.countMenu(submenu);
			System.out.println(count);
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<StoreProductDTO> list=dao.subMenuList(submenu,start,end);
			System.out.println(list);
			request.setAttribute("list",list);
			request.setAttribute("page", pager);
			request.setAttribute("submenu",submenu);
		    String page="/BSProject/categoryList.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("categoryPage.do")!=-1){
			String submenu=request.getParameter("submenu");
			System.out.println(submenu);
			int count=dao.countMenu(submenu);
			System.out.println(count);
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			CategoryPager pager=new CategoryPager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<StoreProductDTO> list=dao.subMenuList(submenu,start,end);
			System.out.println(list);
			request.setAttribute("list",list);
			request.setAttribute("page", pager);
			request.setAttribute("submenu",submenu);
		    String page="/BSProject/category_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("product_search.do")!=-1){
			String keyword=request.getParameter("keyword");
			String search_option=request.getParameter("search_option");
			System.out.println(keyword);
			System.out.println(search_option);
			int count=dao.countProductSearch(search_option,keyword);
			System.out.println(count);
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<StoreProductDTO> list=dao.searchProductList(search_option,keyword,start,end);
			System.out.println(list);
			request.setAttribute("list",list);
			request.setAttribute("page", pager);
			request.setAttribute("search_option",search_option);
			request.setAttribute("keyword", keyword);

		String page="/BSProject/manager_product_search.jsp";

			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("mainPage_search.do")!=-1){
			String keyword=request.getParameter("keyword");
			String search_option=request.getParameter("search_option");
			System.out.println(keyword);
			System.out.println(search_option);
			int count=dao.countProductSearch(search_option,keyword);
			System.out.println(count);
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<StoreProductDTO> list=dao.searchProductList(search_option,keyword,start,end);
			System.out.println(list);
			request.setAttribute("list",list);
			request.setAttribute("page", pager);
			request.setAttribute("search_option",search_option);
			request.setAttribute("keyword", keyword);

		String page="/BSProject/categorySearch_result.jsp";

			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("categoryMainPage.do")!=-1){
			String submenu=request.getParameter("submenu");
			System.out.println(submenu);
			int count=dao.countMenu(submenu);
			System.out.println(count);
			int curPage=1;
			if(request.getParameter("curPage")!=null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			CategoryPager pager=new CategoryPager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			List<StoreProductDTO> list=dao.subMenuList(submenu,start,end);
			System.out.println(list);
			request.setAttribute("list",list);
			request.setAttribute("page", pager);
			request.setAttribute("submenu",submenu);
		    String page="/BSProject/categoryMain_result.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
