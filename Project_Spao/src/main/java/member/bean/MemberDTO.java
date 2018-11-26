package member.bean;

import java.time.LocalDate;
import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private String name;
	private String id;
	private String pwd;
	private String birth;
	private String liftLucar; //생일 양력 음력 1=양력 0=음력
	private String phoneNumber;
	private String address1,address2;
	private String email1;
	private String email2;
	private String marriage;  //결혼유무 Y / N
	private String anniversary; //결혼기념일
	private LocalDate logtime;

	
}
