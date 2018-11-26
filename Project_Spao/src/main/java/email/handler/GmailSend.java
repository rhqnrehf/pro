package email.handler;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class GmailSend{
	    public GmailSend(){}
	    
	    final static String username="sodksdml27@gmail.com";
	    final static String password="itbank123";
	    
	    public void sendmail(String userMail,String subject,String content){
	        
	        Properties props = new Properties(); 
	        props.put("mail.smtp.starttls.enable","true"); 
	        props.put("mail.smtp.EnableSSL.enable","true");
	        props.put("mail.smtp.port", "25"); 
	        props.put("mail.debug", "true"); 
	        props.put("mail.smtp.host", "smtp.gmail.com"); 
	        props.put("mail.smtp.auth", "true"); 
	        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
	        props.setProperty("mail.smtp.socketFactory.fallback", "false");   
	        props.setProperty("mail.smtp.port", "465");   
	        props.setProperty("mail.smtp.socketFactory.port", "465"); 
	    
	        Session session = Session.getInstance(props, 
	         new javax.mail.Authenticator() { 
	        protected PasswordAuthentication getPasswordAuthentication() { 
	        	return new PasswordAuthentication(username, password); 
	        }});
	        try{
	            Message message = new MimeMessage(session); 
	            message.setFrom(new InternetAddress("sodksdml27@gmail.com","admin","utf-8"));
	            // 발신자 인수로 아무것도안주거나  없애도 무방하다 하지만 사용할땐 인수를 한개만 주려면 영어로 써주어야한다. 
	            //인수를 두개준다면 앞은 이메일 뒤는 별명이다.
	            //인수를 세개준다면 1 이메일 / 2 별명 / 3 문자셋
	            message.setRecipients(Message.RecipientType.TO,
	            		InternetAddress.parse(userMail));  //받는사람
	            message.setSubject(subject); //제목
	            message.setText(content);//내용 
	            //message.setContent("내용","text/html; charset=utf-8");//글내용을 html타입 charset설정
	            System.out.println("send!!!");
	            Transport.send(message);     //메세지전송
	            System.out.println("SEND");
	            
	        } catch(Exception e){
	            e.printStackTrace();
	        }
	    }    
}
