package post.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import post.bean.ZipcodeDTO;
import post.dao.PostDAO;

@Controller
public class PostController {
	
	@Autowired
	private PostDAO postDAO;
	
	@RequestMapping(value="post/checkPost.do",method=RequestMethod.POST)      //JSON 반환
	public ModelAndView checkPost(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();

		//데이터
		String sido = request.getParameter("sido");
		String dong=request.getParameter("dong");
		/*String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");*/
		
		System.out.println("POST 방식 시도와 동/읍/면 ajax");
		
		//DB
		ArrayList<ZipcodeDTO> list = postDAO.getZipcodeList(sido,dong);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="post/checkRoadPost.do",method=RequestMethod.POST)
	public ModelAndView checkRoadPost(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();

		//데이터
		String sido = request.getParameter("sido");
		String sigungu=request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");

		
		System.out.println("POST 방식 시도와 시군구 로드네임 ajax");
		
		//DB
		ArrayList<ZipcodeDTO> list = postDAO.getRoadZipcodeList(sido,sigungu,roadname);
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
}
