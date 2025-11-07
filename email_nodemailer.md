# Email Service Integration with Nodemailer

This guide provides step-by-step instructions for creating a separate Node.js email service using Nodemailer that can be integrated with your Flutter portfolio website while keeping it static.

## Architecture Overview

```
Flutter Portfolio (Static) → API Gateway → Node.js Email Service → Email Provider
```

Your Flutter website remains static (hosted on Firebase/Netlify/Vercel), and the email functionality is handled by a separate Node.js backend service.

---

## Part 1: Setting Up the Node.js Email Service

### Step 1: Create New Node.js Project

```bash
# Create a new directory for the email service
mkdir portfolio-email-service
cd portfolio-email-service

# Initialize Node.js project
npm init -y
```

### Step 2: Install Required Dependencies

```bash
npm install express nodemailer cors dotenv
npm install --save-dev nodemon
```

**Package Explanations:**
- `express`: Web framework for creating API endpoints
- `nodemailer`: Email sending library
- `cors`: Enable Cross-Origin Resource Sharing (allows your Flutter app to call this API)
- `dotenv`: Load environment variables from .env file
- `nodemon`: Auto-restart server during development

### Step 3: Create Project Structure

```
portfolio-email-service/
├── .env
├── .gitignore
├── package.json
├── server.js
└── config/
    └── emailConfig.js
```

### Step 4: Create `.gitignore`

```
node_modules/
.env
.env.local
.DS_Store
*.log
```

### Step 5: Create `.env` File

```env
# Server Configuration
PORT=3000
NODE_ENV=development

# Email Configuration (Choose one provider)

# Option 1: Gmail
EMAIL_SERVICE=gmail
EMAIL_USER=your-email@gmail.com
EMAIL_PASSWORD=your-app-specific-password

# Option 2: SendGrid
# EMAIL_SERVICE=sendgrid
# SENDGRID_API_KEY=your-sendgrid-api-key

# Option 3: SMTP (Generic)
# EMAIL_HOST=smtp.example.com
# EMAIL_PORT=587
# EMAIL_USER=your-email@example.com
# EMAIL_PASSWORD=your-password

# Allowed Origins (Your Flutter app URLs)
ALLOWED_ORIGINS=http://localhost:3000,https://your-portfolio-domain.com

# Recipient Email (Where contact form emails should be sent)
RECIPIENT_EMAIL=niru-nny@example.com
```

### Step 6: Create `config/emailConfig.js`

```javascript
const nodemailer = require('nodemailer');
require('dotenv').config();

/**
 * Create email transporter based on configuration
 */
const createTransporter = () => {
  // Gmail Configuration
  if (process.env.EMAIL_SERVICE === 'gmail') {
    return nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASSWORD, // Use App-Specific Password
      },
    });
  }

  // Generic SMTP Configuration
  return nodemailer.createTransport({
    host: process.env.EMAIL_HOST,
    port: process.env.EMAIL_PORT || 587,
    secure: process.env.EMAIL_PORT == 465, // true for 465, false for other ports
    auth: {
      user: process.env.EMAIL_USER,
      pass: process.env.EMAIL_PASSWORD,
    },
  });
};

/**
 * Verify transporter configuration
 */
const verifyTransporter = async (transporter) => {
  try {
    await transporter.verify();
    console.log('✅ Email transporter is ready to send emails');
    return true;
  } catch (error) {
    console.error('❌ Email transporter verification failed:', error);
    return false;
  }
};

module.exports = { createTransporter, verifyTransporter };
```

### Step 7: Create `server.js`

```javascript
const express = require('express');
const cors = require('cors');
require('dotenv').config();

const { createTransporter, verifyTransporter } = require('./config/emailConfig');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// CORS Configuration
const allowedOrigins = process.env.ALLOWED_ORIGINS?.split(',') || [];
app.use(cors({
  origin: (origin, callback) => {
    // Allow requests with no origin (mobile apps, Postman, etc.)
    if (!origin) return callback(null, true);
    
    if (allowedOrigins.indexOf(origin) !== -1 || process.env.NODE_ENV === 'development') {
      callback(null, true);
    } else {
      callback(new Error('Not allowed by CORS'));
    }
  },
  methods: ['POST', 'GET'],
  credentials: true,
}));

// Create email transporter
const transporter = createTransporter();

// Verify transporter on startup
verifyTransporter(transporter);

// Health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({ 
    status: 'OK', 
    message: 'Email service is running',
    timestamp: new Date().toISOString(),
  });
});

// Email sending endpoint
app.post('/api/send-email', async (req, res) => {
  try {
    const { name, email, subject, message } = req.body;

    // Validation
    if (!name || !email || !subject || !message) {
      return res.status(400).json({
        success: false,
        error: 'All fields are required (name, email, subject, message)',
      });
    }

    // Email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      return res.status(400).json({
        success: false,
        error: 'Invalid email address',
      });
    }

    // Email content
    const mailOptions = {
      from: `"${name}" <${process.env.EMAIL_USER}>`,
      to: process.env.RECIPIENT_EMAIL,
      replyTo: email,
      subject: `Portfolio Contact: ${subject}`,
      html: `
        <!DOCTYPE html>
        <html>
        <head>
          <style>
            body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
            .container { max-width: 600px; margin: 0 auto; padding: 20px; }
            .header { background-color: #4A90E2; color: white; padding: 20px; text-align: center; }
            .content { background-color: #f9f9f9; padding: 20px; margin-top: 20px; }
            .field { margin-bottom: 15px; }
            .label { font-weight: bold; color: #4A90E2; }
            .footer { margin-top: 20px; padding-top: 20px; border-top: 1px solid #ddd; font-size: 12px; color: #666; }
          </style>
        </head>
        <body>
          <div class="container">
            <div class="header">
              <h2>📧 New Contact Form Submission</h2>
            </div>
            <div class="content">
              <div class="field">
                <span class="label">Name:</span><br>
                ${name}
              </div>
              <div class="field">
                <span class="label">Email:</span><br>
                <a href="mailto:${email}">${email}</a>
              </div>
              <div class="field">
                <span class="label">Subject:</span><br>
                ${subject}
              </div>
              <div class="field">
                <span class="label">Message:</span><br>
                ${message.replace(/\n/g, '<br>')}
              </div>
            </div>
            <div class="footer">
              <p>This email was sent from your portfolio contact form.</p>
              <p>Timestamp: ${new Date().toLocaleString()}</p>
            </div>
          </div>
        </body>
        </html>
      `,
      text: `
        New Contact Form Submission
        
        Name: ${name}
        Email: ${email}
        Subject: ${subject}
        
        Message:
        ${message}
        
        ---
        Sent from portfolio contact form
        ${new Date().toLocaleString()}
      `,
    };

    // Send email
    const info = await transporter.sendMail(mailOptions);

    console.log('✅ Email sent successfully:', info.messageId);
    
    res.status(200).json({
      success: true,
      message: 'Email sent successfully',
      messageId: info.messageId,
    });

  } catch (error) {
    console.error('❌ Error sending email:', error);
    
    res.status(500).json({
      success: false,
      error: 'Failed to send email. Please try again later.',
      details: process.env.NODE_ENV === 'development' ? error.message : undefined,
    });
  }
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: 'Endpoint not found',
  });
});

// Error handler
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({
    success: false,
    error: 'Internal server error',
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 Email service running on port ${PORT}`);
  console.log(`📧 Environment: ${process.env.NODE_ENV}`);
  console.log(`🌐 Allowed origins: ${allowedOrigins.join(', ')}`);
});
```

### Step 8: Update `package.json` Scripts

```json
{
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js",
    "test": "node -e \"console.log('Email service test')\""
  }
}
```

---

## Part 2: Gmail App-Specific Password Setup

### Step 1: Enable 2-Factor Authentication
1. Go to [Google Account](https://myaccount.google.com/)
2. Navigate to **Security**
3. Enable **2-Step Verification**

### Step 2: Generate App-Specific Password
1. Go to **Security** → **2-Step Verification**
2. Scroll to **App passwords**
3. Select app: **Mail**
4. Select device: **Other (Custom name)** → Type "Portfolio Email Service"
5. Click **Generate**
6. Copy the 16-character password
7. Paste it in your `.env` file as `EMAIL_PASSWORD`

---

## Part 3: Deploying the Email Service

### Option 1: Deploy to Heroku

```bash
# Install Heroku CLI
# Login to Heroku
heroku login

# Create new Heroku app
heroku create portfolio-email-service

# Set environment variables
heroku config:set EMAIL_SERVICE=gmail
heroku config:set EMAIL_USER=your-email@gmail.com
heroku config:set EMAIL_PASSWORD=your-app-password
heroku config:set RECIPIENT_EMAIL=niru-nny@example.com
heroku config:set ALLOWED_ORIGINS=https://your-portfolio-domain.com

# Deploy
git init
git add .
git commit -m "Initial email service"
heroku git:remote -a portfolio-email-service
git push heroku main

# Your API URL will be: https://portfolio-email-service.herokuapp.com
```

### Option 2: Deploy to Railway

1. Go to [Railway.app](https://railway.app/)
2. Click **New Project** → **Deploy from GitHub repo**
3. Select your email service repository
4. Add environment variables in Railway dashboard
5. Your API URL will be: `https://your-service.railway.app`

### Option 3: Deploy to Render

1. Go to [Render.com](https://render.com/)
2. Click **New** → **Web Service**
3. Connect your GitHub repository
4. Configure:
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
5. Add environment variables
6. Your API URL will be: `https://your-service.onrender.com`

### Option 4: Deploy to Vercel

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel

# Set environment variables
vercel env add EMAIL_SERVICE
vercel env add EMAIL_USER
vercel env add EMAIL_PASSWORD
vercel env add RECIPIENT_EMAIL
vercel env add ALLOWED_ORIGINS

# Your API URL will be: https://your-service.vercel.app
```

---

## Part 4: Integrating with Flutter Portfolio

### Step 1: Update Flutter Email Repository

Open `lib/infrastructure/api/email_repository.dart` and update the API endpoint:

```dart
class EmailRepository {
  // Replace with your deployed email service URL
  static const String _baseUrl = 'https://your-service.herokuapp.com'; // Or Railway/Render/Vercel URL
  
  Future<Either<EmailFailure, Unit>> sendEmail(EmailModel emailModel) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/send-email'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': emailModel.name,
          'email': emailModel.email,
          'subject': emailModel.subject,
          'message': emailModel.message,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {
          return right(unit);
        } else {
          return left(EmailFailure.serverError(data['error'] ?? 'Unknown error'));
        }
      } else {
        return left(EmailFailure.serverError('Failed to send email'));
      }
    } catch (e) {
      return left(EmailFailure.networkError());
    }
  }
}
```

### Step 2: Test the Integration

1. Run your Flutter app locally
2. Navigate to the contact page
3. Fill out the contact form
4. Submit and check if email arrives at `RECIPIENT_EMAIL`

---

## Part 5: Testing the Email Service

### Test with cURL

```bash
# Test health endpoint
curl https://your-service.herokuapp.com/health

# Test email sending
curl -X POST https://your-service.herokuapp.com/api/send-email \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Test User",
    "email": "test@example.com",
    "subject": "Test Email",
    "message": "This is a test message from the email service."
  }'
```

### Test with Postman

1. Create a new POST request
2. URL: `https://your-service.herokuapp.com/api/send-email`
3. Headers: `Content-Type: application/json`
4. Body (JSON):
```json
{
  "name": "Test User",
  "email": "test@example.com",
  "subject": "Test Subject",
  "message": "Test message content"
}
```
5. Send and verify email reception

---

## Part 6: Security Best Practices

### 1. Rate Limiting
Add rate limiting to prevent spam:

```bash
npm install express-rate-limit
```

Update `server.js`:
```javascript
const rateLimit = require('express-rate-limit');

const emailLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 5, // Limit each IP to 5 requests per windowMs
  message: 'Too many email requests, please try again later.',
});

app.post('/api/send-email', emailLimiter, async (req, res) => {
  // ... existing code
});
```

### 2. Input Sanitization
Add input sanitization:

```bash
npm install validator
```

Update `server.js`:
```javascript
const validator = require('validator');

// In the email endpoint
const sanitizedName = validator.escape(name);
const sanitizedSubject = validator.escape(subject);
const sanitizedMessage = validator.escape(message);
```

### 3. HTTPS Only
Ensure your deployment platform uses HTTPS (Heroku, Railway, Render, and Vercel all provide HTTPS by default).

### 4. Environment Variables
Never commit `.env` file to Git. Always use environment variables in production.

---

## Part 7: Monitoring and Logging

### Add Logging
```javascript
// Add at the top of server.js
const fs = require('fs');
const path = require('path');

const logFile = path.join(__dirname, 'email-logs.txt');

const logEmail = (data) => {
  const logEntry = `${new Date().toISOString()} - Email sent to: ${data.recipient} from: ${data.sender}\n`;
  fs.appendFileSync(logFile, logEntry);
};

// Use in email endpoint
logEmail({ recipient: process.env.RECIPIENT_EMAIL, sender: email });
```

### Monitor with Service Dashboard
- **Heroku**: View logs with `heroku logs --tail`
- **Railway**: Check logs in Railway dashboard
- **Render**: View logs in Render dashboard
- **Vercel**: Check logs in Vercel dashboard

---

## Part 8: Alternative Email Providers

### Using SendGrid

```bash
npm install @sendgrid/mail
```

Create `config/sendgridConfig.js`:
```javascript
const sgMail = require('@sendgrid/mail');
sgMail.setApiKey(process.env.SENDGRID_API_KEY);

const sendEmailWithSendGrid = async (mailOptions) => {
  const msg = {
    to: mailOptions.to,
    from: process.env.EMAIL_USER,
    replyTo: mailOptions.replyTo,
    subject: mailOptions.subject,
    text: mailOptions.text,
    html: mailOptions.html,
  };
  
  return await sgMail.send(msg);
};

module.exports = { sendEmailWithSendGrid };
```

### Using AWS SES

```bash
npm install @aws-sdk/client-ses
```

Requires AWS credentials and SES setup.

---

## Troubleshooting

### Common Issues

**1. Gmail "Less secure app" error**
- Solution: Use App-Specific Password (see Part 2)

**2. CORS errors**
- Solution: Add your Flutter app URL to `ALLOWED_ORIGINS` in `.env`

**3. Email not received**
- Check spam folder
- Verify `RECIPIENT_EMAIL` is correct
- Check email service logs

**4. 500 Internal Server Error**
- Check server logs
- Verify all environment variables are set
- Test email transporter with `verifyTransporter()`

**5. Timeout errors**
- Check firewall settings
- Verify SMTP port (587 or 465)
- Check email provider status

---

## Summary

This setup provides:
✅ Separate email service (keeps portfolio static)
✅ Easy deployment options (Heroku, Railway, Render, Vercel)
✅ Secure email handling with Nodemailer
✅ CORS support for Flutter integration
✅ Environment-based configuration
✅ Rate limiting and security
✅ Professional email templates
✅ Error handling and logging

Your Flutter portfolio stays **100% static** while having full email functionality through the API! 🚀
