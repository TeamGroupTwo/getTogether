package com.gt.gettogether.employee.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {

	private String mail = "get.together.g2@gmail.com";
	private String password = "gettogether02";
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(mail, password);
	}

	public String getMail() {
		return mail;
	}

}
