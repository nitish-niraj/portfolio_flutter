import 'package:nitish_kumar_portfolio/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:nitish_kumar_portfolio/app_theme.dart';
import 'package:nitish_kumar_portfolio/presentation/pages/home/home_page.dart';
import 'package:nitish_kumar_portfolio/presentation/routes/routes.dart';
import 'package:nitish_kumar_portfolio/values/values.dart';
import 'package:layout/layout.dart';

import 'configure_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  configureApp();
  runApp(NitishKumarPortfolio());
}

class NitishKumarPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.homePageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}


