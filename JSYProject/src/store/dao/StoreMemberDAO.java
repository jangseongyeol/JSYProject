package store.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import crypt.BCrypt;
import sqlmap.MybatisManager;
import store.dto.StoreMemberDTO;

public class StoreMemberDAO {
	
	
	public void insertMember(StoreMemberDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.insert("insert_storemember",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
	}//end insertMember(BoardDTO dto)

	public String passwdCheck(String userid, String passwd) {
		String result="";
		StoreMemberDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("passwdcheck",userid);
			if(dto!=null){
				if(BCrypt.checkpw(passwd,dto.getPasswd())) {					
					result=dto.getUsername()+"님 환영합니다.";
				}else {
					result="로그인실패";
				}
			}else {
				result="로그인실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}//end passwdCheck(String userid)

	public String loginStore(StoreMemberDTO dto) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("loginstore",dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}

	public int memberCount() {
		int result=0;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("memberCount");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}//finally	
		return result;
	}

	public List<StoreMemberDTO> memberList(int start, int end) {
		List<StoreMemberDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try~catch문
		try {
			session=MybatisManager.getSession().openSession();
			Map <String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("memberList",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return list;
	}

	public StoreMemberDTO memberViewReplace(int usernum) {
		StoreMemberDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("memberView",usernum);
			//줄바꿈 처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
		return dto;
	}

	public int countMemberSearch(String search_option, String keyword) {
		int result=0;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			Map<String,String> map=new HashMap<>();
			map.put("search_option",search_option);
			map.put("keyword","%"+keyword+"%");
			result=session.selectOne("store.countMemberSearch",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}//finally	
		
		return result;
	}

	public List<StoreMemberDTO> memberSearchList(String search_option, String keyword, int start, int end) {
		List<StoreMemberDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
				Map<String,Object> map=new HashMap<>();
				map.put("search_option",search_option);
				map.put("keyword","%"+keyword+"%");
				map.put("start",start);
				map.put("end",end);
				list=session.selectList("store.memberSearchList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}//finally	
		return list;
	}
	
	public StoreMemberDTO storememberDetail(String userid) {
		StoreMemberDTO dto= null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
				dto=session.selectOne("storememberDetail",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}//finally	
		return dto;
	}

	public void memberDelete(int usernum) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
				session.delete("memberDelete",usernum);
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}//finally	
	}

	public void memberUpdate(StoreMemberDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
				session.update("memberUpdate",dto);
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}//finally	
	}

	public StoreMemberDTO memberMainViewReplace(String userid) {
		StoreMemberDTO dto= null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
				dto=session.selectOne("storememberDetail",userid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
		}//finally	
		return dto;
	}

}
