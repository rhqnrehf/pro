package post.dao;

import java.util.ArrayList;

import post.bean.ZipcodeDTO;



public interface PostDAO {
	public ArrayList<ZipcodeDTO> getRoadZipcodeList(String sido,String sigungu,String roadname);
	public ArrayList<ZipcodeDTO> getZipcodeList(String sido,String dong);
}
