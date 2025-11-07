part of 'values.dart';

class SkillCategory {
  final String title;
  final List<String> skills;

  SkillCategory({
    required this.title,
    required this.skills,
  });
}

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.WORKS, route: StringConst.WORKS_PAGE),
    NavItemData(
      name: StringConst.EXPERIENCE,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    NavItemData(
      name: StringConst.CERTIFICATIONS,
      route: StringConst.CERTIFICATION_PAGE,
    ),
    NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
    SocialData(
      name: StringConst.FACEBOOK,
      iconData: FontAwesomeIcons.facebook,
      url: StringConst.FACEBOOK_URL,
    ),
  ];

  // 7-Column Skill Categories
  static List<SkillCategory> skillCategories = [
    SkillCategory(
      title: "AI & Machine Learning",
      skills: [
        "Generative AI",
        "RAG Systems",
        "Large Language Models (LLMs)",
        "Prompt Engineering",
        "AI API Integration",
        "Computer Vision",
        "OCR-based Text Recognition",
        "Geospatial & GPS Validation",
        "Feature Engineering",
        "Model Evaluation",
      ],
    ),
    SkillCategory(
      title: "Programming Languages",
      skills: [
        "Python",
        "Java",
        "JavaScript / TypeScript",
        "Dart",
        "SQL",
        "C++",
        "R",
      ],
    ),
    SkillCategory(
      title: "Frameworks & Development",
      skills: [
        "Flutter (Bloc)",
        "React",
        "Tailwind CSS",
        "Node.js (Express)",
        "Flask",
      ],
    ),
    SkillCategory(
      title: "Databases & Storage",
      skills: [
        "PostgreSQL (Supabase)",
        "Vector Databases",
      ],
    ),
    SkillCategory(
      title: "Cloud & DevOps",
      skills: [
        "AWS",
        "Google Cloud",
        "Docker",
        "CI/CD (Basics)",
      ],
    ),
    SkillCategory(
      title: "Tools & Platforms",
      skills: [
        "Git & GitHub",
        "VS Code",
        "IntelliJ",
        "Android Studio",
        "Postman",
        "Jupyter Notebook",
        "Anaconda",
        "Firebase",
        "WordPress",
        "Figma",
        "LaTeX",
      ],
    ),
    SkillCategory(
      title: "Professional Skills",
      skills: [
        "Problem-Solving",
        "Collaboration",
        "Leadership",
        "Clear Documentation & Communication",
      ],
    ),
  ];

  // Legacy lists for backward compatibility
  static List<String> mobileTechnologies = [
    "Generative AI",
    "RAG Systems",
    "Python",
    "Java",
  ];

  static List<String> otherTechnologies = [
    "Flutter (Bloc)",
    "React",
    "AWS",
    "Docker",
  ];
  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TWITTER,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialData(
      name: StringConst.INSTAGRAM,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
    SocialData(
      name: StringConst.FACEBOOK,
      iconData: FontAwesomeIcons.facebook,
      url: StringConst.FACEBOOK_URL,
    ),
  ];

  static List<ProjectItemData> recentWorks = [
    Projects.PHOTO_GUARD,
    Projects.GPS_VERIFIER,
    Projects.HOUSE_PRICE,
    Projects.URGENCY_CHECKER,
    Projects.RESULT_KHOJ,
  ];

  static List<ProjectItemData> projects = [
    Projects.PHOTO_GUARD,
    Projects.GPS_VERIFIER,
    Projects.HOUSE_PRICE,
    Projects.URGENCY_CHECKER,
    Projects.RESULT_KHOJ,
  ];

  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(
      projectName: StringConst.LOCATION_LOCALITIES_FINDER,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: "Python, REST API, Geolocation",
      projectDescription: StringConst.LOCATION_LOCALITIES_FINDER_DETAIL,
      gitHubUrl: StringConst.LOCATION_LOCALITIES_FINDER_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.CHUNKING,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: "Python, NLP, Text Processing",
      projectDescription: StringConst.CHUNKING_DETAIL,
      gitHubUrl: StringConst.CHUNKING_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SIXTEEN_PERSONALITIES,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: "Psychology, Assessment Tools",
      projectDescription: StringConst.SIXTEEN_PERSONALITIES_DETAIL,
      gitHubUrl: StringConst.SIXTEEN_PERSONALITIES_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.BIG_FIVE,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: "Python, AWS, Big Five Model",
      projectDescription: StringConst.BIG_FIVE_DETAIL,
      gitHubUrl: StringConst.BIG_FIVE_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.GEMINI_GENIOUS,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: "Google Gemini AI, Python, Web",
      projectDescription: StringConst.GEMINI_GENIOUS_DETAIL,
      gitHubUrl: StringConst.GEMINI_GENIOUS_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.TECH_BLITZ,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: "Web Development, Learning Platform",
      projectDescription: StringConst.TECH_BLITZ_DETAIL,
      gitHubUrl: StringConst.TECH_BLITZ_GITHUB_URL,
      isLive: false,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.CERT_1_TITLE,
      url: StringConst.CERT_1_URL,
      image: ImagePath.CERT_1,
      imageSize: 0.325,
      awardedBy: StringConst.CERT_1_DESC,
    ),
    CertificationData(
      title: StringConst.CERT_2_TITLE,
      url: StringConst.CERT_2_URL,
      image: ImagePath.CERT_2,
      imageSize: 0.325,
      awardedBy: StringConst.CERT_2_DESC,
    ),
    CertificationData(
      title: StringConst.CERT_3_TITLE,
      url: StringConst.CERT_3_URL,
      image: ImagePath.CERT_3,
      imageSize: 0.325,
      awardedBy: StringConst.CERT_3_DESC,
    ),
    CertificationData(
      title: StringConst.CERT_4_TITLE,
      url: StringConst.CERT_4_URL,
      image: ImagePath.CERT_4,
      imageSize: 0.325,
      awardedBy: StringConst.CERT_4_DESC,
    ),
    CertificationData(
      title: StringConst.CERT_5_TITLE,
      url: StringConst.CERT_5_URL,
      image: ImagePath.CERT_5,
      imageSize: 0.325,
      awardedBy: StringConst.CERT_5_DESC,
    ),
    CertificationData(
      title: StringConst.CERT_6_TITLE,
      url: StringConst.CERT_6_URL,
      image: ImagePath.CERT_6,
      imageSize: 0.325,
      awardedBy: StringConst.CERT_6_DESC,
    ),
    CertificationData(
      title: StringConst.CERT_7_TITLE,
      url: StringConst.CERT_7_URL,
      image: ImagePath.CERT_7,
      imageSize: 0.325,
      awardedBy: StringConst.CERT_7_DESC,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_4,
      position: StringConst.POSITION_4,
      companyUrl: StringConst.COMPANY_4_URL,
      roles: [
        StringConst.COMPANY_4_ROLE_1,
        StringConst.COMPANY_4_ROLE_2,
        StringConst.COMPANY_4_ROLE_3,
        StringConst.COMPANY_4_ROLE_4,
        StringConst.COMPANY_4_ROLE_5,
      ],
      location: StringConst.LOCATION_4,
      duration: StringConst.DURATION_4,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
        StringConst.COMPANY_3_ROLE_4,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
        StringConst.COMPANY_2_ROLE_4,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
  ];
}

class Projects {
  static ProjectItemData PHOTO_GUARD = ProjectItemData(
    title: StringConst.PHOTO_GUARD,
    subtitle: StringConst.PHOTO_GUARD_SUBTITLE,
    platform: StringConst.PHOTO_GUARD_PLATFORM,
    primaryColor: AppColors.primaryColor,
    image: ImagePath.PHOTO_GUARD_COVER,
    coverUrl: ImagePath.PHOTO_GUARD_SCREENS,
    navSelectedTitleColor: AppColors.black,
    appLogoColor: AppColors.black,
    projectAssets: [
      ImagePath.PHOTO_GUARD_1,
      ImagePath.PHOTO_GUARD_2,
      ImagePath.PHOTO_GUARD_3,
      ImagePath.PHOTO_GUARD_4,
      ImagePath.PHOTO_GUARD_5,
    ],
    category: StringConst.PHOTO_GUARD_CATEGORY,
    portfolioDescription: StringConst.PHOTO_GUARD_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: "Python, OpenCV, Machine Learning",
    gitHubUrl: StringConst.PHOTO_GUARD_GITHUB_URL,
    playStoreUrl: StringConst.PHOTO_GUARD_PLAYSTORE_URL,
  );

  static ProjectItemData GPS_VERIFIER = ProjectItemData(
    title: StringConst.GPS_VERIFIER,
    subtitle: StringConst.GPS_VERIFIER_SUBTITLE,
    platform: StringConst.GPS_VERIFIER_PLATFORM,
    primaryColor: AppColors.primaryColor,
    image: ImagePath.GPS_VERIFIER_COVER,
    coverUrl: ImagePath.GPS_VERIFIER_SCREENS,
    navSelectedTitleColor: AppColors.black,
    appLogoColor: AppColors.black,
    projectAssets: [
      ImagePath.GPS_VERIFIER_1,
      ImagePath.GPS_VERIFIER_2,
      ImagePath.GPS_VERIFIER_3,
      ImagePath.GPS_VERIFIER_4,
      ImagePath.GPS_VERIFIER_5,
      ImagePath.GPS_VERIFIER_6,
    ],
    category: StringConst.GPS_VERIFIER_CATEGORY,
    portfolioDescription: StringConst.GPS_VERIFIER_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: "Python, OpenCV, Computer Vision, OCR",
    gitHubUrl: StringConst.GPS_VERIFIER_GITHUB_URL,
    playStoreUrl: StringConst.GPS_VERIFIER_PLAYSTORE_URL,
  );

  static ProjectItemData HOUSE_PRICE = ProjectItemData(
    title: StringConst.HOUSE_PRICE,
    subtitle: StringConst.HOUSE_PRICE_SUBTITLE,
    platform: StringConst.HOUSE_PRICE_PLATFORM,
    primaryColor: AppColors.primaryColor,
    image: ImagePath.HOUSE_PRICE_COVER,
    coverUrl: ImagePath.HOUSE_PRICE_SCREENS,
    navSelectedTitleColor: AppColors.black,
    appLogoColor: AppColors.black,
    projectAssets: [
      ImagePath.HOUSE_PRICE_1,
      ImagePath.HOUSE_PRICE_2,
      ImagePath.HOUSE_PRICE_3,
      ImagePath.HOUSE_PRICE_4,
      ImagePath.HOUSE_PRICE_5,
      ImagePath.HOUSE_PRICE_6,
      ImagePath.HOUSE_PRICE_7,
      ImagePath.HOUSE_PRICE_8,
      ImagePath.HOUSE_PRICE_9,
    ],
    category: StringConst.HOUSE_PRICE_CATEGORY,
    portfolioDescription: StringConst.HOUSE_PRICE_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: "Python, Random Forest, Scikit-learn, Pandas",
    gitHubUrl: StringConst.HOUSE_PRICE_GITHUB_URL,
    playStoreUrl: StringConst.HOUSE_PRICE_PLAYSTORE_URL,
  );

  static ProjectItemData URGENCY_CHECKER = ProjectItemData(
    title: StringConst.URGENCY_CHECKER,
    subtitle: StringConst.URGENCY_CHECKER_SUBTITLE,
    platform: StringConst.URGENCY_CHECKER_PLATFORM,
    primaryColor: AppColors.primaryColor,
    image: ImagePath.URGENCY_CHECKER_COVER,
    coverUrl: ImagePath.URGENCY_CHECKER_SCREENS,
    navSelectedTitleColor: AppColors.black,
    appLogoColor: AppColors.black,
    projectAssets: [
      ImagePath.URGENCY_CHECKER_1,
      ImagePath.URGENCY_CHECKER_2,
      ImagePath.URGENCY_CHECKER_3,
      ImagePath.URGENCY_CHECKER_4,
      ImagePath.URGENCY_CHECKER_5,
    ],
    category: StringConst.URGENCY_CHECKER_CATEGORY,
    portfolioDescription: StringConst.URGENCY_CHECKER_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: "Python, FastAPI, TF-IDF, NLP, YOLO, Computer Vision",
    gitHubUrl: StringConst.URGENCY_CHECKER_GITHUB_URL,
    playStoreUrl: StringConst.URGENCY_CHECKER_PLAYSTORE_URL,
  );

  static ProjectItemData RESULT_KHOJ = ProjectItemData(
    title: StringConst.RESULT_KHOJ,
    subtitle: StringConst.RESULT_KHOJ_SUBTITLE,
    platform: StringConst.RESULT_KHOJ_PLATFORM,
    primaryColor: AppColors.primaryColor,
    image: ImagePath.RESULT_KHOJ_COVER,
    coverUrl: ImagePath.RESULT_KHOJ_SCREENS,
    navSelectedTitleColor: AppColors.black,
    appLogoColor: AppColors.black,
    projectAssets: [
      ImagePath.RESULT_KHOJ_1,
      ImagePath.RESULT_KHOJ_2,
      ImagePath.RESULT_KHOJ_3,
      ImagePath.RESULT_KHOJ_4,
      ImagePath.RESULT_KHOJ_5,
    ],
    category: StringConst.RESULT_KHOJ_CATEGORY,
    portfolioDescription: StringConst.RESULT_KHOJ_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: "React, Node.js, Express, Supabase, PostgreSQL, Nodemailer",
    gitHubUrl: StringConst.RESULT_KHOJ_GITHUB_URL,
    playStoreUrl: StringConst.RESULT_KHOJ_PLAYSTORE_URL,
  );
}

