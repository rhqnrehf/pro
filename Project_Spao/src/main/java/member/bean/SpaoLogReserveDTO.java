package member.bean;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class SpaoLogReserveDTO {
   //LogDTO 은 한 이름에 여러개의 컬럼이 만들어질수있음 
	private String id;
	private int won;   //적립금
	private String reservelog;  //적립금 받은사유 
	private LocalDateTime logtime; //적립금 받은날짜
}
