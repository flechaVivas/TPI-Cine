package logic;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import data.DataTicket;
import entities.Ticket;

public class TicketController {

	private DataTicket dt;
	
	public TicketController() {
		dt = new DataTicket();
	}
	
	public Ticket getOne(Ticket t) throws SQLException {
		return dt.getOne(t);
	}
	
	public LinkedList<Ticket> getAll() throws SQLException{
		return dt.getAll();
	}
	
	public void add(Ticket t) throws SQLException {
		dt.add(t);
	}
	
	public void update(Ticket t) throws SQLException {
		dt.update(t);
	}
	
	public void delete(Ticket t) throws SQLException {
		dt.delete(t);
	}
	
	public Ticket getLastTicket() throws SQLException {
		return dt.getLast();
	}
	
	public void cancelTicket(Ticket t) throws SQLException {
		dt.cancel(t);
	}
	
	public void envioEmail(Ticket t) throws SQLException, MessagingException{
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.office365.com");
	    props.put("mail.smtp.socketFactory.port", "587");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.starttls.required", "true");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.port", "587");
		
		Session session = Session.getDefaultInstance(props);
		
		final String from = "cinesorfeo@outlook.com";
		String passwordFrom = "@juanponzi1";
		String to = t.getUser().getEmail();
		String asunto = "Tus Tickets";
		
		 try {
			 MimeMessage message = new MimeMessage(session);
			 message.setFrom(new InternetAddress(from));
			 
			 message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			 message.setSubject(asunto);
			 
			 MimeMultipart multipart = new MimeMultipart("related");
			 
			 BodyPart messageBodyPart = new MimeBodyPart();
			 String htmlText = "<h1>Hola esto es una prueba</h1>";
			 
			 messageBodyPart.setContent(htmlText, "text/html");
			 multipart.addBodyPart(messageBodyPart);
			 message.setContent(multipart);
			 Transport tr = session.getTransport("smtp");
			 tr.connect(from, passwordFrom);
			 tr.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
			 tr.close();
			 
		} catch (MessagingException e) {
			throw e;
		}
	}
	
	
	
	
	
	
	
	
}
