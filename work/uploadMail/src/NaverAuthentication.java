package mailtest;

import javax.mail.*;

public class NaverAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public NaverAuthentication() {
		passAuth = new PasswordAuthentication("네이버ID", "네이버암호");
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
