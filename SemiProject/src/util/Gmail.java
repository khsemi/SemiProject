package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//실제 이메일을 발송하게될 gmail정보 입력
		return new PasswordAuthentication("이메일","비밀번호");
	}
}
