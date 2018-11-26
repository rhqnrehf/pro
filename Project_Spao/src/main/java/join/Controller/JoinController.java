package join.Controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Controller
public class JoinController {
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping("join/joinMember.do")
	public String joinMember() {
		return "joinMember";
	}
	
	
	@RequestMapping("join/isCheckId.do")
	public ModelAndView isCheckId(@RequestParam String webId) {
		ModelAndView mav=new ModelAndView();
		//DB작업
		MemberDTO memberDTO=memberDAO.getUser(webId);
		//아이디가 중복되면 true

		if(memberDTO==null) {
			mav.addObject("isCheckId",false);
		}else {
			mav.addObject("isCheckId",true);
		}
		//중복안되면 false

		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="join/joinMemberSuccess.do",method=RequestMethod.POST)
	public String joinMemberSuccess(String webName,String webId,String password,String birth,String birthUnar,String phone,
		String address1,String address2,String email1,String email2,String weddingYn,String weddingDay) {
		MemberDTO memberDTO=new MemberDTO();
		memberDTO.setName(webName);
		memberDTO.setId(webId);
		memberDTO.setPwd(password);
		memberDTO.setBirth(birth);
		memberDTO.setLiftLucar(birthUnar);
		memberDTO.setPhoneNumber(phone);
		memberDTO.setAddress1(address1);
		memberDTO.setAddress2(address2);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setMarriage(weddingYn);
		memberDTO.setAnniversary(weddingDay);
		
		memberDAO.writeUser(memberDTO);
		return "돌아갈주소"; //메인페이지 
		
	}
}
