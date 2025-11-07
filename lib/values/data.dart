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
    Projects.DROP,
    Projects.ROAM,
    Projects.LOGIN_CATALOG,
    Projects.FOODY_BITE,
    Projects.NIMBUS,
  ];

  static List<ProjectItemData> projects = [
    Projects.PHOTO_GUARD,
    Projects.GPS_VERIFIER,
    Projects.HOUSE_PRICE,
    Projects.URGENCY_CHECKER,
    Projects.RESULT_KHOJ,
    Projects.DROP,
    Projects.ROAM,
    Projects.LOGIN_CATALOG,
    Projects.FOODY_BITE,
    Projects.NIMBUS,
    Projects.OTP_TEXT_FIELD,
    Projects.AERIUM,
    Projects.AERIUM_V2,
    Projects.OUTFITR,
  ];

  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(
      projectName: StringConst.UDAGRAM_IMAGE_FILTERING,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.UDAGRAM_IMAGE_FILTERING_TECH,
      projectDescription: StringConst.UDAGRAM_IMAGE_FILTERING_DETAIL,
      gitHubUrl: StringConst.UDAGRAM_IMAGE_FILTERING_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SERVERLESS_TODO,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.SERVERLESS_TODO_TECH,
      projectDescription: StringConst.SERVERLESS_TODO_DETAIL,
      gitHubUrl: StringConst.SERVERLESS_TODO_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PYTHON_ALGORITHMS,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PYTHON_ALGORITHMS_DETAIL,
      gitHubUrl: StringConst.PYTHON_ALGORITHMS_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PROGRAMMING_FOR_DATA_SCIENCE,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_DETAIL,
      gitHubUrl: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.ONBOARDING_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.ONBOARDING_APP_DETAIL,
      gitHubUrl: StringConst.ONBOARDING_APP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.FINOPP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.FINOPP_DETAIL,
      gitHubUrl: StringConst.FINOPP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.AMOR_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.AMOR_APP_DETAIL,
      gitHubUrl: StringConst.AMOR_APP_GITHUB_URL,
      webUrl: StringConst.AMOR_APP_WEB_URL,
      isLive: true,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.MSC_IT,
      url: StringConst.CMU_CERT_URL,
      image: ImagePath.CMU_MASTERS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.CMU,
    ),
    CertificationData(
      title: StringConst.ASSOCIATE_ANDROID_DEV,
      url: StringConst.ASSOCIATE_ANDROID_DEV_URL,
      image: ImagePath.ASSOCIATE_ANDROID_DEV,
      imageSize: 0.325,
      awardedBy: StringConst.GOOGLE,
    ),
    CertificationData(
      title: StringConst.CLOUD_DEVELOPER,
      url: StringConst.CLOUD_DEVELOPER_URL,
      image: ImagePath.CLOUD_DEVELOPER_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.DATA_SCIENCE,
      url: StringConst.DATA_SCIENCE_CERT_URL,
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.ANDROID_BASICS,
      url: StringConst.ANDROID_BASICS_CERT_URL,
      image: ImagePath.ANDROID_BASICS_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDACITY,
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

  static ProjectItemData FLUTTER_CATALOG = ProjectItemData(
    title: StringConst.FLUTTER_CATALOG,
    subtitle: StringConst.FLUTTER_CATALOG,
    platform: StringConst.FLUTTER_CATALOG_PLATFORM,
    primaryColor: AppColors.flutter_catalog,
    image: ImagePath.FLUTTER_CATALOG_COVER,
    coverUrl: ImagePath.FLUTTER_CATALOG_COVER,
    navSelectedTitleColor: AppColors.flutterCatalogSelectedNavTitle,
    appLogoColor: AppColors.flutterCatalogAppLogo,
    projectAssets: [
      ImagePath.FLUTTER_CATALOG_SCREENS,
      ImagePath.FLUTTER_CATALOG_1,
      ImagePath.FLUTTER_CATALOG_2,
      ImagePath.FLUTTER_CATALOG_3,
      ImagePath.FLUTTER_CATALOG_4,
      ImagePath.FLUTTER_CATALOG_5,
    ],
    category: StringConst.FLUTTER_CATALOG_CATEGORY,
    portfolioDescription: StringConst.FLUTTER_CATALOG_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.FLUTTER_CATALOG_GITHUB_URL,
    playStoreUrl: StringConst.FLUTTER_CATALOG_PLAYSTORE_URL,
  );
  static ProjectItemData DROP = ProjectItemData(
    title: StringConst.DROP,
    subtitle: StringConst.DROP,
    platform: StringConst.DROP_PLATFORM,
    primaryColor: AppColors.drop,
    image: ImagePath.DROP_COVER,
    category: StringConst.DROP_CATEGORY,
    designer: StringConst.DROP_DESIGNER,
    coverUrl: ImagePath.DROP_COVER,
    navTitleColor: AppColors.dropNavTitle,
    navSelectedTitleColor: AppColors.dropSelectedNavTitle,
    appLogoColor: AppColors.dropAppLogo,
    projectAssets: [
      ImagePath.DROP_DESC,
      ImagePath.DROP_FLOW_CHART,
      ImagePath.DROP_WIREFRAMES,
      ImagePath.DROP_MINIMAL_DESIGN,
      ImagePath.DROP_EASY_ACCESS,
      ImagePath.DROP_SIMPLE,
      ImagePath.DROP_THANKS,
    ],
    portfolioDescription: StringConst.DROP_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.DROP_GITHUB_URL,
    playStoreUrl: StringConst.DROP_PLAYSTORE_URL,
  );
  static ProjectItemData ROAM = ProjectItemData(
    title: StringConst.ROAM,
    subtitle: StringConst.ROAM,
    primaryColor: AppColors.roam,
    category: StringConst.ROAM_CATEGORY,
    designer: StringConst.ROAM_DESIGNER,
    platform: StringConst.ROAM_PLATFORM,
    image: ImagePath.ROAM_COVER,
    coverUrl: ImagePath.ROAM_COVER,
    navTitleColor: AppColors.roamNavTitle,
    navSelectedTitleColor: AppColors.roamSelectedNavTitle,
    appLogoColor: AppColors.roamAppLogo,
    projectAssets: [
      ImagePath.ROAM_OVERALL,
      ImagePath.ROAM_ONBOARDING,
      ImagePath.ROAM_HOME,
      ImagePath.ROAM_EXPLORE,
      ImagePath.ROAM_PROFILE,
      ImagePath.ROAM_FLOW_CHART,
      ImagePath.ROAM_WIREFRAMES_1,
      ImagePath.ROAM_WIREFRAMES_2,
      ImagePath.ROAM_WIREFRAMES_3,
    ],
    portfolioDescription: StringConst.ROAM_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.ROAM_GITHUB_URL,
    playStoreUrl: StringConst.ROAM_PLAYSTORE_URL,
  );
  static ProjectItemData LOGIN_CATALOG = ProjectItemData(
    title: StringConst.LOGIN_CATALOG,
    primaryColor: AppColors.login_catalog,
    subtitle: StringConst.LOGIN_CATALOG,
    category: StringConst.LOGIN_CATALOG_CATEGORY,
    platform: StringConst.LOGIN_CATALOG_PLATFORM,
    image: ImagePath.LOGIN_CATALOG_COVER,
    coverUrl: ImagePath.LOGIN_CATALOG_COVER,
    portfolioDescription: StringConst.LOGIN_CATALOG_DETAIL,
    navTitleColor: AppColors.loginCatalogNavTitle,
    navSelectedTitleColor: AppColors.loginCatalogSelectedNavTitle,
    appLogoColor: AppColors.loginCatalogAppLogo,
    projectAssets: [
      ImagePath.LOGIN_DESIGN_4,
      ImagePath.LOGIN_DESIGN_5,
      ImagePath.LOGIN_DESIGN_7,
      ImagePath.LOGIN_DESIGN_8,
      ImagePath.LOGIN_DESIGN_9,
    ],
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.LOGIN_CATALOG_GITHUB_URL,
    playStoreUrl: StringConst.LOGIN_CATALOG_PLAYSTORE_URL,
  );
  static ProjectItemData FOODY_BITE = ProjectItemData(
    title: StringConst.FOODY_BITE,
    subtitle: StringConst.FOODY_BITE_SUBTITLE,
    category: StringConst.FOODY_BITE_CATEGORY,
    designer: StringConst.FOODY_BITE_DESIGNER,
    primaryColor: AppColors.foodybite,
    platform: StringConst.FOODY_BITE_PLATFORM,
    image: ImagePath.FOODY_BITE_COVER,
    coverUrl: ImagePath.FOODY_BITE_COVER,
    navTitleColor: AppColors.foodybiteNavTitle,
    navSelectedTitleColor: AppColors.foodybiteSelectedNavTitle,
    appLogoColor: AppColors.foodybiteAppLogo,
    projectAssets: [
      ImagePath.FOODY_BITE_HOME,
      ImagePath.FOODY_BITE_STARTING_FLOW,
      ImagePath.FOODY_BITE_HOME_FLOW,
      ImagePath.FOODY_BITE_REVIEW_FLOW,
      ImagePath.FOODY_BITE_TYPOGRAPHY,
    ],
    portfolioDescription: StringConst.FOODY_BITE_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.FOODY_BITE_GITHUB_URL,
    playStoreUrl: StringConst.FOODY_BITE_PLAYSTORE_URL,
  );
  static ProjectItemData NIMBUS = ProjectItemData(
    title: StringConst.NIMBUS,
    subtitle: StringConst.NIMBUS,
    primaryColor: AppColors.nimbus,
    platform: StringConst.NIMBUS_PLATFORM,
    category: StringConst.NIMBUS_CATEGORY,
    designer: StringConst.NIMBUS_DESIGNER,
    image: ImagePath.NIMBUS_COVER,
    coverUrl: ImagePath.NIMBUS_COVER,
    navTitleColor: AppColors.nimbusNavTitle,
    navSelectedTitleColor: AppColors.nimbusSelectedNavTitle,
    projectAssets: [
      ImagePath.NIMBUS,
    ],
    portfolioDescription: StringConst.NIMBUS_DETAIL,
    isPublic: true,
    isOnPlayStore: false,
    isLive: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.NIMBUS_GITHUB_URL,
    webUrl: StringConst.NIMBUS_WEB_URL,
  );
  static ProjectItemData OTP_TEXT_FIELD = ProjectItemData(
    title: StringConst.OTP_TEXT_FIELD,
    subtitle: StringConst.OTP_TEXT_FIELD_SUBTITLE,
    category: StringConst.OTP_TEXT_FIELD_CATEGORY,
    primaryColor: AppColors.otp_package,
    platform: StringConst.OTP_TEXT_FIELD_PLATFORM,
    image: ImagePath.OTP_TEXTFIELD_COVER,
    coverUrl: ImagePath.OTP_TEXTFIELD_COVER,
    portfolioDescription: StringConst.OTP_TEXT_FIELD_DETAIL,
    navTitleColor: AppColors.otpPackageNavTitle,
    navSelectedTitleColor: AppColors.otpPackageSelectedNavTitle,
    appLogoColor: AppColors.otpPackageAppLogo,
    isPublic: true,
    isLive: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.OTP_TEXT_FIELD_GITHUB_URL,
    webUrl: StringConst.OTP_TEXT_FIELD_WEB_URL,
  );
  static ProjectItemData AERIUM = ProjectItemData(
    title: StringConst.AERIUM,
    subtitle: StringConst.AERIUM_SUBTITLE,
    primaryColor: AppColors.aerium_v1,
    platform: StringConst.AERIUM_PLATFORM,
    category: StringConst.AERIUM_CATEGORY,
    designer: StringConst.AERIUM_DESIGNER,
    image: ImagePath.AERIUM_COVER,
    coverUrl: ImagePath.AERIUM_COVER,
    navTitleColor: AppColors.aeriumV1NavTitle,
    projectAssets: [
      ImagePath.AERIUM_COVER,
      ImagePath.AERIUM_DESIGN_2,
      ImagePath.AERIUM_DESIGN_3,
    ],
    portfolioDescription: StringConst.AERIUM_DETAIL,
    isPublic: true,
    isLive: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.AERIUM_GITHUB_URL,
    webUrl: StringConst.AERIUM_WEB_URL,
  );
  static ProjectItemData AERIUM_V2 = ProjectItemData(
    title: StringConst.AERIUM_V2,
    subtitle: StringConst.AERIUM_V2_SUBTITLE,
    category: StringConst.AERIUM_V2_CATEGORY,
    designer: StringConst.AERIUM_V2_DESIGNER,
    primaryColor: AppColors.aerium_v1,
    platform: StringConst.AERIUM_V2_PLATFORM,
    image: ImagePath.AERIUM_V2_LAST,
    coverUrl: ImagePath.AERIUM_V2_LAST,
    portfolioDescription: StringConst.AERIUM_V2_DETAIL,
    projectAssets: [
      ImagePath.AERIUM_V2_OVERALL,
      ImagePath.AERIUM_V2_FIRST,
      ImagePath.AERIUM_V2_TYPOGRAPHY,
      ImagePath.AERIUM_V2_LAST,
    ],
    isPublic: true,
    isLive: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.AERIUM_V2_GITHUB_URL,
    webUrl: StringConst.AERIUM_V2_WEB_URL,
  );
  static ProjectItemData OUTFITR = ProjectItemData(
    title: StringConst.OUTFITR,
    subtitle: StringConst.OUTFITR_SUBTITLE,
    category: StringConst.OUTFITR_CATEGORY,
    primaryColor: AppColors.outfitr,
    platform: StringConst.OUTFITR_PLATFORM,
    image: ImagePath.OUTFITR_COVER,
    coverUrl: ImagePath.OUTFITR_1,
    portfolioDescription: StringConst.OUTFITR_DETAIL,
    navTitleColor: AppColors.outfitrNavTitle,
    navSelectedTitleColor: AppColors.outfitrSelectedNavTitle,
    appLogoColor: AppColors.outfitrAppLogo,
    projectAssets: [
      ImagePath.OUTFITR_2,
      ImagePath.OUTFITR_4,
      ImagePath.OUTFITR_5,
      ImagePath.OUTFITR_6,
    ],
    isPublic: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.OUTFITR_GITHUB_URL,
    webUrl: StringConst.OUTFITR_WEB_URL,
  );
}
