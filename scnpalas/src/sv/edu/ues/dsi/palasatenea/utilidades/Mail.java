package sv.edu.ues.dsi.palasatenea.utilidades;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {    
	private final Properties properties = new Properties();    
	private Session session;    
	private void init() {        
		properties.put("mail.smtp.host", "smtp.gmail.com");        
		properties.put("mail.smtp.starttls.enable", "true");        
		properties.put("mail.smtp.port", 587);        
		properties.put("mail.smtp.mail.sender", "colegiopalasatenea2014@gmail.com");        
		properties.put("mail.smtp.password", "dsi2152014");        
		properties.put("mail.smtp.user", "colegiopalasatenea2014@gmail.com");        
		properties.put("mail.smtp.auth", "true");        
		session = Session.getDefaultInstance(properties);    
	}    
	public void send(String destino,String asunto, String mensaje) {        
		init();        
		try {            
			MimeMessage message = new MimeMessage(session);            
			message.setFrom(new InternetAddress((String) properties.get("mail.smtp.mail.sender")));            
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(destino));            
			message.setSubject(asunto);            
			message.setText(mensaje);            
			Transport t = session.getTransport("smtp");            
			t.connect((String) properties.get("mail.smtp.user"), (String) properties.get("mail.smtp.password"));            
			t.sendMessage(message, message.getAllRecipients());            
			t.close();        
		} catch (MessagingException e) {            
			return;        
		}    
	}
}