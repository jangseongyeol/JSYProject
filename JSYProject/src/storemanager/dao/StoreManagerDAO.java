package storemanager.dao;

import org.apache.ibatis.session.SqlSession;

import crypt.BCrypt;
import sqlmap.MybatisManager;
import store.dto.StoreMemberDTO;
import storemanager.dto.StoreManagerDTO;

public class StoreManagerDAO {

	public void insertManager(StoreManagerDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.insert("insertManager",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
	}

	public String passwdManagerCheck(String managerid, String passwd) {
		String result="";
		StoreManagerDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("passwdManagerCheck",managerid);
			if(dto!=null){
				if(BCrypt.checkpw(passwd,dto.getPasswd())) {					
					result=dto.getManager()+"님 환영합니다.";
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
	}

	public StoreManagerDTO storeManagerDetail(String managerid) {
		StoreManagerDTO dto= null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
				dto=session.selectOne("storeManagerDetail",managerid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
