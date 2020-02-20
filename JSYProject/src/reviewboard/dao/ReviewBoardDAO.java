package reviewboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import reviewboard.dto.ReviewBoardCommentDTO;
import reviewboard.dto.ReviewBoardDTO;
import sqlmap.MybatisManager;

public class ReviewBoardDAO {
	
	public List<ReviewBoardDTO> reviewList(int start, int end) {
		List<ReviewBoardDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try~catch문
		try {
			session=MybatisManager.getSession().openSession();
			Map <String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("reviewList",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return list;
	}//end list()

	public void reviewInsert(ReviewBoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.insert("reviewInsert",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
	}//end insert(ReviewBoardDTO dto)
     
	//첨부파일의 이름 찾기
	public String reviewGetFileName(int num) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("reviewGetFileName",num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}//getFileName(int num)

	public void reviewPlusDown(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.update("reviewPlusDown",num);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally		
	}//plusDown(int num)

	public ReviewBoardDTO reviewView(int num) {
		ReviewBoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("reviewViewReplace",num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
		return dto;
	}
	
	public ReviewBoardDTO reviewViewReplace(int num) {
		ReviewBoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("reviewViewReplace",num);
			String contents=dto.getContents();
			contents=contents.replace("<br>", "\n");
			dto.setContents(contents);
			//줄바꿈 처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
		return dto;
	}
	
	//조회수 증가 처리
	public void reviewPlusReadCount(int num, HttpSession count_session){
		SqlSession session=null;
		try {
            long read_time=0;
            if(count_session.getAttribute("read_time"+num)!=null){
            	read_time=(long)count_session.getAttribute("read_time"+num);
            }
            long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getSession().openSession();
			if(current_time-read_time>5*1000){//현재시간-읽은시간>5초,
				//하루에 한번 증가 24*60*60*1000
				session.update("reviewPlusReadCount",num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute("read_time"+num,current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally		
	}
     //댓글 목록
	public List<ReviewBoardCommentDTO> reviewCommentList(int num) {
		List<ReviewBoardCommentDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			list=session.selectList("reviewCommentList",num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return list;
	}

	public void reviewCommentAdd(ReviewBoardCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.insert("reviewCommentAdd",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		
	}
    //답글의 순서 조정
	public void reviewUpdateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			ReviewBoardDTO dto=new ReviewBoardDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("reviewUpdateStep",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally		
	}//updateStep(int ref, int re_step)
    
	//답글 쓰기
	public void reviewReply(ReviewBoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.insert("reviewReply",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		
	}
     //비밀번호 체크
	public String reviewPasswdCheck(int num, String passwd) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("reviewPasswdCheck",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
		return result;
	}

	public void reviewUpdate(ReviewBoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.update("reviewUpdate",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally	
	}//update(ReviewBoardDTO dto)
    
	//삭제 기능
	public void reviewDelete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.update("reviewDelete",num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
	}//delete(int num)
    
	
	//검색기능
	public List<ReviewBoardDTO> reviewSearchList(String search_option, String keyword, int start, int end) {
		List<ReviewBoardDTO> list=null;
		//try ~ with문 : java1.7부터 사용 가능
		//try(){}문장에서 finally절을 안써도 자동으로 리소스가 정리된다.
		try(SqlSession session=MybatisManager.getSession().openSession()){
			
				Map<String,Object> map=new HashMap<>();
				map.put("search_option",search_option);
				map.put("keyword","%"+keyword+"%");
				map.put("start",start);
				map.put("end",end);
				list=session.selectList("reviewSearchList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
    //게시물 갯수 계산 
	public int reviewCount() {
		int result=0;
		try(SqlSession session=MybatisManager.getSession().openSession()) {
			result=session.selectOne("reviewCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int reviewCountSearch(String search_option, String keyword) {
		int result=0;
		try(SqlSession session=MybatisManager.getSession().openSession()) {
			Map<String,String> map=new HashMap<>();
			map.put("search_option",search_option);
			map.put("keyword","%"+keyword+"%");
			result=session.selectOne("reviewCountSearch",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
