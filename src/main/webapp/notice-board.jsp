<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Digital Notice Board</title>
    <style>
        :root {
            --primary: #4e54c8;
            --primary-light: #6e78ff;
            --secondary: #8f94fb;
            --accent: #ff7e5f;
            --accent-dark: #e55b3c;
            --light: #f9f9f9;
            --dark: #333;
            --success: #2ecc71;
            --success-dark: #27ae60;
            --warning: #f39c12;
            --warning-dark: #d35400;
            --danger: #e74c3c;
            --danger-dark: #c0392b;
            --info: #3498db;
            --info-dark: #2980b9;
            --dark-bg: #1a1a1a;
            --dark-text: #e0e0e0;
            --dark-card: #2c2c2c;
            --highlight: #f1c40f;
            --highlight-dark: #d4ac0d;
            --neutral: #bdc3c7;
            --neutral-dark: #7f8c8d;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Poppins", sans-serif;
            background: url("https://www.transparenttextures.com/patterns/paper-fibers.png"), linear-gradient(135deg, #f5f5dc 0%, #fff8e1 100%);
            color: var(--dark);
            line-height: 1.6;
            position: relative;
            overflow-x: hidden;
            transition: background 0.5s ease;
        }

        body.dark-mode {
            background: url("https://www.transparenttextures.com/patterns/paper-fibers.png"), linear-gradient(135deg, #2f2f2f 0%, #1c1c1c 100%);
            color: var(--dark-text);
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 30px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            position: relative;
            border: 5px solid rgba(255, 255, 255, 0.5);
            background-clip: padding-box;
            animation: zoomInBounce 1.5s ease-out;
        }

        @keyframes zoomInBounce {
            0% { transform: scale(0.5); opacity: 0; }
            60% { transform: scale(1.1); opacity: 1; }
            80% { transform: scale(0.95); }
            100% { transform: scale(1); }
        }

        .container::before {
            content: "";
            position: absolute;
            top: -20px;
            left: -20px;
            right: -20px;
            bottom: -20px;
            background: url("https://www.transparenttextures.com/patterns/vine.png");
            opacity: 0.15;
            z-index: -1;
            border-radius: 25px;
            animation: rippleEffect 8s infinite;
        }

        @keyframes rippleEffect {
            0% { transform: scale(1); opacity: 0.15; filter: blur(2px); }
            50% { transform: scale(1.05); opacity: 0.3; filter: blur(0px); }
            100% { transform: scale(1); opacity: 0.15; filter: blur(2px); }
        }

        body.dark-mode .container {
            background: rgba(44, 44, 44, 0.95);
            border: 5px solid rgba(255, 255, 255, 0.3);
        }

        header {
            background: linear-gradient(90deg, var(--primary) 0%, var(--info) 50%, var(--secondary) 100%);
            color: white;
            padding: 30px 0;
            text-align: center;
            border-radius: 15px 15px 0 0;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            position: relative;
            overflow: hidden;
            animation: gradientFlow 10s ease infinite;
        }

        @keyframes gradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        header::after {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent);
            animation: lightSweep 4s infinite;
        }

        @keyframes lightSweep {
            0% { left: -100%; }
            50% { left: 100%; }
            100% { left: 100%; }
        }

        header h1 {
            margin: 0;
            letter-spacing: 4px;
            font-size: 48px;
            text-shadow: 3px 3px 8px rgba(0,0,0,0.4);
            font-family: "Montserrat", sans-serif;
            position: relative;
            display: inline-block;
            
        }

        @keyframes neonFlicker {
            0%, 19%, 21%, 23%, 25%, 54%, 56%, 100% { text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 20px var(--primary), 0 0 40px var(--primary); }
            20%, 24%, 55% { text-shadow: none; }
        }

        .header-icon {
            font-size: 32px;
            margin-right: 15px;
            vertical-align: middle;
            animation: spinAndScale 2s infinite;
        }

        
        .date-time {
            background: linear-gradient(45deg, var(--light) 0%, rgba(255,255,255,0.97) 100%);
            padding: 15px 25px;
            font-size: 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e1e5eb;
            color: var(--primary);
            font-weight: 600;
            box-shadow: 0 3px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            margin: 20px 0;
            position: relative;
            overflow: hidden;
            animation: slideInLeft 1s ease-out;
        }

        @keyframes slideInLeft {
            0% { transform: translateX(-100%); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }

        .date-time:hover {
            transform: scale(1.02) rotate(1deg);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        body.dark-mode .date-time {
            background: linear-gradient(45deg, var(--dark-card) 0%, rgba(44, 44, 44, 0.97) 100%);
            border-bottom: 1px solid #444;
            color: var(--primary-light);
        }

        .theme-toggle {
            background: linear-gradient(90deg, var(--primary), var(--info));
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            animation: buttonPulse 2s infinite;
        }

        @keyframes buttonPulse {
            0% { transform: scale(1); box-shadow: 0 0 5px var(--primary); }
            50% { transform: scale(1.05); box-shadow: 0 0 15px var(--info); }
            100% { transform: scale(1); box-shadow: 0 0 5px var(--primary); }
        }

        .theme-toggle:hover {
            background: linear-gradient(90deg, var(--primary-light), var(--info-dark));
            transform: scale(1.1) rotate(5deg);
        }

        .theme-toggle::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.5), transparent);
            transition: 0.5s;
        }

        .theme-toggle:hover::before {
            left: 100%;
        }

        .board-section {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            overflow: hidden;
            transition: all 0.4s ease;
            position: relative;
            animation: floatIn 1.2s ease-out;
        }

        @keyframes floatIn {
            0% { transform: translateY(50px) rotate(-2deg); opacity: 0; }
            60% { transform: translateY(-10px) rotate(1deg); opacity: 1; }
            100% { transform: translateY(0) rotate(0deg); }
        }

        .board-section:hover {
            transform: translateY(-10px) rotate(2deg);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        body.dark-mode .board-section {
            background-color: var(--dark-card);
        }

        .section-header {
            padding: 20px 25px;
            font-size: 24px;
            font-weight: 700;
            display: flex;
            align-items: center;
            color: white;
            position: relative;
            animation: expandIn 0.8s ease;
        }

        @keyframes expandIn {
            0% { transform: scaleX(0); opacity: 0; }
            100% { transform: scaleX(1); opacity: 1; }
        }

        .timetable-header {
            background: linear-gradient(90deg, var(--info) 0%, var(--info-dark) 100%);
        }

        .events-header {
            background: linear-gradient(90deg, var(--success) 0%, var(--success-dark) 100%);
        }

        .announcements-header {
            background: linear-gradient(90deg, var(--accent) 0%, var(--accent-dark) 100%);
        }

        .section-icon {
            margin-right: 12px;
            font-size: 28px;
            animation: bounceAndRotate 2s infinite;
        }

        @keyframes bounceAndRotate {
            0% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-10px) rotate(180deg); }
            100% { transform: translateY(0) rotate(360deg); }
        }

        .section-content {
            padding: 25px;
            position: relative;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.08);
            animation: tableReveal 1s ease-out;
        }

        @keyframes tableReveal {
            0% { transform: translateY(20px); opacity: 0; clip-path: inset(0 100% 0 0); }
            100% { transform: translateY(0); opacity: 1; clip-path: inset(0 0 0 0); }
        }

        th, td {
            padding: 18px 20px;
            text-align: left;
            transition: background 0.3s ease;
        }

        th {
            background: linear-gradient(90deg, rgba(78, 84, 200, 0.15), rgba(78, 84, 200, 0.3));
            color: var(--primary);
            font-weight: 600;
            font-size: 16px;
            border-bottom: 2px solid var(--primary-light);
        }

        body.dark-mode th {
            background: linear-gradient(90deg, rgba(78, 84, 200, 0.25), rgba(78, 84, 200, 0.4));
            color: var(--primary-light);
        }

        td {
            border-bottom: 1px solid #eef0f5;
        }

        body.dark-mode td {
            border-bottom: 1px solid #444;
        }

        tr:hover td {
            background-color: rgba(78, 84, 200, 0.08);
            transform: scale(1.01);
        }

        body.dark-mode tr:hover td {
            background-color: rgba(78, 84, 200, 0.15);
        }

        .lunch-break {
            text-align: center;
            background-color: #f8f9fa;
            font-weight: 500;
            color: #666;
            animation: heartbeat 1.5s infinite;
        }

        @keyframes heartbeat {
            0% { transform: scale(1); }
            20% { transform: scale(1.1); }
            40% { transform: scale(1); }
            60% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        body.dark-mode .lunch-break {
            background-color: #333;
            color: #bbb;
        }

        .event-item, .announcement-item {
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 12px;
            background-color: white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            border-left: 6px solid #ddd;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
            animation: cardPopIn 0.8s ease-out;
        }

        @keyframes cardPopIn {
            0% { transform: scale(0.8) rotate(-5deg); opacity: 0; }
            60% { transform: scale(1.05) rotate(2deg); opacity: 1; }
            100% { transform: scale(1) rotate(0deg); }
        }

        .event-item:hover, .announcement-item:hover {
            transform: translateX(15px) rotate(3deg);
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            border-left-color: var(--highlight);
        }

        body.dark-mode .event-item, body.dark-mode .announcement-item {
            background-color: var(--dark-card);
        }

        .event-title, .announcement-title {
            font-weight: 700;
            font-size: 20px;
            margin-bottom: 10px;
            color: var(--primary);
            display: flex;
            align-items: center;
            animation: titleFadeIn 1s ease;
        }

        @keyframes titleFadeIn {
            0% { transform: translateY(-20px); opacity: 0; letter-spacing: -2px; }
            100% { transform: translateY(0); opacity: 1; letter-spacing: 0; }
        }

        body.dark-mode .event-title, body.dark-mode .announcement-title {
            color: var(--primary-light);
        }

        .event-date, .announcement-date {
            font-size: 15px;
            color: #666;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            animation: dateSlideIn 1s ease;
        }

        @keyframes dateSlideIn {
            0% { transform: translateX(-30px); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }

        body.dark-mode .event-date, body.dark-mode .announcement-date {
            color: #bbb;
        }

        .date-icon, .title-icon {
            margin-right: 10px;
            color: var(--primary);
            animation: iconWobble 2s infinite;
        }

        @keyframes iconWobble {
            0% { transform: rotate(0deg); }
            15% { transform: rotate(15deg); }
            30% { transform: rotate(-15deg); }
            45% { transform: rotate(10deg); }
            60% { transform: rotate(-10deg); }
            100% { transform: rotate(0deg); }
        }

        body.dark-mode .date-icon, body.dark-mode .title-icon {
            color: var(--primary-light);
        }

        .event-description, .announcement-description {
            font-size: 16px;
            line-height: 1.7;
            color: #555;
            animation: textExpand 1.2s ease;
        }

        @keyframes textExpand {
            0% { transform: scaleY(0); opacity: 0; }
            100% { transform: scaleY(1); opacity: 1; }
        }

        body.dark-mode .event-description, body.dark-mode .announcement-description {
            color: #ccc;
        }

        .important {
            border-left: 6px solid var(--danger);
            background-color: rgba(231, 76, 60, 0.08);
        }

        body.dark-mode .important {
            background-color: rgba(231, 76, 60, 0.15);
        }

        .badge {
            display: inline-block;
            padding: 6px 12px;
            font-size: 13px;
            font-weight: bold;
            border-radius: 25px;
            margin-right: 10px;
            box-shadow: 0 3px 6px rgba(0,0,0,0.1);
            text-transform: uppercase;
            transition: transform 0.3s ease;
            animation: badgeSpinIn 0.8s ease-out;
        }

        @keyframes badgeSpinIn {
            0% { transform: rotateY(90deg); opacity: 0; }
            100% { transform: rotateY(0deg); opacity: 1; }
        }

        .badge:hover {
            transform: rotateY(360deg) scale(1.1);
        }

        .badge-important { background: linear-gradient(45deg, var(--danger), var(--danger-dark)); color: white; }
        .badge-academic { background: linear-gradient(45deg, var(--info), var(--info-dark)); color: white; }
        .badge-cultural { background: linear-gradient(45deg, #9b59b6, #8e44ad); color: white; }
        .badge-sports { background: linear-gradient(45deg, var(--success), var(--success-dark)); color: white; }
        .badge-deadline { background: linear-gradient(45deg, var(--warning), var(--warning-dark)); color: white; }

        footer {
            text-align: center;
            padding: 25px 0;
            font-size: 15px;
            color: #666;
            background-color: white;
            border-radius: 0 0 15px 15px;
            box-shadow: 0 -3px 12px rgba(0,0,0,0.1);
            animation: fadeInUp 1s ease;
        }

        @keyframes fadeInUp {
            0% { transform: translateY(20px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        body.dark-mode footer {
            background-color: var(--dark-card);
            color: #bbb;
        }

        .quick-links {
            display: flex;
            justify-content: center;
            margin-top: 15px;
        }

        .quick-link {
            margin: 0 15px;
            color: var(--primary);
            text-decoration: none;
            transition: all 0.3s ease;
            position: relative;
            animation: linkPop 0.5s ease forwards;
        }

        @keyframes linkPop {
            0% { transform: scale(0); opacity: 0; }
            70% { transform: scale(1.2); opacity: 1; }
            100% { transform: scale(1); }
        }

        .quick-link:hover {
            color: var(--highlight);
            transform: translateY(-5px) rotate(2deg);
        }

        .quick-link::after {
            content: "";
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -2px;
            left: 0;
            background-color: var(--highlight);
            transition: width 0.3s ease;
        }

        .quick-link:hover::after {
            width: 100%;
        }

        .tab-container {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            overflow: hidden;
            animation: tabContainerReveal 1s ease;
        }

        @keyframes tabContainerReveal {
            0% { transform: scaleX(0) scaleY(0); opacity: 0; }
            50% { transform: scaleX(1.1) scaleY(0.5); opacity: 0.5; }
            100% { transform: scaleX(1) scaleY(1); opacity: 1; }
        }

        body.dark-mode .tab-container {
            background: var(--dark-card);
        }

        .tabs {
            display: flex;
            background: var(--light);
            border-bottom: 1px solid #e1e5eb;
        }

        body.dark-mode .tabs {
            background: #333;
            border-bottom: 1px solid #444;
        }

        .tab {
            padding: 18px 25px;
            cursor: pointer;
            transition: all 0.4s ease;
            font-weight: 600;
            color: #777;
            display: flex;
            align-items: center;
            position: relative;
            animation: tabSlideUp 0.8s ease;
        }

        @keyframes tabSlideUp {
            0% { transform: translateY(20px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        .tab:hover:not(.active) {
            background: linear-gradient(45deg, rgba(78, 84, 200, 0.1), rgba(78, 84, 200, 0.2));
            color: var(--primary-light);
            transform: translateY(-5px) rotate(2deg);
        }

        .tab.active {
            color: var(--primary);
            background: white;
            border-bottom: 4px solid var(--primary);
            animation: tabGlow 1s ease;
        }

        @keyframes tabGlow {
            0% { box-shadow: 0 0 0 var(--primary); }
            50% { box-shadow: 0 0 15px var(--primary); }
            100% { box-shadow: 0 0 0 var(--primary); }
        }

        body.dark-mode .tab.active {
            color: var(--primary-light);
            background: var(--dark-card);
            border-bottom: 4px solid var(--primary-light);
        }

        .tab-icon {
            margin-right: 10px;
            font-size: 20px;
            animation: iconSwing 2s infinite;
        }

        @keyframes iconSwing {
            0% { transform: rotate(0deg); }
            25% { transform: rotate(15deg); }
            50% { transform: rotate(0deg); }
            75% { transform: rotate(-15deg); }
            100% { transform: rotate(0deg); }
        }

        .tab-content {
            display: none;
            padding: 25px;
            animation: contentFadeIn 0.8s ease;
        }

        @keyframes contentFadeIn {
            0% { opacity: 0; transform: translateY(10px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .tab-content.active {
            display: block;
        }

        .weather-widget {
            background: linear-gradient(135deg, var(--info), var(--info-dark), var(--primary));
            color: white;
            padding: 20px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            margin-bottom: 20px;
            position: relative;
            overflow: hidden;
            animation: weatherExpand 1s ease;
        }

        @keyframes weatherExpand {
            0% { transform: scale(0.5); opacity: 0; border-radius: 50%; }
            100% { transform: scale(1); opacity: 1; border-radius: 12px; }
        }

        .weather-widget::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(255,255,255,0.1), rgba(255,255,255,0.3));
            opacity: 0.4;
            pointer-events: none;
        }

        .weather-icon {
            font-size: 40px;
            margin-right: 20px;
            animation: weatherFloat 3s infinite ease-in-out;
        }

        @keyframes weatherFloat {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }

        .weather-temp {
            font-size: 32px;
            font-weight: 700;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.3);
            animation: tempBlink 2s infinite;
        }

        @keyframes tempBlink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
        }

        .weather-desc {
            font-size: 16px;
            opacity: 0.9;
            animation: descFade 1.5s ease;
        }

        @keyframes descFade {
            0% { opacity: 0; transform: translateX(20px); }
            100% { opacity: 0.9; transform: translateX(0); }
        }

        .branch-selector {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            position: relative;
            animation: selectorSlide 1s ease;
        }

        @keyframes selectorSlide {
            0% { transform: translateX(-50px); opacity: 0; }
            100% { transform: translateX(0); opacity: 1; }
        }

        .branch-selector label {
            margin-right: 12px;
            font-weight: 600;
            color: var(--primary);
            font-family: "Montserrat", sans-serif;
        }

        body.dark-mode .branch-selector label {
            color: var(--primary-light);
        }

        .branch-selector select {
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 17px;
            color: var(--dark);
            background-color: var(--light);
            cursor: pointer;
            transition: all 0.4s ease;
            font-family: "Roboto", sans-serif;
            appearance: none;
            background-image: url("data:image/svg+xml;utf8,<svg fill='%234e54c8' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/></svg>");
            background-repeat: no-repeat;
            background-position: right 12px center;
            padding-right: 35px;
            animation: selectGlow 2s infinite;
        }

        @keyframes selectGlow {
            0% { box-shadow: 0 0 5px rgba(78, 84, 200, 0.2); }
            50% { box-shadow: 0 0 15px rgba(78, 84, 200, 0.5); }
            100% { box-shadow: 0 0 5px rgba(78, 84, 200, 0.2); }
        }

        .branch-selector select:hover {
            border-color: var(--primary-light);
            box-shadow: 0 0 12px rgba(78, 84, 200, 0.4);
            transform: scale(1.05);
        }

        .branch-selector select:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 12px rgba(78, 84, 200, 0.6);
        }

        .search-bar {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            animation: searchExpand 1s ease;
        }

        @keyframes searchExpand {
            0% { width: 0; opacity: 0; }
            100% { width: 100%; opacity: 1; }
        }

        .search-bar input {
            padding: 12px;
            border-radius: 8px 0 0 8px;
            border: 1px solid #ddd;
            border-right: none;
            font-size: 17px;
            color: var(--dark);
            width: 100%;
            transition: all 0.4s ease;
            font-family: "Roboto", sans-serif;
        }

        .search-bar input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 8px rgba(78, 84, 200, 0.4);
        }

        .search-bar button {
            padding: 12px 20px;
            border-radius: 0 8px 8px 0;
            border: 1px solid #ddd;
            border-left: none;
            background: linear-gradient(90deg, var(--primary), var(--primary-light));
            color: white;
            cursor: pointer;
            transition: all 0.4s ease;
            animation: buttonGlow 2s infinite;
        }

        @keyframes buttonGlow {
            0% { box-shadow: 0 0 5px var(--primary); }
            50% { box-shadow: 0 0 15px var(--primary-light); }
            100% { box-shadow: 0 0 5px var(--primary); }
        }

        .search-bar button:hover {
            background: linear-gradient(90deg, var(--primary-light), var(--primary));
            transform: scale(1.1) rotate(5deg);
        }

        .back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            background: linear-gradient(45deg, var(--accent), var(--accent-dark));
            color: white;
            padding: 15px 20px;
            border-radius: 50%;
            cursor: pointer;
            display: none;
            transition: all 0.4s ease;
            font-size: 20px;
            z-index: 1000;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            animation: backToTopBounce 2s infinite;
        }

        @keyframes backToTopBounce {
            0% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0); }
        }

        .back-to-top:hover {
            background: linear-gradient(45deg, var(--accent-dark), var(--accent));
            transform: scale(1.3) rotate(360deg);
        }

        .scroll-progress {
            position: fixed;
            top: 0;
            left: 0;
            width: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--accent), var(--highlight), var(--primary));
            z-index: 1000;
            transition: width 0.3s ease;
            animation: progressGlow 2s infinite;
        }

        @keyframes progressGlow {
            0% { box-shadow: 0 0 5px var(--accent); }
            50% { box-shadow: 0 0 15px var(--highlight); }
            100% { box-shadow: 0 0 5px var(--accent); }
        }

        .loading {
            display: none;
            text-align: center;
            padding: 25px;
            color: var(--primary);
            font-style: italic;
            animation: loadingFade 1s ease;
        }

        @keyframes loadingFade {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .loading::after {
            content: "";
            display: inline-block;
            width: 25px;
            height: 25px;
            border: 3px solid var(--primary);
            border-top: 3px solid transparent;
            border-radius: 50%;
            animation: spin 0.8s linear infinite;
            margin-left: 12px;
            vertical-align: middle;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        #particles-js {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            opacity: 0.6;
        }

        /* Mobile responsive design */
        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            header h1 {
                font-size: 36px;
            }

            .date-time {
                flex-direction: column;
                text-align: center;
            }

            .tabs {
                flex-direction: column;
            }

            .tab {
                padding: 15px;
            }

            table {
                display: block;
                overflow-x: auto;
            }

            th, td {
                padding: 12px;
                font-size: 15px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&family=Montserrat:wght@700&family=Roboto:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>
    <div id="particles-js"></div>
    <div class="scroll-progress" id="scroll-progress"></div>
    <div class="container">
        <header>
            <h1><i class="fas fa-university header-icon"></i> UNIVERSITY NOTICE BOARD</h1>
        </header>

        <div class="date-time">
            <div class="welcome" id="greeting">
                <i class="fas fa-hand-wave"></i> Good day, Students!
            </div>
            <div id="date-time">
                <i class="far fa-calendar-alt"></i> <span id="current-date">Loading...</span> | 
                <i class="far fa-clock"></i> <span id="clock">Loading...</span>
                <button class="theme-toggle" onclick="toggleTheme()">
                    <i class="fas fa-moon"></i> Dark Mode
                </button>
            </div>
        </div>

        <div class="weather-widget">
            <div>
                <div class="weather-desc">Campus Weather</div>
                <div class="weather-temp" id="weather-temp">Loading...</div>
                <div class="weather-desc" id="weather-desc">Fetching data...</div>
            </div>
            <div class="weather-icon" id="weather-icon">
                <i class="fas fa-cloud-sun"></i>
            </div>
        </div>

        <div class="tab-container">
            <div class="tabs">
                <div class="tab active" onclick="openTab('timetable')" title="View your class schedule">
                    <i class="fas fa-calendar-alt tab-icon"></i> Timetable
                </div>
                <div class="tab" onclick="openTab('events')" title="Check upcoming events">
                    <i class="fas fa-star tab-icon"></i> Events
                </div>
                <div class="tab" onclick="openTab('announcements')" title="Read latest announcements">
                    <i class="fas fa-bullhorn tab-icon"></i> Announcements
                </div>
            </div>

            <div id="timetable" class="tab-content active">
                <div class="section-content">
                    <div class="branch-selector">
                        <label for="branch-select">Select Branch:</label>
                        <select id="branch-select" onchange="updateTimetable()">
                            <option value="computer-science">Computer Science and Engineering</option>
                            <option value="mechanical-engineering">Mechanical Engineering</option>
                            <option value="electrical-engineering">Electrical Engineering</option>
                            <option value="electronics-communication">Electronics and Communication Engineering</option>
                        </select>
                    </div>
                    <div class="loading" id="timetable-loading">Loading timetable...</div>
                    <table id="timetable-table">
                        <thead>
                            <tr>
                                <th>Time</th>
                                <th>Monday</th>
                                <th>Tuesday</th>
                                <th>Wednesday</th>
                                <th>Thursday</th>
                                <th>Friday</th>
                            </tr>
                        </thead>
                        <tbody id="timetable-body"></tbody>
                    </table>
                </div>
            </div>

            <div id="events" class="tab-content">
                <div class="section-content">
                    <div class="search-bar">
                        <input type="text" id="events-search" placeholder="Search events..." onkeyup="searchItems('events')">
                        <button onclick="searchItems('events')"><i class="fas fa-search"></i></button>
                    </div>
                    <div id="events-list">
                        <div class="event-item important">
                            <div class="event-title">
                                <span class="badge badge-important">IMPORTANT</span>
                                <i class="fas fa-exclamation-circle title-icon"></i>
                                Final Examination Schedule Released
                                
                            </div>
                            <div class="event-date">
                                <i class="far fa-calendar-alt date-icon"></i>
                                May 10, 2025
                            </div>
                            <a href="images/111.png" download=TimeTable.png>Click Here to Download </a>
                            
                            <div class="event-description">
                                The final examination schedule for 3-1 2025 has been published. All students are required to check their exam dates and venues on the student portal. Make sure to verify your exam locations as some venues have changed from previous semesters.
                            </div>
                        </div>
                        <div class="event-item" style="border-left-color: var(--info);">
                            <div class="event-title">
                                <span class="badge badge-academic">ACADEMIC</span>
                                <i class="fas fa-microscope title-icon"></i>
                                Research Symposium
                            </div>
                            <div class="event-date">
                                <i class="far fa-calendar-alt date-icon"></i>
                                May 15-16, 2025
                            </div>
                            <a href="images/2222.png" >Click Here to See </a>
                            <div class="event-description">
                                The Research Encourages creative Efforts in Exploring the UnExplored Horizons to the Manifold, it's and Achievement For the First Year Students !
                            </div>
                        </div>
                        <div class="event-item" style="border-left-color: #9b59b6;">
                            <div class="event-title">
                                <span class="badge badge-cultural">CULTURAL</span>
                                <i class="fas fa-music title-icon"></i>
                                Telugu Mahasabhalu
                            </div>
                            <div class="event-date">
                                <i class="far fa-calendar-alt date-icon"></i>
                                May 20, 2025
                            </div>
                            <a href="images/44444.png" >Click Here to See </a>
                            </a>
                            <div class="event-description">
                                Join us for the Telugu Mahasabhalu with music performances, art exhibitions, and food stalls organized by the Cultural Committee. Entry is free for all students with valid ID cards. Don"t miss the talent show starting at 7 PM in the main auditorium!
                            </div>
                        </div>
                        <div class="event-item" style="border-left-color: var(--success);">
                            <div class="event-title">
                                <span class="badge badge-sports">SPORTS</span>
                                <i class="fas fa-basketball-ball title-icon"></i>
                                Intercollegiate Cricket Tournament
                            </div>
                            <div class="event-date">
                                <i class="far fa-calendar-alt date-icon"></i>
                                May 22-24, 2025
                            </div>
                            <div class="event-description">
                                Our college Cricket team will compete in the regional championship. Matches will be held at the University Sports Complex. Show your support! First game starts at 3 PM on May 22nd against State University. Free t-shirts for the first 100 attendees!
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="announcements" class="tab-content">
                <div class="section-content">
                    <div class="search-bar">
                        <input type="text" id="announcements-search" placeholder="Search announcements..." onkeyup="searchItems('announcements')">
                        <button onclick="searchItems('announcements')"><i class="fas fa-search"></i></button>
                    </div>
                    <div id="announcements-list">
                        <div class="announcement-item important">
                            <div class="announcement-title">
                                <span class="badge badge-deadline">DEADLINE</span>
                                <i class="fas fa-award title-icon"></i>
                                UNIVERSITY FEE RESCHEDULED 
                            </div>
                            <div class="announcement-date">
                                <i class="far fa-calendar-alt date-icon"></i>
                                Deadline: May 15, 2025
                            </div>
                            <div class="announcement-description">
                                All the Students Must Pay the University Fee Before the Deadline Date !
                            </div>
                        </div>
                        <div class="announcement-item" style="border-left-color: var(--info);">
                            <div class="announcement-title">
                                <i class="fas fa-book title-icon"></i>
                                TECHWING CLASSES RESCHEDULED 
                            </div>
                            <div class="announcement-date">
                                <i class="far fa-calendar-alt date-icon"></i>
                                Effective: May 8 - May 12, 2025
                            </div>
                            <div class="announcement-description">
                                The TechWing Project Reviews for the AWS & JAVA Trainees were Rescheduled to the May 12
                            </div>
                        </div>
                        <div class="announcement-item" style="border-left-color: var(--success);">
                            <div class="announcement-title">
                                <i class="fas fa-briefcase title-icon"></i>
                                Summer Internship Opportunities
                            </div>
                            <div class="announcement-date">
                                <i class="far fa-calendar-alt date-icon"></i>
                                Posted: May 5, 2025
                            </div>
                            <div class="announcement-description">
                                InternShip Opportunities From the Team TechWing was Initiated , Students Kindly Check Their Mails !( if not Received OtherWise Contact Their Mentors !)
                            </div>
                        </div>
                        <div class="announcement-item" style="border-left-color: var(--warning);">
                            <div class="announcement-title">
                                <i class="fas fa-tools title-icon"></i>
                                Campus Hostel Notice
                            </div>
                            <div class="announcement-date">
                                <i class="far fa-calendar-alt date-icon"></i>
                                May 11-12, 2025
                            </div>
                            <div class="announcement-description">
                                Students Must Leave their Hostels After Completion Of the End Examinations !.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <div>© 2025 Campus Connect | Last Updated: May 9, 2025</div>
            <div class="quick-links">
                <a href="#" class="quick-link">Student Portal</a>
                <a href="#" class="quick-link">Faculty Directory</a>
                <a href="#" class="quick-link">Campus Map</a>
                <a href="#" class="quick-link">Help Desk</a>
            </div>
        </footer>
    </div>

    <div class="back-to-top" onclick="scrollToTop()" title="Back to Top">↑</div>

    <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
    <script>
        // Initialize Particles.js
        particlesJS("particles-js", {
            "particles": {
                "number": { "value": 100, "density": { "enable": true, "value_area": 800 } },
                "color": { "value": ["#4e54c8", "#ff7e5f", "#2ecc71", "#f1c40f", "#3498db"] },
                "shape": { "type": ["circle", "triangle", "star"] },
                "opacity": { "value": 0.6, "random": true },
                "size": { "value": 4, "random": true },
                "line_linked": {
                    "enable": true,
                    "distance": 150,
                    "color": "#4e54c8",
                    "opacity": 0.4,
                    "width": 1
                },
                "move": {
                    "enable": true,
                    "speed": 3,
                    "direction": "none",
                    "random": true,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false
                }
            },
            "interactivity": {
                "detect_on": "canvas",
                "events": {
                    "onhover": { "enable": true, "mode": "repulse" },
                    "onclick": { "enable": true, "mode": "push" },
                    "resize": true
                },
                "modes": {
                    "repulse": { "distance": 200, "duration": 0.4 },
                    "push": { "particles_nb": 4 }
                }
            },
            "retina_detect": true
        });

        // Timetable data
        const timetables = {
            "computer-science": [
                {
                    "time": "9:00 - 10:30",
                    "days": [
                        "<span class=\"subject-cs\">Computer Science</span>",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "<span class=\"subject-physics subject-lab\">Physics Lab</span>",
                        "<span class=\"subject-cs\">Computer Science</span>",
                        "<span class=\"subject-english\">English</span>"
                    ]
                },
                {
                    "time": "10:45 - 12:15",
                    "days": [
                        "<span class=\"subject-physics\">Physics</span>",
                        "<span class=\"subject-chemistry\">Chemistry</span>",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "<span class=\"subject-chemistry subject-lab\">Chemistry Lab</span>",
                        "<span class=\"subject-physics\">Physics</span>"
                    ]
                },
                {
                    "time": "12:15 - 13:00",
                    "days": ["Lunch Break", "Lunch Break", "Lunch Break", "Lunch Break", "Lunch Break"],
                    "isLunch": true
                },
                {
                    "time": "13:00 - 14:30",
                    "days": [
                        "<span class=\"subject-english\">English</span>",
                        "<span class=\"subject-cs subject-lab\">Computer Lab</span>",
                        "<span class=\"subject-chemistry\">Chemistry</span>",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "<span class=\"subject-cs subject-lab\">Computer Science Lab</span>"
                    ]
                },
                {
                    "time": "14:45 - 16:15",
                    "days": [
                        "Psychology",
                        "Physical Education",
                        "Economics",
                        "History",
                        "Career Counseling"
                    ]
                }
            ],
            "mechanical-engineering": [
                {
                    "time": "9:00 - 10:30",
                    "days": [
                        "Thermodynamics",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Mechanics Lab",
                        "Fluid Mechanics",
                        "<span class=\"subject-english\">English</span>"
                    ]
                },
                {
                    "time": "10:45 - 12:15",
                    "days": [
                        "Material Science",
                        "Engineering Drawing",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Machine Design",
                        "Thermodynamics"
                    ]
                },
                {
                    "time": "12:15 - 13:00",
                    "days": ["Lunch Break", "Lunch Break", "Lunch Break", "Lunch Break", "Lunch Break"],
                    "isLunch": true
                },
                {
                    "time": "13:00 - 14:30",
                    "days": [
                        "<span class=\"subject-english\">English</span>",
                        "Workshop Practice",
                        "Material Science",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Fluid Mechanics"
                    ]
                },
                {
                    "time": "14:45 - 16:15",
                    "days": [
                        "Industrial Management",
                        "Physical Education",
                        "Economics",
                        "History",
                        "Career Counseling"
                    ]
                }
            ],
            "electrical-engineering": [
                {
                    "time": "9:00 - 10:30",
                    "days": [
                        "Circuit Theory",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Electronics Lab",
                        "Electromagnetics",
                        "<span class=\"subject-english\">English</span>"
                    ]
                },
                {
                    "time": "10:45 - 12:15",
                    "days": [
                        "Power Systems",
                        "Signals and Systems",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Control Systems",
                        "Circuit Theory"
                    ]
                },
                {
                    "time": "12:15 - 13:00",
                    "days": ["Lunch Break", "Lunch Break", "Lunch Break", "Lunch Break", "Lunch Break"],
                    "isLunch": true
                },
                {
                    "time": "13:00 - 14:30",
                    "days": [
                        "<span class=\"subject-english\">English</span>",
                        "Electrical Machines",
                        "Power Systems",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Electronics Lab"
                    ]
                },
                {
                    "time": "14:45 - 16:15",
                    "days": [
                        "Renewable Energy",
                        "Physical Education",
                        "Economics",
                        "History",
                        "Career Counseling"
                    ]
                }
            ],
            "electronics-communication": [
                {
                    "time": "9:00 - 10:30",
                    "days": [
                        "Digital Electronics",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Communication Systems Lab <span class=\"subject-lab\"></span>",
                        "Signal Processing",
                        "<span class=\"subject-english\">English</span>"
                    ]
                },
                {
                    "time": "10:45 - 12:15",
                    "days": [
                        "Analog Circuits",
                        "Microprocessors",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Antenna Design",
                        "Digital Electronics"
                    ]
                },
                {
                    "time": "12:15 - 13:00",
                    "days": ["Lunch Break", "Lunch Break", "Lunch Break", "Lunch Break", "Lunch Break"],
                    "isLunch": true
                },
                {
                    "time": "13:00 - 14:30",
                    "days": [
                        "<span class=\"subject-english\">English</span>",
                        "Embedded Systems Lab <span class=\"subject-lab\"></span>",
                        "Communication Systems",
                        "<span class=\"subject-math\">Mathematics</span>",
                        "Signal Processing"
                    ]
                },
                {
                    "time": "14:45 - 16:15",
                    "days": [
                        "VLSI Design",
                        "Physical Education",
                        "Economics",
                        "History",
                        "Career Counseling"
                    ]
                }
            ]
        };

        // Update timetable
        function updateTimetable() {
            const branch = document.getElementById("branch-select").value;
            const timetableBody = document.getElementById("timetable-body");
            const timetableTable = document.getElementById("timetable-table");
            const loading = document.getElementById("timetable-loading");

            timetableTable.style.display = "none";
            loading.style.display = "block";

            setTimeout(() => {
                timetableBody.innerHTML = "";
                const schedule = timetables[branch];
                schedule.forEach(slot => {
                    const row = document.createElement("tr");
                    const timeCell = document.createElement("td");
                    timeCell.textContent = slot.time;
                    row.appendChild(timeCell);

                    if (slot.isLunch) {
                        const lunchCell = document.createElement("td");
                        lunchCell.colSpan = 5;
                        lunchCell.className = "lunch-break";
                        lunchCell.innerHTML = "<i class=\"fas fa-utensils\"></i> Lunch Break";
                        row.appendChild(lunchCell);
                    } else {
                        slot.days.forEach(day => {
                            const dayCell = document.createElement("td");
                            dayCell.innerHTML = day;
                            row.appendChild(dayCell);
                        });
                    }
                    timetableBody.appendChild(row);
                });

                loading.style.display = "none";
                timetableTable.style.display = "table";
                highlightToday();
            }, 500);
        }

        // Update date, time, and greeting
        function updateDateTimeAndGreeting() {
            const now = new Date();
            const days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
            const months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            const dayName = days[now.getDay()];
            const monthName = months[now.getMonth()];
            const dateStr = `${dayName}, ${monthName} ${now.getDate()}, ${now.getFullYear()}`;
            document.getElementById("current-date").textContent = dateStr;

            const hours = now.getHours().toString().padStart(2, "0");
            const minutes = now.getMinutes().toString().padStart(2, "0");
            const seconds = now.getSeconds().toString().padStart(2, "0");
            document.getElementById("clock").textContent = `${hours}:${minutes}:${seconds}`;

            const greetingElement = document.getElementById("greeting");
            if (hours < 12) {
                greetingElement.innerHTML = "<i class=\"fas fa-hand-wave\"></i> Good Morning, Students!";
            } else if (hours >= 12 && hours < 17) {
                greetingElement.innerHTML = "<i class=\"fas fa-hand-wave\"></i> Good Afternoon, Students!";
            } else {
                greetingElement.innerHTML = "<i class=\"fas fa-hand-wave\"></i> Good Evening, Students!";
            }
        }

        // Mock weather update
        let lastWeatherData = { "temp": "39°C", "desc": "Partly Cloudy", "icon": "fas fa-cloud-sun" };
        async function updateWeather() {
            const mockWeatherData = {
                "main": { "temp": 39 },
                "weather": [{ "description": "partly cloudy", "icon": "02d" }],
            };

            try {
                const data = mockWeatherData;
                const temp = Math.round(data.main.temp) + "°C";
                const desc = data.weather[0].description.charAt(0).toUpperCase() + data.weather[0].description.slice(1);

                const weatherIconMap = {
                    "01d": "fas fa-sun",
                    "01n": "fas fa-moon",
                    "02d": "fas fa-cloud-sun",
                    "02n": "fas fa-cloud-moon",
                    "03d": "fas fa-cloud",
                    "03n": "fas fa-cloud",
                    "04d": "fas fa-cloud",
                    "04n": "fas fa-cloud",
                    "09d": "fas fa-cloud-showers-heavy",
                    "09n": "fas fa-cloud-showers-heavy",
                    "10d": "fas fa-cloud-rain",
                    "10n": "fas fa-cloud-rain",
                    "11d": "fas fa-bolt",
                    "11n": "fas fa-bolt",
                    "13d": "fas fa-snowflake",
                    "13n": "fas fa-snowflake",
                    "50d": "fas fa-smog",
                    "50n": "fas fa-smog"
                };
                const iconCode = data.weather[0].icon;
                const iconClass = weatherIconMap[iconCode] || "fas fa-cloud-sun";

                document.getElementById("weather-temp").textContent = temp;
                document.getElementById("weather-desc").textContent = desc;
                document.getElementById("weather-icon").innerHTML = `<i class="${iconClass}"></i>`;

                lastWeatherData = { "temp": temp, "desc": desc, "icon": iconClass };
            } catch (error) {
                console.error("Error updating weather:", error);
                document.getElementById("weather-temp").textContent = lastWeatherData.temp;
                document.getElementById("weather-desc").textContent = `${lastWeatherData.desc} (Weather data unavailable)`;
                document.getElementById("weather-icon").innerHTML = `<i class="${lastWeatherData.icon}"></i>`;
            }
        }

        // Tab functionality
        function openTab(tabName) {
            const tabcontent = document.getElementsByClassName("tab-content");
            for (let i = 0; i < tabcontent.length; i++) {
                tabcontent[i].classList.remove("active");
            }

            const tabs = document.getElementsByClassName("tab");
            for (let i = 0; i < tabs.length; i++) {
                tabs[i].classList.remove("active");
            }

            document.getElementById(tabName).classList.add("active");
            event.currentTarget.classList.add("active");

            if (tabName === "timetable") {
                updateTimetable();
            } else {
                searchItems(tabName);
            }
        }

        // Highlight current day
        function highlightToday() {
            const today = new Date().getDay();
            if (today > 0 && today < 6) {
                const tableRows = document.querySelectorAll("#timetable-body tr");
                for (let row of tableRows) {
                    const dayCell = row.cells[today];
                    if (dayCell && !row.cells[1].classList.contains("lunch-break")) {
                        dayCell.style.backgroundColor = document.body.classList.contains("dark-mode") ? "rgba(78, 84, 200, 0.2)" : "rgba(78, 84, 200, 0.1)";
                        dayCell.style.fontWeight = "bold";
                    }
                }
            }
        }

        // Search functionality
        function searchItems(section) {
            const searchInput = document.getElementById(`${section}-search`).value.toLowerCase();
            const items = document.querySelectorAll(`#${section}-list .${section}-item`);

            items.forEach(item => {
                const title = item.querySelector(`.${section}-title`).textContent.toLowerCase();
                const description = item.querySelector(`.${section}-description`).textContent.toLowerCase();
                const date = item.querySelector(`.${section}-date`).textContent.toLowerCase();

                if (title.includes(searchInput) || description.includes(searchInput) || date.includes(searchInput)) {
                    item.style.display = "";
                } else {
                    item.style.display = "none";
                }
            });
        }

        // Dark mode toggle
        function toggleTheme() {
            const body = document.body;
            const toggleButton = document.querySelector(".theme-toggle");
            body.classList.toggle("dark-mode");

            if (body.classList.contains("dark-mode")) {
                toggleButton.innerHTML = "<i class=\"fas fa-sun\"></i> Light Mode";
                localStorage.setItem("theme", "dark");
            } else {
                toggleButton.innerHTML = "<i class=\"fas fa-moon\"></i> Dark Mode";
                localStorage.setItem("theme", "light");
            }
        }

        // Load theme preference
        window.onload = () => {
            const savedTheme = localStorage.getItem("theme");
            if (savedTheme === "dark") {
                document.body.classList.add("dark-mode");
                document.querySelector(".theme-toggle").innerHTML = "<i class=\"fas fa-sun\"></i> Light Mode";
            }
            updateDateTimeAndGreeting();
            updateWeather();
            updateTimetable();
        };

        // Scroll progress and Back to Top
        const backToTopBtn = document.querySelector(".back-to-top");
        const scrollProgress = document.getElementById("scroll-progress");

        window.addEventListener("scroll", () => {
            const scrollTop = window.scrollY;
            const docHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight;
            const scrollPercent = (scrollTop / docHeight) * 100;
            scrollProgress.style.width = `${scrollPercent}%`;

            if (scrollTop > 300) {
                backToTopBtn.style.display = "block";
            } else {
                backToTopBtn.style.display = "none";
            }
        });

        function scrollToTop() {
            window.scrollTo({ "top": 0, "behavior": "smooth" });
        }

        // Initialize updates
        updateDateTimeAndGreeting();
        setInterval(updateDateTimeAndGreeting, 1000);

        updateWeather();
        setInterval(updateWeather, 900000);
    </script>
</body>
</html>