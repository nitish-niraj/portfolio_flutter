import 'package:nitish_kumar_portfolio/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nitish_kumar_portfolio/app_theme.dart';
import 'package:nitish_kumar_portfolio/presentation/pages/home/home_page.dart';
import 'package:nitish_kumar_portfolio/presentation/routes/routes.dart';
import 'package:nitish_kumar_portfolio/values/values.dart';
import 'package:layout/layout.dart';

import 'configure_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Configure system UI for better mobile experience
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  
  // Lock orientation to portrait for mobile (optional, can be removed if landscape is needed)
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  
  configureDependencies();
  configureApp();
  runApp(const NitishKumarPortfolio());
}

class NitishKumarPortfolio extends StatelessWidget {
  const NitishKumarPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.homePageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
        // Performance optimizations
        builder: (context, child) {
          return MediaQuery(
            // Prevent font scaling beyond reasonable limits for better mobile UX
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(
                MediaQuery.of(context).textScaler.scale(1.0).clamp(0.8, 1.3),
              ),
            ),
            child: child!,
          );
        },
        // Enable scroll performance optimizations
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          scrollbars: false,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}


