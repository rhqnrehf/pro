package admin.controller;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.SpaoAdminDTO;
import admin.dao.AdminDAO;
import member.bean.MemberPaging;
import member.bean.MemberPagingDTO;
import member.bean.MemberSearchPaging;
import member.bean.SpaoComDTO;
import member.reserve.bean.SpaoLogReservePaging;
import member.reserve.bean.SpaoLogReservePagingDTO;
import member.reserve.bean.SpaoLogReserveSearchPaging;

@Controller
public class AdminController {
	@Autowired
	private AdminDAO adminDAO;
	
	
	@RequestMapping("admin/main.do")
	public String main(Model model,HttpSession session) {
        PrivateKey privateKey = (PrivateKey) session.getAttribute(AdminController.RSA_WEB_KEY);  //복호화를 위한 개인키를가져옴
        String adminId=(String) session.getAttribute("adminId");
        System.out.println("암호화 id="+adminId);
        
        try {
			adminId=decryptRsa(privateKey, adminId);
			System.out.println("복호화 id="+adminId);
		} catch (Exception e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
		}
        SpaoAdminDTO spaoAdminDTO=adminDAO.loginAdmin(adminId);  //세션에있는어드민정보를가져옴
        model.addAttribute("spaoAdminDTO", spaoAdminDTO);
		model.addAttribute("display", "template/body.jsp");
		return "main";
	}
	
	
	@RequestMapping("admin/member.do")  //회원관리 메인
	public String memberMain(Model model) {
		
		model.addAttribute("memberCount",adminDAO.getTotalUser());  //회원 숫자
		model.addAttribute("todayJoinCount",adminDAO.getTodayJoin());  //오늘 가입한사람
		model.addAttribute("monthJoinCount",adminDAO.getMonthJoin());  //이번달에 가입한사람
		
		model.addAttribute("todayBirthCount", adminDAO.getBirthToday());  //오늘 생일인사람
		model.addAttribute("monthBirthCount", adminDAO.getBirthMonth());  //이번달 생일인사람
		
		model.addAttribute("todayAnniversaryCount", adminDAO.getAnniversaryToday()); //오늘 결혼기념일 인사람
		model.addAttribute("monthAnniversaryCount", adminDAO.getAnniversaryMonth());
		
		model.addAttribute("display", "member/member.jsp");
		model.addAttribute("member", "memberMain.jsp");
		return "main";
	}
	
	
	@RequestMapping(value="admin/memberList.do",method=RequestMethod.GET)
	public String memberList(Model model,@RequestParam(name="pg",required=true,defaultValue="1") int pg,@RequestParam(name="mode",required=false) String mode,@RequestParam(name="keyword",required=false) String keyword) {
		int endNum = pg*5;  //페이지당 다섯개씩
		int startNum = endNum-4;
		Map<String,String>map=new HashMap<String,String>();
		map.put("endNum", Integer.toString(endNum));
		map.put("startNum", Integer.toString(startNum));
		
		if(mode==null&&keyword==null) {
			int totalUser=adminDAO.getTotalUser();
			List<MemberPagingDTO> list=adminDAO.getPagingUser(map);
			
			
			MemberPaging mp=new MemberPaging();
			mp.setCurrentPage(pg);  //현재페이지 
			mp.setPageBlock(3); //[이전][1][2][3][다음]  123의숫자
			mp.setPageSize(5); //한페이지에 몇개의 유저를 보일건지 
			mp.setTotalA(totalUser); //총유저수
			mp.makePagingHTML();
			
			model.addAttribute("resultTotal",totalUser);
			model.addAttribute("totalUser",totalUser);
			model.addAttribute("list", list);
			model.addAttribute("mp", mp);
			model.addAttribute("display","member/member.jsp");
			model.addAttribute("member", "memberList.jsp");
			return "main";
			
		}else {
			if(mode.equals("email")) {
				mode="email1||'@'||email2";
			}else if(mode.equals("id")) {
				mode="spaomember.id";
			}
			

			map.put("mode", mode);
			map.put("keyword", "%"+keyword+"%");
			int totalUser=adminDAO.getSearchPagingUserTotal(map);
			List<MemberPagingDTO> list=adminDAO.getSearchPagingUser(map);
			
			MemberSearchPaging mp=new MemberSearchPaging();
			mp.setCurrentPage(pg);  //현재페이지 
			mp.setPageBlock(3); //[이전][1][2][3][다음]  123의숫자
			mp.setPageSize(5); //한페이지에 몇개의 유저를 보일건지 
			mp.setTotalA(totalUser); //총유저수
			mp.setMode(mode);
			mp.setKeyword(keyword);
			mp.makePagingHTML();
			
			model.addAttribute("resultTotal",list.size());
			model.addAttribute("totalUser",totalUser);
			model.addAttribute("list", list);
			model.addAttribute("mp", mp);
			model.addAttribute("display","member/member.jsp");
			model.addAttribute("member", "memberList.jsp");
			 return "main";
		}
	}
	
	@RequestMapping("admin/memberReserveLog.do")
	public String memberReserveLog(Model model,@RequestParam(name="pg",required=true,defaultValue="1") int pg,@RequestParam(name="mode",required=false) String mode,@RequestParam(name="keyword",required=false) String keyword) {
		int totalWon=0;
		int userTotalWon=0;
		int endNum=pg*5;
		int startNum=endNum-4;
		Map<String,String> map=new HashMap<String,String>();
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		List<SpaoLogReservePagingDTO> list=null;
		if(mode==null||keyword==null) {
			list=adminDAO.getPagingReserveLog(map);
			for(SpaoLogReservePagingDTO dto:list) {
				totalWon+=Integer.parseInt(dto.getWon()); //지급 총액
			}
			userTotalWon=totalWon-adminDAO.getTotalReserve(); //사용총액
			SpaoLogReservePaging mp=new SpaoLogReservePaging();
			mp.setCurrentPage(pg);  //현재페이지 
			mp.setPageBlock(3); //[이전][1][2][3][다음]  123의숫자
			mp.setPageSize(5); //한페이지에 몇개의 유저를 보일건지 
			mp.setTotalA(adminDAO.getPagingReserveLogTotalA()); //총유저수
			mp.makePagingHTML();
			model.addAttribute("mp", mp);
		}else {
			Set<String> set=new HashSet<String>();
			if(mode.equals("id")) {
				mode="spaomember.id";
			}
			keyword="%"+keyword+"%";
			map.put("mode", mode);
			map.put("keyword", keyword);
			list=adminDAO.getSearchPagingReserveLog(map);
			for(SpaoLogReservePagingDTO dto:list) {
				totalWon+=Integer.parseInt(dto.getWon()); //적립금 지급 총액
				set.add(dto.getId());
			}
			for(String id:set) {
				SpaoComDTO spaoComDTO=adminDAO.getSelectReserve(id);
				userTotalWon+=spaoComDTO.getReserve();
			}
			userTotalWon=totalWon-userTotalWon; //적립금 사용 총액
			SpaoLogReserveSearchPaging mp=new SpaoLogReserveSearchPaging();
			mp.setCurrentPage(pg);  //현재페이지 
			mp.setPageBlock(3); //[이전][1][2][3][다음]  123의숫자
			mp.setPageSize(5); //한페이지에 몇개의 유저를 보일건지 
			mp.setTotalA(adminDAO.getSearchPagingReserveLogTotalA(map)); //총유저수
			mp.setMode(mode);
			mp.setKeyword(keyword);
			mp.makePagingHTML();
			model.addAttribute("mp", mp);

		}
		
		
		model.addAttribute("list", list);
		model.addAttribute("userTotalWon", userTotalWon);
		model.addAttribute("totalWon", totalWon);
		model.addAttribute("display","member/member.jsp");
		model.addAttribute("member", "memberReserveLog.jsp");
		return "main";
	}

	@RequestMapping("admin/memberReserveRank.do")
	public String memberReserveRank(Model model,@RequestParam(name="pg",required=true,defaultValue="1") int pg,@RequestParam(name="mode",required=false) String mode,@RequestParam(name="keyword",required=false) String keyword) {
		model.addAttribute("display","member/member.jsp");
		model.addAttribute("member", "memberReserveRank.jsp");
		return "main";
	}
	
	
	//------------------------------------------------------------ 로그인폼
	 public static String RSA_WEB_KEY = "_RSA_WEB_Key_"; //개인키 session key
	 private static String RSA_INSTANCE = "RSA"; // rsa 공개키 한번쓰고 삭제함
	 
    @RequestMapping("admin/loginForm.do")
    public String loginForm(HttpServletRequest request){
    	request.getSession().invalidate();
        //  RSA
        initRsa(request);
        
        return "loginForm";
    }
    
    @RequestMapping(value="admin/login.do", method=RequestMethod.POST)
    public ModelAndView login(HttpServletRequest request) {
    	
        String userId = (String) request.getParameter("USER_ID");
        String userPw = (String) request.getParameter("USER_PW");
        System.out.println("id="+userId);
        System.out.println("pwd="+userPw);
        HttpSession session = request.getSession();        
        PrivateKey privateKey = (PrivateKey) session.getAttribute(AdminController.RSA_WEB_KEY);
        String equalId=null;
        String equalPwd=null;
        //  
        try {
        	equalId = decryptRsa(privateKey, userId);
        	equalPwd = decryptRsa(privateKey, userPw);
		} catch (Exception e) {
			e.printStackTrace();
		}

        session.removeAttribute("RSAModulus");
        session.removeAttribute("RSAExponent");
        //공개키는 한번쓰고 삭제함 로그인 실패시 새로만듬
        ModelAndView mav = new ModelAndView();
        //
        try {        	
        	SpaoAdminDTO adminDTO = adminDAO.loginAdmin(equalId);
            
        	if(adminDTO==null) {
        		System.out.println("존재하지 않는 아이디 입니다");
                mav.setViewName("loginFail");  
            }
        	else if(!adminDTO.getPwd().equals(equalPwd)) {
        		System.out.println("비번틀림");
                mav.setViewName("loginFail");                
            }            
    		else {			
    			System.out.println("로그인 성공");
    			
    			session.setAttribute("adminId", userId); //암호화된어드민 아이디를 세션에 띄움
    			
    			mav.setViewName("loginOk");
    			
    		}
		} catch (NullPointerException e) {			
			e.printStackTrace();
		}
        return mav;
    }

    
    
    
    
    
    public static String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {  //복호화
        Cipher cipher = Cipher.getInstance(AdminController.RSA_INSTANCE);
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8");
        return decryptedValue;
    }
    
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) { return new byte[] {}; }
 
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
    
    private void initRsa(HttpServletRequest request) {
        HttpSession session = request.getSession();
 
        KeyPairGenerator generator;
        try {
            generator = KeyPairGenerator.getInstance(AdminController.RSA_INSTANCE);
            generator.initialize(1024);
 
            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance(AdminController.RSA_INSTANCE);
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();
 
            session.setAttribute(AdminController.RSA_WEB_KEY, privateKey); // session에 개인키저장
 
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
 
            session.setAttribute("RSAModulus", publicKeyModulus); // rsa modulus 
            session.setAttribute("RSAExponent", publicKeyExponent); // rsa exponent 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }	
}
