package post.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchAddrController {
	@RequestMapping("join/searchAddr.do")
	public String searchAddr() {
		return "searchAddr";
		
	}
	
	@RequestMapping("join/searchRoadAddr.do")
	public String searchRoadAddr() {
		return "searchRoadAddr";
	}
}
