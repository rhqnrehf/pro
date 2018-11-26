package member.dao;

import java.util.Objects;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import member.bean.MemberDTO;

@Transactional
@Component
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	SqlSession sqlSession;

	public void writeUser(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.writeUser",memberDTO);
	}



	public MemberDTO getUser(String id) {
		MemberDTO memberDTO=sqlSession.selectOne("memberSQL.getUser",id);
		return memberDTO;
	}
	
}
