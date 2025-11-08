import 'package:nitish_kumar_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.title = "DC",
    this.titleColor = AppColors.black,
    this.titleStyle,
    this.fontSize = 60,
    this.useImage = true,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;
  final bool useImage;
  
  @override
  Widget build(BuildContext context) {
    if (useImage) {
      return Image.asset(
        ImagePath.NIRAJ_LOGO,
        height: fontSize,
        width: fontSize,
        fit: BoxFit.contain,
      );
    }
    
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: titleStyle ??
          textTheme.displayMedium?.copyWith(
            color: titleColor,
            fontSize: fontSize,
          ),
    );
  }
}
