package member.bean;

import java.time.LocalDate;
import java.util.Date;

import lombok.Data;

@Data
public class MemberPagingDTO {
	private String rn;
	private String name;
	private String id;
	private LocalDate logtime;
	
	private int orderHit;   //주문횟수
	private int hit;		//방문횟수
	private int reserve;	//현재 보유중인 적립금
	private int orderTotal;	//주문 총액

}
