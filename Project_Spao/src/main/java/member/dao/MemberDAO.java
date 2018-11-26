package member.dao;

import member.bean.MemberDTO;

public interface MemberDAO {

	public void writeUser(MemberDTO memberDTO);
	
	public MemberDTO getUser(String id);
}
