package com.food.project.mail;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

@Service
@EnableAsync
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Async
	public void sendMail(MailVO mailVO) throws Exception {
		MimeMessage msg = mailSender.createMimeMessage();
		// 받는사람 설정
		msg.addRecipient(RecipientType.TO, new InternetAddress(mailVO.getReceiveMail()));
		// 보낸사람 설정
		msg.addFrom(new InternetAddress[] {
				new InternetAddress(mailVO.getSenderMail(), mailVO.getSenderName())});
		// 이메일 제목 및 인코딩 설정
		msg.setSubject(mailVO.getSubject(), "utf-8");
		// 이메일 내용 및 인코딩 설정
		msg.setText(mailVO.getMessage(), "utf-8");
		mailSender.send(msg);
		
	}

}







