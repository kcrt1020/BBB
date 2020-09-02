package SMTPAuthenticator;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	 @Override
	    protected PasswordAuthentication getPasswordAuthentication() {
	        return new PasswordAuthentication("wheesk2","mz167524");
	    }



}
