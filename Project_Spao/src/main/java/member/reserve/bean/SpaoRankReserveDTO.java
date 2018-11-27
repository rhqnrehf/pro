package member.reserve.bean;

import lombok.Data;

@Data
public class SpaoRankReserveDTO {
	private String rn;
	private String id;
	private String name; 
	private String userReserve; //보유적립금
	private String giveReserve; //지급적립금
	private String useReserve; //사용적립금
}
