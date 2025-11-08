import 'package:nitish_kumar_portfolio/presentation/widgets/empty.dart';
import 'package:nitish_kumar_portfolio/presentation/widgets/spaces.dart';
import 'package:nitish_kumar_portfolio/values/values.dart';
import 'package:flutter/material.dart';

class CertificationCard extends StatefulWidget {
  CertificationCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.actionTitle,
    this.width = 500,
    this.height = 400,
    this.elevation,
    this.shadow,
    this.hoverColor = AppColors.accentColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTitleTextStyle,
    this.duration = 1000,
    this.onTap,
    this.isMobileOrTablet = false,
  });

  final double width;
  final double height;
  final String imageUrl;
  final double? elevation;
  final Shadow? shadow;
  final String title;
  final String subtitle;
  final String actionTitle;
  final Color hoverColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? actionTitleTextStyle;
  final int duration;
  final GestureTapCallback? onTap;
  final bool isMobileOrTablet;

  @override
  _CertificationCardState createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _portfolioCoverController;
  late Animation<double> _opacityAnimation;
  final int duration = 400;
  bool _hovering = false;

  @override
  void initState() {
    _portfolioCoverController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    initTweens();

    super.initState();
  }

  @override
  void dispose() {
    _portfolioCoverController.dispose();
    super.dispose();
  }

  void initTweens() {
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _portfolioCoverController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<void> _playPortfolioCoverAnimation() async {
    try {
      await _portfolioCoverController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    // For mobile/tablet: Show card with image on top and text below
    if (widget.isMobileOrTablet) {
      return Container(
        width: widget.width,
        child: Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Certificate image
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.asset(
                  widget.imageUrl,
                  width: widget.width,
                  height: widget.height * 0.7, // 70% for image
                  fit: BoxFit.cover,
                ),
              ),
              // Text content below
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: widget.titleTextStyle ??
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    SpaceH8(),
                    Text(
                      widget.subtitle,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: widget.subtitleTextStyle ??
                          Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.grey700,
                                fontSize: Sizes.TEXT_SIZE_14,
                              ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    
    // For desktop: Keep the hover effect
    return Container(
      width: widget.width,
      height: widget.height,
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: Stack(
            children: [
              Image.asset(
                widget.imageUrl,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
              ),
              // if it is not a tablet or mobile device, allow on hover effect
              !widget.isMobileOrTablet && _hovering
                  ? FadeTransition(
                      opacity: _opacityAnimation,
                      child: Container(
                        width: widget.width,
                        height: widget.height,
                        color: widget.hoverColor,
                        child: _buildCardInfo(),
                      ),
                    )
                  : Empty(),
            ],
          ),
        ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });

    if (_hovering == true) {
      _playPortfolioCoverAnimation();
    } else if (_hovering == false) {
      _portfolioCoverController.reverse();
    }
  }

  Widget _buildCardInfo() {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Spacer(flex: 1),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: widget.titleTextStyle ??
              theme.textTheme.headlineMedium?.copyWith(
                color: AppColors.black,
              ),
        ),
        SpaceH4(),
        Text(
          widget.subtitle,
          textAlign: TextAlign.center,
          style: widget.subtitleTextStyle ??
              theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.black,
                fontSize: Sizes.TEXT_SIZE_16,
              ),
        ),
        Spacer(flex: 1),
      ],
    );
  }
}
