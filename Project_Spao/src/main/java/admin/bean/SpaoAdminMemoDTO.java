package admin.bean;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SpaoAdminMemoDTO {
	private String adminId;
	private String content;
	private LocalDateTime logtime;
	private String userId;
}
