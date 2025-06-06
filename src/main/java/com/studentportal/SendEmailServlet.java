package com.studentportal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import java.util.Random;
import jakarta.mail.*;
import jakarta.mail.internet.*;

@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("Database driver not found", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Set session timeout to 30 minutes (1800 seconds)
        session.setMaxInactiveInterval(1800);
        try {
            String email = request.getParameter("email");
            session.setAttribute("email", email);

            if (email == null || !email.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                session.setAttribute("error", "Invalid email format");
                response.sendRedirect("index.jsp");
                return;
            }

            String otp = generateOTP();
            session.setAttribute("generatedOTP", otp);

            // Store in database
            try (Connection conn = getConnection();
                 PreparedStatement stmt = conn.prepareStatement(
                     "INSERT INTO student_records (email, otp) VALUES (?, ?)")) {
                stmt.setString(1, email);
                stmt.setString(2, otp);
                stmt.executeUpdate();
            } catch (SQLException e) {
                session.setAttribute("error", "Database error: " + e.getMessage());
                response.sendRedirect("index.jsp");
                return;
            }

            // Send email
            try {
                sendEmail(email, otp);
                session.setAttribute("success", "OTP sent to " + email);
            } catch (MessagingException e) {
                session.setAttribute("error", "Email sending failed. Use this OTP: " + otp);
            }
            
            response.sendRedirect("verify-otp.jsp");

        } catch (Exception e) {
            session.setAttribute("error", "System error: " + e.getMessage());
            response.sendRedirect("index.jsp");
        }
    }

    private String generateOTP() {
        return String.format("%06d", new Random().nextInt(999999));
    }

    private void sendEmail(String recipient, String otp) throws MessagingException {
        final String username = "hellfirehariyup@gmail.com"; // Replace with your email
        final String password = "eizk jdoo zsgb pfnr";    // Use App Password for Gmail

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject("Your Student Portal OTP");
        message.setText("Your verification code is: " + otp + "\n\nThis OTP is valid for 30 minutes.");

        Transport.send(message);
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
        		"jdbc:mysql://localhost:3306/studentportal_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true",
            "root",   // Replace with DB username
            "VENKY@1234venky"    // Replace with DB password
        );
    }
}