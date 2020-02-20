package noticeboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardCommentDTO;
import noticeboard.dto.NoticeBoardCommentDTO;
import noticeboard.dto.NoticeBoardDTO;
import sqlmap.MybatisManager;

public class NoticeBoardDAO {

	public int noticeCount() {
		int result=0;
		try(SqlSession session=MybatisManager.getSession().openSession()) {
			result=session.selectOne("noticeCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<NoticeBoardDTO> noticeList(int start, int end) {
		List<NoticeBoardDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try~catch문
		try {
			session=MybatisManager.getSession().openSession();
			Map <String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("noticeList",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return list;		
	}
	
	public void noticeInsert(NoticeBoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.insert("noticeInsert",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
	}//end insert(BoardDTO dto)

	public void noticePlusReadCount(int num, HttpSession count_session) {
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
				session.update("noticePlusReadCount",num);
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

	public NoticeBoardDTO noticeViewReplace(int num) {
		NoticeBoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("noticeViewReplace",num);
			//줄바꿈 처리
			String contents=dto.getContents();
			contents=contents.replace("<br>", "\n");
			dto.setContents(contents);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
		return dto;
	}

	public void noticeCommentAdd(NoticeBoardCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.insert("noticeCommentAdd",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally	
	}

	public List<NoticeBoardCommentDTO> noticeCommentList(int num) {
		List<NoticeBoardCommentDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			list=session.selectList("noticeCommentList",num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return list;
	}

	public void noticeDelete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.delete("noticeDelete",num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally		
	}

	public void noticeUpdate(NoticeBoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.update("noticeUpdate",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally		
	}

	public String noticePasswdCheck(int num, String passwd) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("noticePasswdCheck",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
		return result;
	}


	

}
