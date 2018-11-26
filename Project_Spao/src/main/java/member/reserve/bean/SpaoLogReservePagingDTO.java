package member.reserve.bean;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SpaoLogReservePagingDTO {
	private String rn;
	private LocalDateTime logtime;
	private String id;
	private String name;
	private String won;
	private String reserveLog;
}
