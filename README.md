# 🚀 Nitish Kumar - Portfolio

[![Deploy to Netlify](https://github.com/nitish-niraj/portfolio_flutter/actions/workflows/deploy-netlify.yml/badge.svg)](https://github.com/nitish-niraj/portfolio_flutter/actions/workflows/deploy-netlify.yml)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

> A modern, responsive portfolio website built with Flutter Web showcasing my work as an AI/ML Engineer, Software Developer, and Generative AI specialist.

## 🌐 Live Demo

**[View Live Portfolio →](https://nitishkumar.com)**

## ✨ Features

- 🎨 **Modern UI/UX**: Clean, professional design with smooth animations
- 📱 **Fully Responsive**: Optimized for desktop, tablet, and mobile devices
- ⚡ **Fast Performance**: Built with Flutter Web for blazing-fast load times
- 🎯 **Project Showcase**: Highlighting AI/ML, Full-Stack, and Mobile Development projects
- 📧 **Contact Integration**: Email functionality with Nodemailer backend
- 🌓 **Dark Theme**: Professional dark color scheme
- 🔗 **Social Links**: GitHub, LinkedIn, HuggingFace, Twitter, Instagram, and more
- 🎓 **Certifications**: Display of professional certifications and achievements
- 💼 **Experience Timeline**: Showcase of work history and expertise
- 🚀 **Auto-Deploy**: CI/CD pipeline with Netlify for automatic deployments

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev) (Web)
- **Language**: [Dart](https://dart.dev) (SDK >=3.0.0 <4.0.0)
- **State Management**: BLoC pattern with `flutter_bloc`
- **Navigation**: `auto_route` for type-safe routing
- **Animations**: Custom animations with `simple_animations`
- **Icons**: `font_awesome_flutter` + custom SVG icons with `flutter_svg`
- **Dependency Injection**: `get_it` + `injectable`
- **Email Backend**: Node.js + Express + Nodemailer (separate service)
- **Deployment**: Netlify with GitHub Actions CI/CD
- **Version Control**: Git + GitHub

## 📦 Key Dependencies

```yaml
dependencies:
  flutter_bloc: ^8.1.6
  freezed_annotation: ^2.4.4
  get_it: ^7.7.0
  injectable: ^2.4.4
  auto_route: ^9.2.2
  font_awesome_flutter: ^10.7.0
  flutter_svg: ^2.0.10
  url_launcher: ^6.3.0
  simple_animations: ^5.0.2
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher
- A code editor (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/nitish-niraj/portfolio_flutter.git
   cd portfolio_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   flutter build web --release --web-renderer html
   ```

## 📁 Project Structure

```
lib/
├── core/                  # Core utilities and layouts
│   ├── layout/           # Responsive layout helpers
│   └── utils/            # Extensions and utility functions
├── infrastructure/        # Data layer
│   ├── api/              # API services (Email)
│   ├── bloc/             # BLoC state management
│   └── failures/         # Error handling
├── presentation/          # UI layer
│   ├── pages/            # App screens/pages
│   ├── routes/           # Navigation routing
│   └── widgets/          # Reusable UI components
├── values/               # App constants
│   ├── colors.dart       # Color palette
│   ├── strings.dart      # Text constants
│   ├── images.dart       # Asset paths
│   ├── data.dart         # Static data
│   └── styles.dart       # Text styles
├── app_theme.dart        # Theme configuration
├── injection_container.dart  # DI setup
└── main.dart             # App entry point
```

## 🎯 Features Breakdown

### 🏠 Home Page
- Hero section with animated introduction
- Quick access to projects and contact
- Scroll animations and smooth transitions

### 💼 Works & Projects
- Showcase of AI/ML projects (RAG systems, GenAI)
- Full-stack web applications
- Mobile app development
- GitHub repository links

### 👨‍💻 Experience
- Professional work history
- Skills and technologies
- Achievements and contributions

### 🎓 Certifications
- Professional certifications display
- Non-clickable certificate images
- Clean, organized layout

### 📧 Contact
- Contact form with validation
- Email integration (separate Nodemailer backend)
- Social media links

## 🔧 Configuration

### Update Personal Information

Edit `lib/values/strings.dart`:
```dart
static const String DEV_NAME = "Your Name";
static const String DEV_EMAIL = "your.email@example.com";
static const String GITHUB_URL = "https://github.com/yourusername";
static const String LINKED_IN_URL = "https://linkedin.com/in/yourprofile";
```

### Update Projects

Edit `lib/values/data.dart` to add/modify your projects.

### Email Setup

See [`email_nodemailer.md`](email_nodemailer.md) for complete email service setup instructions.

## 🚀 Deployment

This project uses **Netlify** with automatic deployments via GitHub Actions.

### Deploy to Netlify

1. **Fork/Clone this repo**
2. **Create a Netlify site** at https://app.netlify.com
3. **Add secrets to GitHub**:
   - Go to: Settings → Secrets and variables → Actions
   - Add `NETLIFY_AUTH_TOKEN` (from Netlify User Settings)
   - Add `NETLIFY_SITE_ID` (from Netlify Site Settings)
4. **Push to main** - Automatic deployment! 🎉

For detailed setup instructions, see [`.github/workflows/README.md`](.github/workflows/README.md).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 About Me

Hi! I'm **Nitish Kumar**, an AI/ML Engineer and Full-Stack Developer specializing in:

- 🤖 **AI/ML Engineering**: Generative AI, RAG systems, LLMs
- 🌐 **Full-Stack Development**: Web & Mobile applications
- ☁️ **Cloud Technologies**: Deployment and optimization
- 🎨 **UI/UX**: Building user-friendly interfaces

### 🔗 Connect with Me

[![GitHub](https://img.shields.io/badge/GitHub-nitish--niraj-181717?logo=github)](https://github.com/nitish-niraj)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-niru--nny-0A66C2?logo=linkedin)](https://www.linkedin.com/in/niru-nny/)
[![HuggingFace](https://img.shields.io/badge/HuggingFace-niru--nny-FFD21E?logo=huggingface&logoColor=000)](https://huggingface.co/niru-nny)
[![Twitter](https://img.shields.io/badge/Twitter-niru__nny-1DA1F2?logo=twitter)](https://x.com/niru_nny)
[![Email](https://img.shields.io/badge/Email-kumarnitish87461%40gmail.com-EA4335?logo=gmail)](mailto:kumarnitish87461@gmail.com)

## 🙏 Acknowledgments

- Design inspiration by [Julius G.](https://www.behance.net/gallery/63574251/Personal-Portfolio-Website-Design)
- Built with ❤️ using [Flutter](https://flutter.dev)

---

<div align="center">
  <p>⭐ Star this repo if you like it!</p>
  <p>© 2025 Nitish Kumar. All rights reserved.</p>
</div>
