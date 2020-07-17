package Controller;

import java.io.*;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class SendEmail
{
    public static void send(String to,String subject,String msg)
    {
        final String user="fitdotcomsupps@gmail.com";//change accordingly
        final String pass="KAF@07729007685";

        //1st step) Get the session object	
        Properties props = new Properties();
        props.put("mail.smtp.host", "mail.gmail.com");//change accordingly
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props,
         new javax.mail.Authenticator() {
          protected PasswordAuthentication getPasswordAuthentication() {
           return new PasswordAuthentication(user,pass);
           }
        });
        //2nd step)compose message
        try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
         message.setSubject(subject);
         message.setText(msg);

         //3rd step)send message
         Transport.send(message);
         } catch (MessagingException e) {
                throw new RuntimeException(e);
         }
    } 
}