package logic;

import java.math.BigDecimal;
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
import entities.Show;
import entities.Ticket;
import entities.Ubication;
import entities.User;

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
	
	public void envioEmail(LinkedList<Ticket> tickets, User u, Show s, LinkedList<Ubication> ubicElegidas) throws SQLException, MessagingException{
		
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
		String to = u.getEmail();
		String asunto = "Tus Tickets";
		
		 try {
			 MimeMessage message = new MimeMessage(session);
			 message.setFrom(new InternetAddress(from));
			 
			 message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			 message.setSubject(asunto);
			 
			 MimeMultipart multipart = new MimeMultipart("related");
			 
			 BodyPart messageBodyPart = new MimeBodyPart();
			 String htmlText = "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" + 
			 		"        <tr>\n" + 
			 		"            <td style=\"padding: 10px 0 30px 0;\">\n" + 
			 		"                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border: 1px solid #cccccc; border-collapse: collapse;\">\n" + 
			 		"                    <tr>\n" + 
			 		"                        <td bgcolor=\"#ffffff\" style=\"padding: 40px 30px 40px 30px;\">\n" + 
			 		"                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td style=\"color: #153643; font-family: Arial, sans-serif; font-size: 24px;\">\n" + 
			 		"                                        <b>Tu ticket</b>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td style=\"padding: 20px 0 30px 0; color: #153643; font-family: Arial, sans-serif; font-size: 16px; line-height: 20px;\">\n" + 
			 		"                                       Gracias por utilizar nuestro sistema de tickets, a continuación se muestra el ticket que has generado.\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td>\n" + 
			 		"                                       Codigo/s de Operacion: <b>"+printCodigosOperacion(tickets)+"</b>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td>\n" + 
			 		"                                        Pelicula: <b>"+s.getMovie().getTitle()+"</b>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td>\n" + 
			 		"                                        Fecha y Hora: <b>"+s.getDt()+"</b>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td>\n" + 
			 		"                                        Sala: <b>"+s.getMovieroom().getRoomNumber()+"</b>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td>\n" + 
			 		"                                        Asientos: <b>"+printUbicaciones(ubicElegidas)+"</b>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td>\n" + 
			 		"                                        Monto Total: <b>"+printMontoTotal(tickets)+"</b>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td>\n" + 
			 		"                                        <br>\n" + 
			 		"                                        <p>Con el/los codigo/s de operacion podrá abonar y retirar sus tickets en boleteria</p>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                                <tr>\n" + 
			 		"                                    <td>\n" + 
			 		"                                        <br>\n" + 
			 		"                                        <p>Dsifrute su pelicula</p>\n" + 
			 		"                                        <p>Orfeo Cines</p>\n" + 
			 		"                                    </td>\n" + 
			 		"                                </tr>\n" + 
			 		"                            </table>\n" + 
			 		"                        </td>\n" + 
			 		"                       \n" + 
			 		"                    </tr>\n" + 
			 		"                </table>";
			 
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

	private BigDecimal printMontoTotal(LinkedList<Ticket> tickets) {
		
		BigDecimal total = new BigDecimal(0);
		
		for (Ticket t : tickets) {
			total.add(t.getPrice());
		}
		
		return total;
	}

	private String printUbicaciones(LinkedList<Ubication> ubicElegidas) {
		
		Character c = '@';
		String ubics = "";
		
		for (Ubication ub : ubicElegidas) {
			ubics += Character.toString(c+ub.getRow()) + ub.getCol();
		}
		
		return ubics;
	}

	private String printCodigosOperacion(LinkedList<Ticket> tickets) {
		
		String codigos = "";
		
		for (Ticket t : tickets) {
			codigos += t.getOperationCode();
		}
		
		return codigos;
		
	}
	
	
	
	
	
	
	
	
}
