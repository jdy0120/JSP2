package mailtest;

import javax.mail.*;

public class NaverAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public NaverAuthentication() {
		passAuth = new PasswordAuthentication("���̹�ID", "���̹���ȣ");
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
