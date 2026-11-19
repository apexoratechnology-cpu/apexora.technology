# APEXORA.TECH 🚀

> **Your Vision. Our Innovation.**  
> A technology and creative solutions company working across software engineering, IoT prototypes, Canva graphic design, and custom 3D/laser-engraved gifting.

[![Website](https://img.shields.io/badge/Status-Active-brightgreen.svg)](#)
[![Theme](https://img.shields.io/badge/Theme-Dark%20%7C%20Light-blue.svg)](#)
[![Stack](https://img.shields.io/badge/Stack-HTML5%20%7C%20CSS3%20%7C%20JavaScript-orange.svg)](#)
[![Deployment](https://img.shields.io/badge/Deploy-GitHub%20Pages-purple.svg)](#)

---

## 📌 Table of Contents
1. [About APEXORA.TECH](#-about-apexoratech)
2. [Core Offerings](#-core-offerings)
3. [Key Features](#-key-features)
4. [File Structure](#-file-structure)
5. [How to Run Locally](#-how-to-run-locally)
6. [How to Push to GitHub](#-how-to-push-to-github)
7. [Deploy to GitHub Pages](#-deploy-to-github-pages)
8. [Email & Contact System (EmailJS / Mail / WhatsApp)](#-email--contact-system)
9. [Customer Reviews System](#-customer-reviews-system)
10. [Company Leadership](#-company-leadership)
11. [Contact Information](#-contact-information)

---

## 🏢 About APEXORA.TECH

At **APEXORA.TECH**, we turn ideas into reality through the perfect combination of technology, design, and engineering creativity. From building full-stack digital platforms to crafting visual identities and hardware IoT systems, we make innovation accessible, meaningful, and impactful.

- **Vision:** To build a world where no great idea remains just an idea.
- **Mission:** We don't just provide services; we bring possibilities to life.
- **Goals:** Deliver quality-driven solutions, explore cutting-edge technologies, and build lasting client trust.

---

## 🛠 Core Offerings

| Category | Offerings | Highlights |
| :--- | :--- | :--- |
| **💻 Software Projects** | 1-Page Landings, Portfolios, E-Commerce, CRM, Billing Software, SaaS Web Apps, Android Apps | 40+ specialized software services with full architectures & deliverables |
| **🤖 IoT & Robotics** | Smart Home Automation, Fire Detection, Smart Irrigation, Bluetooth Robot Cars, RFID Systems | 20+ engineering and academic IoT models with schematics & source code |
| **🎨 Canva Designs** | Social Media Packs, Posters, Logos, Resumes, Business Cards, Pitch Decks, Brochures | 60+ creative design services tailored for businesses and individuals |
| **🎁 ZENVIX (Associate)** | 3D Printed Models, Laser Engraved Keychains, Resin Frames, Personalized Gift Hampers | Custom crafting, precision laser cutting, and robotic arm art |

---

## ✨ Key Features

- **📱 Fully Responsive Design:** Handcrafted with modern CSS Flexbox and Grid, optimized for smartphones, tablets, laptops, and ultra-wide screens.
- **🌗 Dark / Light Mode Switcher:** Smooth theme transition with user preference remembered across visits in `localStorage`.
- **🎥 Adaptive Video Intro:** Plays a high-definition intro video (desktop 16:9 or mobile 9:16) with audio autoplay failsafe and one-click Skip button.
- **🔎 Dynamic Project Details Modal:** Click on any service card to view complete project scope, prerequisites, technical flow, deliverables, and estimated timelines.
- **⭐ Customer Reviews Section:** Pre-populated with genuine 5-star customer ratings across software, IoT, design, and gifting. Includes an interactive review form where new visitor reviews are saved locally and displayed immediately.
- **📬 EmailJS Direct Enquiry System:**
  - The "Start Project" modal submits project requests directly via **EmailJS** from the browser into your inbox.
  - No external mail clients, popups, or WhatsApp redirects are required.
  - Includes real-time form validation, loading states, and instant success confirmation.
- **🤝 ZENVIX Showcase:** Interactive product preview modal with image carousel for keychains, 3D statues, and resin frames.

---

## 📂 File Structure

```
APEXORA.TECH/
├── index.html                  # Main website landing page
├── css/
│   └── style.css               # Complete responsive stylesheet & design system
├── js/
│   └── app.js                  # Website logic, services data, reviews & enquiry handler
├── assets/
│   ├── logo.jpg                # Company official logo
│   ├── intro-landscape.mp4     # Desktop 16:9 intro video
│   ├── intro-portrait.mp4      # Mobile 9:16 intro video
│   ├── canva/                  # Canva design sample images (canva-01 to 60)
│   ├── gallery/                # Live software project preview thumbnails
│   ├── iot/                    # IoT project prototype images (iot-01 to 20)
│   ├── team/                   # Company officials profile portraits (team-01 to 10)
│   └── zenvix/                 # Zenvix 3D products & laser engraving gallery
├── .gitignore                  # Git ignore rules for OS and temp files
├── push_to_github.bat          # 1-click Windows batch script to push to GitHub
├── push_to_github.ps1          # 1-click PowerShell push script
└── README.md                   # Repository documentation
```

---

## 💻 How to Run Locally

1. Clone or download this repository.
2. Simply double-click `index.html` to open it in Google Chrome, Microsoft Edge, Firefox, or Safari.
3. Or serve it with any lightweight web server:
   ```bash
   # Using Python:
   python -m http.server 8080

   # Or using Node.js:
   npx serve .
   ```
4. Open your browser and navigate to `http://localhost:8080`.

---

## 🚀 How to Push to GitHub

### Method 1: Using the Automated Script (Easiest for Windows)
1. Double-click `push_to_github.bat` (or run `./push_to_github.ps1` in PowerShell).
2. When prompted, paste your GitHub repository URL (e.g. `https://github.com/your-username/apexora-tech.git`).
3. The script will automatically initialize git, commit all files, set the branch to `main`, and push your code!

---

### Method 2: Using the Command Line (Manual)

1. Open PowerShell or Command Prompt in this folder.
2. Initialize the Git repository:
   ```bash
   git init
   ```
3. Set the default branch to `main`:
   ```bash
   git branch -M main
   ```
4. Stage all files:
   ```bash
   git add .
   ```
5. Create your initial commit:
   ```bash
   git commit -m "Initial commit: APEXORA.TECH official website"
   ```
6. Link your GitHub remote repository (replace with your repo URL):
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
   ```
7. Push the repository to GitHub:
   ```bash
   git push -u origin main
   ```

---

## 🌐 Deploy to GitHub Pages (Free Hosting)

Once your code is pushed to GitHub, you can publish the website live on GitHub Pages in under 60 seconds:

1. Open your repository on **GitHub.com**.
2. Click on **Settings** (top navigation bar).
3. In the left sidebar, click on **Pages**.
4. Under **Build and deployment** > **Branch**:
   - Select `main` from the dropdown.
   - Leave the folder as `/ (root)`.
   - Click **Save**.
5. Wait 1–2 minutes, then refresh the page.
6. Your live site URL will be displayed at the top:
   ```
   https://<your-username>.github.io/<your-repository-name>/
   ```

---

## 📬 EmailJS Integration Setup

The **Start Project** section uses **EmailJS** exclusively for direct in-browser form submission to your inbox (without opening external mail apps or WhatsApp).

### How to Activate EmailJS (in 2 minutes):
1. Create a free account at [EmailJS](https://www.emailjs.com/).
2. In the EmailJS dashboard:
   - **Email Services:** Add your Gmail (`apexora.technology@gmail.com`) and copy the **Service ID** (e.g., `service_xxxxxxx`).
   - **Email Templates:** Create a new template and copy the **Template ID** (e.g., `template_xxxxxxx`).
     - Recommended template fields: `{{from_name}}`, `{{from_email}}`, `{{phone}}`, `{{service}}`, `{{message}}`.
   - **Account / API Keys:** Copy your **Public Key** (e.g., `user_xxxxxxxxxxxx`).
3. Add your keys either in `index.html` (lines 94–98) or in `js/app.js` (`CONFIG.emailjs`):
   ```javascript
   window.EMAILJS_CONFIG = {
     serviceId: 'your_service_id',
     templateId: 'your_template_id',
     publicKey: 'your_public_key'
   };
   ```
4. Now, whenever a visitor clicks "Submit Enquiry", their message is delivered directly to your inbox with instant on-screen confirmation!

---

## ⭐ Customer Reviews System

The website features an authentic review system:
- **Verified 5-Star Reviews:** Pre-configured reviews from real client projects across software engineering, IoT prototypes, Canva designs, and ZENVIX personalized gifting.
- **Live Submission:** Visitors can submit a review with their name, email, star rating, and feedback.
- **Instant Persistence:** New reviews are saved in `localStorage`, pinned to the top of the list, and persist across page reloads.

---

## 👥 Company Leadership

| Name | Role | Specialization |
| :--- | :--- | :--- |
| **R. Rajesh** | Founder & CEO | Artificial Intelligence and Data Science |
| **M. Wilson Christhu Doss** | Co-Founder | Artificial Intelligence and Data Science |
| **J. Santhosh Kumar** | Managing Director | Artificial Intelligence and Data Science |
| **N. Gowri Shankar** | Marketing Manager | Artificial Intelligence and Data Science |
| **S. Sanjay** | Lead Software Developer | Full-Stack Web Development |
| **N. Mahalakshmi** | Technical Manager | System Architecture & Management |
| **R. Dharshini** | Project Manager | Project Planning & Client Relations |
| **M. Beulah** | Operating Manager | Operations & Delivery |
| **A. Deepika** | Robotic Manager | Robotics & Embedded Systems |
| **N. Yogasree** | IoT Manager | IoT Architectures & Sensors |

---

## 📞 Contact Information

- **Email:** [apexora.technology@gmail.com](mailto:apexora.technology@gmail.com)
- **Phone:** [+91 90031 67331](tel:+919003167331) / [+91 63744 89818](tel:+916374489818)
- **Instagram:** [@apexora.tech2k](https://instagram.com/apexora.tech2k)
- **Location:** Chennai, Tamil Nadu, India
- **Business Associate:** ZENVIX (`@zenvix_360` · [+91 80561 87258](tel:+918056187258))

---

© 2026 APEXORA.TECH. All rights reserved.

