package com.gt.gettogether.employee.mail;

import java.io.FileReader;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	
	private Properties prop = new Properties();
	
	public Mail(){
		String fileName = Mail.class.getResource("/config/employee/mail.properties").getPath();
		try {
			prop.load(new FileReader(fileName));			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String sendEmail(String to){
		
		String verifyCode = createVerifyCode();
		
		Authenticator auth = new MyAuthentication();

		Session session = Session.getDefaultInstance(prop, auth);
		
		Message msg = new MimeMessage(session);
		
		try {
			// 발신자 메일 주소
			msg.setFrom(new InternetAddress(new MyAuthentication().getMail(), "GETTOGETHER", "UTF-8"));
			// 수신자 메일 주소
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
			
			// 메일 제목
			msg.setSubject("GETTOGETHER 인증번호 메일입니다.");
			
			// 메일 내용
			msg.setContent("인증번호 : [" + verifyCode + "]", "text/html; charset=UTF-8");
			
			Transport.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return verifyCode;
	}
	
	public String createVerifyCode(){
		
		char[] characterRange = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
								 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 
								 'Y', 'Z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
		
		StringBuffer code = new StringBuffer();
		
		for(int i = 0; i < 8; i++)
			code.append(characterRange[(int)(Math.random()*characterRange.length)]);
		
		System.out.println("code : " + code.toString());
	
		return code.toString();
	}
	
}
