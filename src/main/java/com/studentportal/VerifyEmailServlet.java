package com.studentportal;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/verifyEmail")
public class VerifyEmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database configuration - UPDATE THESE WITH YOUR CREDENTIALS
    private static final String DB_URL = "jdbc:mysql://localhost:3306/studentportal_db?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "VENKY@1234venky";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String otp = request.getParameter("otp");
        String generatedOTP = (String) session.getAttribute("generatedOTP");
        String email = (String) session.getAttribute("email");

        try {
            // OTP Verification
            if (otp != null) {
                if (generatedOTP == null || email == null) {
                    session.setAttribute("error", "Session expired. Please start over.");
                    response.sendRedirect("index.jsp");
                    return;
                }

                if (otp.equals(generatedOTP)) {
                    // Keep generatedOTP in session until student details are submitted
                    response.sendRedirect("student-details.jsp");
                } else {
                    session.setAttribute("error", "Invalid OTP. Please try again.");
                    response.sendRedirect("verify-otp.jsp");
                }
            } else {
                // Student Details Submission
                if (generatedOTP == null || email == null) {
                    session.setAttribute("error", "Session expired. Please start over.");
                    response.sendRedirect("index.jsp");
                    return;
                }

                String studentName = request.getParameter("studentName");
                String rollNumber = request.getParameter("rollNumber");

                if (studentName == null || rollNumber == null || 
                    studentName.trim().isEmpty() || rollNumber.trim().isEmpty()) {
                    session.setAttribute("error", "All fields are required.");
                    response.sendRedirect("student-details.jsp");
                    return;
                }

                try (Connection conn = getConnection();
                     PreparedStatement stmt = conn.prepareStatement(
                         "UPDATE student_records SET student_name = ?, roll_number = ? " +
                         "WHERE email = ? AND otp = ?")) {
                    
                    stmt.setString(1, studentName.trim());
                    stmt.setString(2, rollNumber.trim());
                    stmt.setString(3, email);
                    stmt.setString(4, generatedOTP);
                    
                    int rowsUpdated = stmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        // Now remove generatedOTP and invalidate session
                        session.removeAttribute("generatedOTP");
                        session.invalidate(); // Clear session after successful submission
                        response.sendRedirect("notice-board.jsp");
                    } else {
                        session.setAttribute("error", "Failed to save details. No matching record found.");
                        response.sendRedirect("student-details.jsp");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("error", "Database error: " + e.getMessage());
            response.sendRedirect(otp != null ? "verify-otp.jsp" : "student-details.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "System error: " + e.getMessage());
            response.sendRedirect("index.jsp");
        }
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}