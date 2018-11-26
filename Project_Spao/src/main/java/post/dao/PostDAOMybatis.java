package post.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import post.bean.ZipcodeDTO;

@Transactional
@Component
public class PostDAOMybatis implements PostDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<ZipcodeDTO> getRoadZipcodeList(String sido, String sigungu, String roadname) {
		List<ZipcodeDTO> list=null;          
		if(sido.indexOf("시도선택")!=-1) {
			sido="";
		}
		sido=sido.replace(" ","");
		sigungu=sigungu.replace(" ","");
		roadname=roadname.replace(" ","");
		
		System.out.println(sido+","+sigungu+","+roadname);
		
		Map<String,String> map=new HashMap<String,String>();
		map.put("sido","%"+sido+"%");
		map.put("sigungu","%"+sigungu+"%");
		map.put("roadname","%"+roadname+"%");
		list=sqlSession.selectList("postSQL.getRoadZipcodeList",map);
		
		System.out.println(list.size());

		
		return (ArrayList<ZipcodeDTO>) list;
	}

	public ArrayList<ZipcodeDTO> getZipcodeList(String sido, String dong) {
		
		List<ZipcodeDTO> list=null;             
		if(sido.indexOf("시도선택")!=-1) {
			sido="";
		}
		System.out.println("getZipcodeList22222222");
		sido=sido.replace(" ","");
		dong=dong.replace(" ","");
		System.out.println(sido+","+dong);
		Map<String,String> map=new HashMap<String,String>();
		map.put("sido","%"+sido+"%");
		map.put("dong","%"+dong+"%");
		list=sqlSession.selectList("postSQL.getZipcodeList",map);
		System.out.println(list.size());
		
		
		return (ArrayList<ZipcodeDTO>) list;

	}

	
	
}
