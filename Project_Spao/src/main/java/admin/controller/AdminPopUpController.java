package admin.controller;

import java.security.PrivateKey;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.bean.SpaoAdminDTO;
import admin.bean.SpaoAdminMemoDTO;
import admin.dao.AdminDAO;
import email.handler.GmailSend;
import member.bean.MemberDTO;
import member.bean.SpaoComDTO;

@Controller
public class AdminPopUpController {
	@Autowired
	private AdminDAO adminDAO;
	
	@RequestMapping(value="admin/member/popup/autopwd.do",method=RequestMethod.GET)
	public String autopwd(HttpServletRequest request) {

		return "autopwd";
	}
	
	@RequestMapping(value="admin/member/popup/changePwd.do",method=RequestMethod.POST)
	public String changePwd(@RequestParam("id")String id,Model model) {
		StringBuilder pwd=new StringBuilder();
		for(int i=0;i<6;i++) {
			int re=(int)(Math.random()*26)+97;
			pwd.append((char)re);   //패스워드 6자리 a~z영어소문자 랜덤생성
		}
		
		Map<String,String> map=new HashMap<String, String>();
		System.out.println("changePWD:"+id);
		map.put("id", id);
		map.put("pwd",pwd.toString());
		try {
			adminDAO.changePwd(map);
		}catch(Exception e) {
			model.addAttribute("error", true);  //오류낫음 true
			return "autopwdSuccess";
		}
		model.addAttribute("error", false);    //안낫음 false
		model.addAttribute("pwd", pwd.toString());
		return "autopwdSuccess";
	}
	
	@RequestMapping("admin/member/popup/reserve.do")
	public String reserve(@RequestParam(name="users",defaultValue="디폴트") String users[],Model model) {
		int min=0;
		for(int i=0;i<users.length;i++) {
			SpaoComDTO spaoComDTO=adminDAO.getSelectReserve(users[i]);
			if(i==0) {
				min=spaoComDTO.getReserve();
			}
			else if(spaoComDTO.getReserve()<min) {
				min=spaoComDTO.getReserve();
			}
		}
		
		model.addAttribute("min", min);
		model.addAttribute("users", users);
		model.addAttribute("userTotal", users.length);
		
		return "reserve";
	}
	
	@RequestMapping("admin/member/popup/sendMail.do")
	public String sendMail(@RequestParam("users") String users[],Model model) {
		List<MemberDTO> list=new ArrayList<MemberDTO>();
		for(String str:users) {
			MemberDTO memberDTO=adminDAO.getSelectUser(str);
			list.add(memberDTO);
		}
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);
		return "sendMail";
	}
	
	@RequestMapping("admin/member/popup/userList.do")
	public String userList(Model model,@RequestParam(name="userId") String userId[]) {
		List<MemberDTO> list=new ArrayList<MemberDTO>();
		for(String str:userId) {
			MemberDTO memberDTO=adminDAO.getSelectUser(str);
			list.add(memberDTO);
		}
		model.addAttribute("size", list.size());
		model.addAttribute("list", list);
		return "userList";
	}
	
	@RequestMapping("admin/member/popup/memberViewMain.do")
	public String memberViewMain(Model model,@RequestParam(name="id") String id,HttpSession session) {
		PrivateKey privateKey = (PrivateKey) session.getAttribute(AdminController.RSA_WEB_KEY);  //복호화를 위한 개인키를가져옴
		String adminId=(String) session.getAttribute("adminId"); //암호화된 어드민 아이디를 가져옴
		System.out.println("암호화된 어드민 아이디:"+adminId);
		try {
			adminId=AdminController.decryptRsa(privateKey,adminId);
		} catch (Exception e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
		}
		System.out.println("복호화된 어드민 아이디:"+adminId);

		List<SpaoAdminMemoDTO> list=adminDAO.getSelectSpaoAdminMemo(id);
		SpaoAdminDTO spaoAdminDTO=adminDAO.loginAdmin(adminId);
		SpaoComDTO spaoComDTO=adminDAO.getSelectReserve(id);
		MemberDTO memberDTO=adminDAO.getSelectUser(id);
		
		int age=Integer.parseInt(LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE))-Integer.parseInt(memberDTO.getBirth());
		age=(int) Math.floor((age/10000.0));  //만 나이계산
		model.addAttribute("list", list);
		model.addAttribute("age", age);
		model.addAttribute("adminId", spaoAdminDTO.getId());
		model.addAttribute("spaoComDTO", spaoComDTO);
		model.addAttribute("memberDTO", memberDTO);
		model.addAttribute("memberView", "memberView/memberData.jsp");

		return "memberViewMain";
	}


}
