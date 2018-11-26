package admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.dao.AdminDAO;
import email.handler.GmailSend;
import member.bean.MemberDTO;

@Controller
public class AdminNoWebController {
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private GmailSend mail;
	
	@RequestMapping("admin/secede.do")
	@ResponseBody
	public String secede(@RequestParam(name="users[]") String users[]) {  //ajax로 json형태로 배열을보내면 받을때도 배열로옴
		
		try {
			for(String str:users) {
				adminDAO.deleteUser(str);
				System.out.println(str);
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	@RequestMapping("admin/member/popup/emailSend.do")
	@ResponseBody
	public String emailSend(@RequestParam(name="id",required=true) String id,@RequestParam(name="subject",required=true,defaultValue="제목테스트")String subject,@RequestParam(name="content",required=true,defaultValue="내용테스트") String content) {
		MemberDTO memberDTO=adminDAO.getSelectUser(id);
		String userMail=memberDTO.getEmail1()+"@"+memberDTO.getEmail2();
		try {
			mail.sendmail(userMail,subject,content);
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	@RequestMapping("admin/member/popup/multiEmailSend.do")
	@ResponseBody
	public String multiEmailSend(@RequestParam(name="userEmail[]",required=true) String userEmail[],@RequestParam(name="subject",required=true,defaultValue="Spao입니다")String subject,@RequestParam(name="content",required=true,defaultValue="잘못보낸내용") String content) {
		try {
			for(String str:userEmail) {
				mail.sendmail(str,subject,content);
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}

		return "success";
	}
	
	@RequestMapping("admin/member/popup/reserveGive.do")
	@ResponseBody
	public String reserveGive(@RequestParam(name="users[]") String users[],String onOff,String reserve,String  reservelog) { //1은 차감 0은 지급
		Map<String,String> map=new HashMap<String,String>();
		int onoff=Integer.parseInt(onOff);
		try {
			if(onoff==0) {
				//증가
				for(int i=0;i<users.length;i++) {
					map.put("id",users[i]);
					map.put("reserve",reserve);
					map.put("reservelog",reservelog+"   증가");
					adminDAO.giveReserve(map);
					map.clear();
				}
			}else if(onoff==1) {
				//차감
				for(int i=0;i<users.length;i++) {
					map.put("id",users[i]);
					map.put("reserve",reserve);
					map.put("reservelog",reservelog+"   차감");
					adminDAO.takeReserve(map);
					map.clear();
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}

		return "success";
	}
	
	@RequestMapping(value="admin/member/popup/adminMemo.do",method=RequestMethod.GET)
	@ResponseBody
	public String adminMemo(@RequestParam(name="adminId") String adminId,@RequestParam(name="content") String content,@RequestParam(name="userId") String userId) {
		System.out.println("adminMemo.do 컨트롤러");
		Map<String,String> map=new HashMap<String,String>();
		map.put("adminId", adminId);
		map.put("content", content);
		map.put("userId", userId);
		try {
			adminDAO.setSpaoAdminMemo(map);
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	@RequestMapping(value="admin/member/popup/adminMemoDelete.do",method=RequestMethod.GET)
	@ResponseBody
	public String adminMemoDelete(@RequestParam(name="adminId") String adminId,@RequestParam(name="content") String content,@RequestParam(name="userId") String userId) {
		System.out.println("adminMemoDelete.do 컨트롤러");
		Map<String,String> map=new HashMap<String,String>();
		map.put("adminId", adminId);
		map.put("content", content);
		map.put("userId", userId);
		try {
			adminDAO.deleteSpaoAdminMemo(map);
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
		return "success";
	}
	
	
	

}
