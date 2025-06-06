<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - Enter Email</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            padding: 40px;
            width: 100%;
            max-width: 450px;
            text-align: center;
        }
        .logo {
            margin-bottom: 20px;
            font-size: 40px;
        }
        h1 {
            color: #3a3ab5;
            font-size: 24px;
            margin-bottom: 15px;
        }
        p {
            color: #555;
            margin-bottom: 30px;
            font-size: 16px;
        }
        .input-group {
            margin-bottom: 25px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 15px;
        }
        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 15px;
        }
        button {
            background-color: #3a3ab5;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 14px 0;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
        }
        button:hover {
            background-color: #2e2e99;
        }
        .support-text {
            margin-top: 25px;
            font-size: 14px;
            color: #555;
        }
        .support-text a {
            color: #3a3ab5;
            text-decoration: none;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
        .success-message {
            color: green;
            font-size: 14px;
            margin-top: 10px;
        }
        .otp-message {
            color: blue;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">🎓</div>
        <h1>Student Portal</h1>
        <p>Enter your email to receive an OTP</p>
        
        <% 
        String error = (String) session.getAttribute("error");
        String success = (String) session.getAttribute("success");
        String otpMessage = (String) session.getAttribute("otpMessage");
        
        // Clear messages after displaying
        if(error != null) session.removeAttribute("error");
        if(success != null) session.removeAttribute("success");
        if(otpMessage != null) session.removeAttribute("otpMessage");
        %>
        
        <% if (error != null) { %>
            <div class="error-message"><%= error %></div>
        <% } %>
        <% if (success != null) { %>
            <div class="success-message"><%= success %></div>
        <% } %>
        <% if (otpMessage != null) { %>
            <div class="otp-message"><%= otpMessage %></div>
        <% } %>

        <form action="sendEmail" method="POST">
            <div class="input-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" 
                       placeholder="Enter your email address" required>
            </div>
            <button type="submit">Send OTP</button>
        </form>
        
        <div class="support-text">
            Need assistance? <a href="#">Contact Support</a>
        </div>
    </div>
</body>
</html>