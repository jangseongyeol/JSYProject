package storeproduct.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardDTO;
import sqlmap.MybatisManager;
import store.dto.StoreMemberDTO;
import storeproduct.dto.StoreProductDTO;

public class StoreProductDAO {

	public void product_Insert(StoreProductDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.insert("produck_insert",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
	}//end insert(BoardDTO dto)	

	public int product_count() {
		int result=0;
		try(SqlSession session=MybatisManager.getSession().openSession()) {
			result=session.selectOne("product_count");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//product_count()

	public List<StoreProductDTO> product_list(int start, int end) {
		List<StoreProductDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try~catch문
		try {
			session=MybatisManager.getSession().openSession();
			Map <String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("poduct_list",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return list;
	}//product_list(int start, int end)

	public void plusReadCount(int productid, HttpSession count_session) {
		SqlSession session=null;
		try {
            long read_time=0;
            if(count_session.getAttribute("read_time"+productid)!=null){
            	read_time=(long)count_session.getAttribute("read_time"+productid);
            }
            long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getSession().openSession();
			if(current_time-read_time>5*1000){//현재시간-읽은시간>5초,
				//하루에 한번 증가 24*60*60*1000
				session.update("product_plusReadCount",productid);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute("read_time"+productid,current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
	}

	public StoreProductDTO product_viewReplace(int productid) {
		StoreProductDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("product_view",productid);
			//줄바꿈 처리
			String productcontent=dto.getProductcontent();
			productcontent=productcontent.replace("<br>", "\n");
			dto.setProductcontent(productcontent);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
		return dto;
	}

	public StoreProductDTO productView(int productid) {
		StoreProductDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("product_view",productid);
			//줄바꿈 처리
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally			
		return dto;
	}


	public String getFileName0(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName0",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}
	
	public String getFileName1(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName1",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}
	
	public String getFileName2(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName2",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}
	
	public String getFileName3(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName3",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}
	
	public String getFileName4(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName4",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}
	
	public String getFileName5(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName5",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}
	
	public String getFileName6(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName6",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}
	
	public String getFileName7(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName7",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}
	
	public String getFileName8(int productid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			result=session.selectOne("getFileName8",productid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return result;
	}

	public void productUpdate(StoreProductDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.update("productupdate",dto);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		
	}

	public void productDelete(int productid) {
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			session.delete("productdelete",productid);
			session.commit();//auto commit아님
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		
		
	}

	public StoreProductDTO indexList() {
		StoreProductDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			dto=session.selectOne("indexList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally
		return dto;
	}

	public int countMenu(String submenu) {
		int result=0;
		try(SqlSession session=MybatisManager.getSession().openSession()) {
			result=session.selectOne("countMenu",submenu);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<StoreProductDTO> subMenuList(String submenu, int start, int end) {
		List<StoreProductDTO> list=null;
		//try ~ with문 : java1.7부터 사용 가능
		//try(){}문장에서 finally절을 안써도 자동으로 리소스가 정리된다.
		try(SqlSession session=MybatisManager.getSession().openSession()){
			
				Map<String,Object> map=new HashMap<>();
				map.put("submenu",submenu);
				map.put("start",start);
				map.put("end",end);
				list=session.selectList("subMenuList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int countProductSearch(String search_option, String keyword) {
		int result=0;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
			Map<String,String> map=new HashMap<>();
			map.put("search_option",search_option);
			map.put("keyword","%"+keyword+"%");
			result=session.selectOne("countProductSearch",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<StoreProductDTO> searchProductList(String search_option, String keyword, int start, int end) {
		List<StoreProductDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getSession().openSession();
				Map<String,Object> map=new HashMap<>();
				map.put("search_option",search_option);
				map.put("keyword","%"+keyword+"%");
				map.put("start",start);
				map.put("end",end);
				list=session.selectList("searchProductList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}

/*	public List<StoreProductDTO> selectList() {
		List<StoreProductDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try~catch문
		try {
			session=MybatisManager.getSession().openSession();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}//finally	
		return list;
	}//selectList()
*/	
	

