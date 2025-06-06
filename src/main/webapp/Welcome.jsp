<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Campus Connect</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            overflow: hidden;
            height: 100vh;
        }
        
        .welcome-container {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #6a6dd3, #3a3d9e);
            color: white;
            position: relative;
        }
        
        .logo {
            font-size: 60px;
            opacity: 0;
            animation: fadeIn 1s ease-in-out 0.5s forwards;
            line-height: 1;
        }
        
        .logo-icon {
            display: inline-block;
            width: 60px;
            height: 60px;
        }
        
        h1 {
            font-size: 42px;
            margin: 20px 0;
            opacity: 0;
            transform: translateY(20px);
            animation: slideUp 1s ease-in-out 1s forwards;
        }
        
        .tagline {
            font-size: 18px;
            opacity: 0;
            transform: translateY(20px);
            animation: slideUp 1s ease-in-out 1.5s forwards;
            text-align: center;
            max-width: 600px;
            margin-bottom: 40px;
        }
        
        .cta-button {
            background-color: white;
            color: #5052b5;
            border: none;
            border-radius: 30px;
            padding: 15px 40px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            opacity: 0;
            transform: translateY(20px);
            animation: slideUp 1s ease-in-out 2s forwards;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        
        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        
        .circles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }
        
        .circle {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 15s linear infinite;
        }
        
        .welcome-content {
            position: relative;
            z-index: 2;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        
        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-1000px) rotate(720deg);
                opacity: 0;
            }
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .features {
            display: flex;
            justify-content: space-around;
            width: 100%;
            max-width: 800px;
            margin-top: 60px;
            opacity: 0;
            animation: fadeIn 1s ease-in-out 2.5s forwards;
        }
        
        .feature {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0 20px;
        }
        
        .feature-icon {
            font-size: 32px;
            margin-bottom: 15px;
        }
        
        .feature-text {
            font-size: 14px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <div class="circles" id="circles"></div>
        
        <div class="welcome-content">
            <div class="logo">
                <svg class="logo-icon" viewBox="0 0 24 24" fill="white">
                    <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                    <text x="18" y="8" fill="white" font-size="10" font-weight="bold">+</text>
                </svg>
            </div>
            <h1>Campus Connect</h1>
            <p class="tagline">Connect, collaborate, and navigate your campus experience with ease</p>
            
            <button class="cta-button" onclick="window.location.href='index.jsp'">Get Started</button>
            
            <div class="features">
                <div class="feature">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="white">
                            <path d="M21 5c-1.11-.35-2.33-.5-3.5-.5-1.95 0-4.05.4-5.5 1.5-1.45-1.1-3.55-1.5-5.5-1.5S2.45 4.9 1 6v14.65c0 .25.25.5.5.5.1 0 .15-.05.25-.05C3.1 20.45 5.05 20 6.5 20c1.95 0 4.05.4 5.5 1.5 1.35-.85 3.8-1.5 5.5-1.5 1.65 0 3.35.3 4.75 1.05.1.05.15.05.25.05.25 0 .5-.25.5-.5V6c-.6-.45-1.25-.75-2-1zm0 13.5c-1.1-.35-2.3-.5-3.5-.5-1.7 0-4.15.65-5.5 1.5V8c1.35-.85 3.8-1.5 5.5-1.5 1.2 0 2.4.15 3.5.5v11.5z"/>
                        </svg>
                    </div>
                    <div class="feature-text">Access course materials and resources</div>
                </div>
                <div class="feature">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="white">
                            <path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"/>
                        </svg>
                    </div>
                    <div class="feature-text">Connect with peers and professors</div>
                </div>
                <div class="feature">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="white">
                            <path d="M19 3h-1V1h-2v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm0 16H5V8h14v11zM7 10h5v5H7z"/>
                        </svg>
                    </div>
                    <div class="feature-text">Stay updated with events and schedules</div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Create animated background circles
        document.addEventListener('DOMContentLoaded', function() {
            const circlesContainer = document.getElementById('circles');
            const circleCount = 12;
            
            for (let i = 0; i < circleCount; i++) {
                createCircle(circlesContainer);
            }
        });
        
        function createCircle(container) {
            const circle = document.createElement('div');
            circle.classList.add('circle');
            
            // Random size between 50px and 200px
            const size = Math.random() * 150 + 50;
            circle.style.width = `${size}px`;
            circle.style.height = `${size}px`;
            
            // Random position
            const posX = Math.random() * 100;
            const posY = Math.random() * 100 + 100; // Start from below the viewport
            circle.style.left = `${posX}%`;
            circle.style.top = `${posY}%`;
            
            // Random animation duration
            const duration = Math.random() * 10 + 10;
            circle.style.animationDuration = `${duration}s`;
            
            // Random animation delay
            const delay = Math.random() * 5;
            circle.style.animationDelay = `${delay}s`;
            
            container.appendChild(circle);
        }
        
        // Redirect to login page after 3 seconds of clicking the button
        document.querySelector('.cta-button').addEventListener('click', function() {
            setTimeout(function() {
                // Assuming your original login page is saved as login.html
                window.location.href = 'index.jsp';
            }, 300);
        });
    </script>
</body>
</html>