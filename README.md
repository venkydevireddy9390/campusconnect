# 📢 University Digital Notice Board – gietnotice.com

A modern web-based platform to digitize university announcements and keep everyone in the loop—no more faded paper flyers or missed notices. Just clean, secure, real-time updates.

🔗 **Live Site**: [gietnotice.com](http://gietnotice.com)


This is a full-stack web app that brings the university’s notice board online—accessible anytime, anywhere. Students and faculty can log in securely, view categorized notices, and stay connected on any device.

---

## 🧱 Folder Structure (Project Architecture + Tech Stack)

/university-digital-notice-board
│
├── /frontend → HTML, CSS, JavaScript (UI & user interactions)
│ ├── index.html
│ ├── styles.css
│ └── script.js
│
├── /backend → Java (Server-side logic, API endpoints)
│ └── App.java
│
├── /database → MySQL (Database schema, tables, queries)
│ └── schema.sql
│
├── /aws-deployment → Elastic Beanstalk & RDS config files
│ └── .ebextensions/
│
├── /screenshots → UI Snapshots for README & Docs
│
└── README.md → This file right here!  
1 Created the Sign-In Page 🔐
The first step was designing the Sign-In page — the gateway to the Digital Notice Board.

Built using HTML, CSS, and JavaScript

Included form validation and input handling for email/mobile number

Focused on clean UX and responsive design so it works well on all screen sizes

Connected the form to the backend for OTP-based authentication
<img width="1365" height="767" alt="Screenshot 2025-06-09 155214" src="https://github.com/user-attachments/assets/5299cb0d-01b8-4fda-a7ca-b6b4bc61c1ff" />
![d4](https://github.com/user-attachments/assets/2d21f8e2-a3c3-4cda-a872-b2245f236953)


 Stored User Login Data in MySQL 🗄️

Once the login form was working, we wired it up with **MySQL** to store:

- Registered users (email, phone)
- OTP codes for verification
- User roles (admin, student, faculty, etc.)

We created tables for:
- `users`
- `otps`
- `notices`
- `roles`

➡️ This allowed us to verify users and manage access securely.

---
 Set Up AWS RDS for Database Hosting ☁️

After building the local MySQL setup, we scaled it up with **Amazon RDS**:

- Created a secure RDS instance with MySQL engine
- Migrated the local database to the cloud
- Updated backend credentials to connect to the RDS DB
- Ensured the RDS was in the same VPC as our Elastic Beanstalk backend

✅ Now our database is scalable, reliable, and always-on—no downtime worries!

--- Developed the Backend in Java ⚙️

- Built using core Java + JDBC for DB connectivity
- Set up REST APIs for login, OTP verification, and CRUD operations for notices
- Hosted backend on **AWS Elastic Beanstalk**

---
 Finalized the Frontend 🎨

- Refined UI for dashboard and notice views
- Integrated dynamic data fetching using JS
- Made it mobile-friendly for easy access on any device

  Deployed the Entire App to AWS 🚀

- Java backend deployed via **Elastic Beanstalk**
- MySQL database hosted on **RDS**
- Domain connected to the frontend for live access at [gietnotice.com](http://gietnotice.com)
![d4](https://github.com/user-attachments/assets/0b2825fc-fc6b-4888-b898-e2d6ab06988a)
![d3](https://github.com/user-attachments/assets/c0b7cc50-e7a9-4858-80ae-11246392ade6)



