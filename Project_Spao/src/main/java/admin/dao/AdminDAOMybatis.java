package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.SpaoAdminDTO;
import admin.bean.SpaoAdminMemoDTO;
import member.bean.MemberDTO;
import member.bean.MemberPagingDTO;
import member.bean.SpaoComDTO;
import member.reserve.bean.SpaoLogReservePagingDTO;

@Transactional
@Component
public class AdminDAOMybatis implements AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public SpaoAdminDTO loginAdmin(String id) {
		return sqlSession.selectOne("adminSQL.loginAdmin", id);
	}
	
	
	
	public int getSearchPagingUserTotal(Map<String,String> map) {
		return sqlSession.selectOne("adminSQL.getSearchPagingUserTotal",map);
	}

	public int getTotalUser() {
		int total=sqlSession.selectOne("adminSQL.getTotalUser");
		return total;
	}

	public int getTodayJoin() {
		int count=sqlSession.selectOne("adminSQL.getTodayJoin");
		
		return count;
	}

	public int getMonthJoin() {
		int count=sqlSession.selectOne("adminSQL.getMonthJoin");
		return count;
	}
	
	public int getBirthToday() {
		int count=sqlSession.selectOne("adminSQL.getBirthToday");
		return count;
	}
	
	public int getBirthMonth() {
		int count=sqlSession.selectOne("adminSQL.getBirthMonth");
		return count;
	}

	
	public int getAnniversaryToday() {
		int count=sqlSession.selectOne("adminSQL.getAnniversaryToday");
		return count;
	}

	public int getAnniversaryMonth() {
		int  count=sqlSession.selectOne("adminSQL.getAnniversaryMonth");
		
		return count;
	}
	
	public List<MemberDTO> getAllUser() {
		
		List<MemberDTO> list=sqlSession.selectList("adminSQL.getAllUser");

		return list;
	}

	public void changePwd(Map<String,String> map) {
		sqlSession.update("adminSQL.changePwd",map);

	}
	
	public MemberDTO getSelectUser(String id) {
		MemberDTO memberDTO=null;
		try {
			memberDTO=sqlSession.selectOne("adminSQL.getSelectUser",id);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("dasdasd");
		}
		return memberDTO;
	}
	public void deleteUser(String id) {
		sqlSession.delete("adminSQL.deleteUser", id);
	}
	
	
	public void giveReserve(Map<String,String> map) {
		sqlSession.update("adminSQL.giveReserve", map);
	}
	public void takeReserve(Map<String,String> map) {
		sqlSession.update("adminSQL.takeReserve", map);
	}
	public SpaoComDTO getSelectReserve(String id){
		SpaoComDTO spaoComDTO=sqlSession.selectOne("adminSQL.getSelectReserve",id);
		
		return spaoComDTO;
	} 
	public List<MemberPagingDTO> getPagingUser(Map<String,String> map){
		List<MemberPagingDTO> list=sqlSession.selectList("adminSQL.getPagingUser", map);
		return list;
	}
	
	public 	void setSpaoAdminMemo(Map<String,String> map) {
		sqlSession.insert("adminSQL.setSpaoAdminMemo",map);
	}
	
	public 	List<SpaoAdminMemoDTO> getSelectSpaoAdminMemo(String userId){
		List<SpaoAdminMemoDTO> list=sqlSession.selectList("adminSQL.getSelectSpaoAdminMemo",userId);
		return list;
	}
	
	public void deleteSpaoAdminMemo(Map<String,String> map) {
		sqlSession.delete("adminSQL.deleteSpaoAdminMemo", map);
	}
	
	public List<MemberPagingDTO> getSearchPagingUser(Map<String,String> map){
		List<MemberPagingDTO> list=sqlSession.selectList("adminSQL.getSearchPagingUser", map);
		return list;
	}
	
	public int getTotalReserve() {
		int su=sqlSession.selectOne("adminSQL.getTotalReserve");
		return su;
	}
	public List<SpaoLogReservePagingDTO> getPagingReserveLog(Map<String,String> map){
		List<SpaoLogReservePagingDTO> list=sqlSession.selectList("adminSQL.getPagingReserveLog", map);
		
		return list;
	}
	public int getPagingReserveLogTotalA() {
		int su=sqlSession.selectOne("adminSQL.getPagingReserveLogTotalA");
		return su;
	}
	
	
	public List<SpaoLogReservePagingDTO> getSearchPagingReserveLog(Map<String,String> map){
		List<SpaoLogReservePagingDTO> list=sqlSession.selectList("adminSQL.getSearchPagingReserveLog", map);
		return list;
	}
	public int getSearchPagingReserveLogTotalA(Map<String,String> map) {
		int su=sqlSession.selectOne("adminSQL.getSearchPagingReserveLogTotalA",map);
		return su;
	}

	
	
}
