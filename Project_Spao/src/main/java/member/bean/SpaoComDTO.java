package member.bean;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SpaoComDTO {
	private String id;
	private int hit;		//방문횟수
	private int reserve;	//현재 보유중인 적립금
	private int orderHit;   //주문횟수
	private int orderTotal;	//주문 총액
	private LocalDateTime visit; //마지막 방문날짜
}
