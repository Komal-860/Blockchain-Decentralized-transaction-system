package mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendKeyMail {
	
	public static void SendOTP(String email,String otpcode, String invisbleseq)
	{
		
		
		 String result;
	
		 	Properties props = System.getProperties();
	        String host = "smtp.gmail.com";
	        String from = "bankdetail6@gmail.com";
	        String pass = "mxuqjuunisaujcio";
	        String to = email;
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", from);
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.port", "587");     
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.timeout", "25000");
	        Session mailsession = Session.getDefaultInstance(props);
	   
	   try
	   {
	        MimeMessage message = new MimeMessage(mailsession);       
	        message.setFrom(new InternetAddress(from));   
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	      
	       	      message.setSubject("OTP Code");
		        message.setText("Your OTP Code is: "+otpcode+"\n "+invisbleseq+" Please don't share with anyone");
		        	
	       
	        Transport transport = mailsession.getTransport("smtp");
	        transport.connect(host, from, pass);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
	        result = "Message sent successfully....check your registered  Mail ID";
	      
	       
	    }catch (MessagingException mex) {
	      mex.printStackTrace();
	      result = "Error: unable to send message....";
	    }
		 }  
	public static void Sendforgetpassword(String email,String otpcode)
	{
		
		
		 String result;
	
		 	Properties props = System.getProperties();
	        String host = "smtp.gmail.com";
	        String from = "college2021project@gmail.com";
	        String pass = "Ritesh1432";
	        String to = email;
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", from);
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.port", "587");     
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.timeout", "25000");
	        Session mailsession = Session.getDefaultInstance(props);
	   
	   try
	   {
	        MimeMessage message = new MimeMessage(mailsession);       
	        message.setFrom(new InternetAddress(from));   
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	      
	       	        	message.setSubject("Forget Password");
		        message.setText("Your login Password  is: "+otpcode+"\nPlease don't share with anyone");
		        	
	       
	        Transport transport = mailsession.getTransport("smtp");
	        transport.connect(host, from, pass);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
	        result = "Message sent successfully....check your registered  Mail ID";
	      
	       
	    }catch (MessagingException mex) {
	      mex.printStackTrace();
	      result = "Error: unable to send message....";
	    }
		 } 
	public static void SendAccept(String email)
	{
		
		
		 String result;
	
		 	Properties props = System.getProperties();
	        String host = "smtp.gmail.com";
	        String from = "college2021project@gmail.com";
	        String pass = "Ritesh1432";
	        String to = email;
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", from);
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.port", "587");     
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.timeout", "25000");
	        Session mailsession = Session.getDefaultInstance(props);
	   
	   try
	   {
	        MimeMessage message = new MimeMessage(mailsession);       
	        message.setFrom(new InternetAddress(from));   
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	      
	        message.setSubject("Your Request Accept");
	        message.setText("Request Accept");
		        	
	       
	        Transport transport = mailsession.getTransport("smtp");
	        transport.connect(host, from, pass);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
	        result = "Message sent successfully....check your registered  Mail ID";
	      
	       
	    }catch (MessagingException mex) {
	      mex.printStackTrace();
	      result = "Error: unable to send message....";
	    }
		 } 
	public static void SendReject(String email)
	{
		
		
		 String result;
	
		 	Properties props = System.getProperties();
	        String host = "smtp.gmail.com";
	        String from = "college2021project@gmail.com";
	        String pass = "Ritesh1432";
	        String to = email;
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.user", from);
	        props.put("mail.smtp.password", pass);
	        props.put("mail.smtp.port", "587");     
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.timeout", "25000");
	        Session mailsession = Session.getDefaultInstance(props);
	   
	   try
	   {
	        MimeMessage message = new MimeMessage(mailsession);       
	        message.setFrom(new InternetAddress(from));   
	        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	      
	       	        	message.setSubject("Your Request Reject");
		        message.setText("Request Reject");
		        	
	       
	        Transport transport = mailsession.getTransport("smtp");
	        transport.connect(host, from, pass);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
	        result = "Message sent successfully....check your registered  Mail ID";
	      
	       
	    }catch (MessagingException mex) {
	      mex.printStackTrace();
	      result = "Error: unable to send message....";
	    }
		 } 
}
