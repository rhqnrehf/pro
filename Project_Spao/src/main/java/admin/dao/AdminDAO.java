package admin.dao;

import java.util.List;
import java.util.Map;

import admin.bean.SpaoAdminDTO;
import admin.bean.SpaoAdminMemoDTO;
import member.bean.MemberDTO;
import member.bean.MemberPagingDTO;
import member.bean.SpaoComDTO;
import member.reserve.bean.SpaoLogReservePagingDTO;
import member.reserve.bean.SpaoRankReserveDTO;

public interface AdminDAO {
	int getTotalUser();
	int getSearchPagingUserTotal(Map<String,String> map);
	int getTodayJoin();
	int getMonthJoin();
	int getBirthToday();
	int getBirthMonth();
	int getAnniversaryToday();
	int getAnniversaryMonth();
	
	SpaoAdminDTO loginAdmin(String id);
	
	List<MemberDTO> getAllUser(); 			//전체유저를 list로가져옴
	
	
	MemberDTO getSelectUser(String id);			//해당아이디의 ㅈㅇ보를 가져옴
	
	void changePwd(Map<String,String> map);  //매개값으로 아이디와 pwd를 줘서 pwd를 변경시킴
	void deleteUser(String id);				//해당 유저삭제 외래키적용중인 타 com,log 테이블에있는 데이터도삭제됨
	
	void giveReserve(Map<String,String> map);  //적립금을 줄때
	void takeReserve(Map<String,String> map);  //적립금 뺏을때
	
	SpaoComDTO getSelectReserve(String id);   //해당 아이디의 부가정보를가져옴
	int getTotalReserve(); //현재 회원들이 갖고있는 적립금총액
	
	List<MemberPagingDTO> getPagingUser(Map<String,String> map);
	List<MemberPagingDTO> getSearchPagingUser(Map<String,String> map);
	
	void setSpaoAdminMemo(Map<String,String> map);
	
	List<SpaoAdminMemoDTO> getSelectSpaoAdminMemo(String userId);
	
	void deleteSpaoAdminMemo(Map<String,String> map);
	
	List<SpaoLogReservePagingDTO> getPagingReserveLog(Map<String,String> map);
	int getPagingReserveLogTotalA();
	
	List<SpaoLogReservePagingDTO> getSearchPagingReserveLog(Map<String,String> map);
	int getSearchPagingReserveLogTotalA(Map<String,String> map);
	
	List<SpaoRankReserveDTO> getPagingReserveRank(Map<String,String> map);
	String getSelectGiveReserve(String id);
}
