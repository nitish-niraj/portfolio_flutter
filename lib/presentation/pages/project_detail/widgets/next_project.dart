import 'package:nitish_kumar_portfolio/core/layout/adaptive.dart';
import 'package:nitish_kumar_portfolio/presentation/widgets/animated_bubble_button.dart';
import 'package:nitish_kumar_portfolio/presentation/widgets/project_item.dart';
import 'package:nitish_kumar_portfolio/presentation/widgets/spaces.dart';
import 'package:nitish_kumar_portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';


class NextProject extends StatefulWidget {
  const NextProject({
    Key? key,
    required this.width,
    required this.nextProject,
    this.navigateToNextProject,
    this.previousProject,
    this.navigateToPreviousProject,
    this.hasPreviousProject = false,
  }) : super(key: key);

  final ProjectItemData nextProject;
  final ProjectItemData? previousProject;
  final double width;
  final VoidCallback? navigateToNextProject;
  final VoidCallback? navigateToPreviousProject;
  final bool hasPreviousProject;

  @override
  _NextProjectState createState() => _NextProjectState();
}

class _NextProjectState extends State<NextProject>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Animations.switcherDuration,
    );
    scaleAnimation = Tween(begin: 0.90, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _isHovering = hovering;
        controller.forward();
      });
    } else {
      setState(() {
        _isHovering = hovering;
        controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final EdgeInsetsGeometry marginLeft = EdgeInsets.only(left: 16);
    double projectTitleFontSize =
        responsiveSize(context, 28, 48, md: 40, sm: 36);
    BorderRadiusGeometry borderRadius = BorderRadius.all(
      Radius.circular(100.0),
    );
    TextStyle? buttonStyle = textTheme.bodyMedium?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_14,
        Sizes.TEXT_SIZE_16,
        sm: Sizes.TEXT_SIZE_15,
      ),
      fontWeight: FontWeight.w500,
    );
    TextStyle? projectTitleStyle = textTheme.titleMedium?.copyWith(
      color: AppColors.black,
      fontSize: projectTitleFontSize,
      fontWeight: FontWeight.w700,
    );
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;

        if (screenWidth <= RefinedBreakpoints().tabletSmall) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.hasPreviousProject)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConst.PREVIOUS_PROJECT,
                        style: textTheme.bodyMedium?.copyWith(
                          fontSize: responsiveSize(context, 11, Sizes.TEXT_SIZE_12),
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SpaceH20(),
                      Text(
                        widget.previousProject?.title ?? '',
                        textAlign: TextAlign.center,
                        style: projectTitleStyle,
                      ),
                      SpaceH20(),
                      Container(
                        width: widthOfScreen(context),
                        height: assignHeight(context, 0.3),
                        child: Image.asset(
                          widget.previousProject?.coverUrl ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SpaceH30(),
                      AnimatedBubbleButton(
                        title: StringConst.VIEW_PROJECT,
                        color: AppColors.grey100,
                        imageColor: AppColors.black100,
                        startBorderRadius: borderRadius,
                        titleStyle: buttonStyle,
                        startOffset: Offset(0, 0),
                        targetOffset: Offset(-0.1, 0),
                        onTap: () {
                          if (widget.navigateToPreviousProject != null) {
                            widget.navigateToPreviousProject!();
                          }
                        },
                      ),
                      SpaceH40(),
                    ],
                  ),
                Text(
                  StringConst.NEXT_PROJECT,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: responsiveSize(context, 11, Sizes.TEXT_SIZE_12),
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SpaceH20(),
                Text(
                  widget.nextProject.title,
                  textAlign: TextAlign.center,
                  style: projectTitleStyle,
                ),
                SpaceH20(),
                Container(
                  width: widthOfScreen(context),
                  height: assignHeight(context, 0.3),
                  child: Image.asset(
                    widget.nextProject.coverUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SpaceH30(),
                AnimatedBubbleButton(
                  title: StringConst.VIEW_PROJECT,
                  color: AppColors.grey100,
                  imageColor: AppColors.black100,
                  startBorderRadius: borderRadius,
                  titleStyle: buttonStyle,
                  startOffset: Offset(0, 0),
                  targetOffset: Offset(0.1, 0),
                  onTap: () {
                    if (widget.navigateToNextProject != null) {
                      widget.navigateToNextProject!();
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.hasPreviousProject)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: assignHeight(context, 0.3),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                width: widget.width * 0.55,
                                height: assignHeight(context, 0.3),
                                child: ScaleTransition(
                                  scale: scaleAnimation,
                                  child: Image.asset(
                                    widget.previousProject?.coverUrl ?? '',
                                    fit: BoxFit.cover,
                                    color: _isHovering ? Colors.transparent : Colors.grey,
                                    colorBlendMode: _isHovering
                                        ? BlendMode.color
                                        : BlendMode.saturation,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: widget.width * 0.15),
                            MouseRegion(
                              onEnter: (e) => _mouseEnter(true),
                              onExit: (e) => _mouseEnter(false),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: marginLeft,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          StringConst.PREVIOUS_PROJECT,
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontSize: responsiveSize(
                                              context,
                                              11,
                                              Sizes.TEXT_SIZE_12,
                                            ),
                                            letterSpacing: 2,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SpaceH20(),
                                        isDisplayMobileOrTablet(context)
                                            ? Text(
                                                widget.previousProject?.title ?? '',
                                                textAlign: TextAlign.center,
                                                style: projectTitleStyle,
                                              )
                                            : AnimatedSwitcher(
                                                duration: Animations.switcherDuration,
                                                child: _isHovering
                                                    ? Text(
                                                        widget.previousProject?.title ?? '',
                                                        textAlign: TextAlign.center,
                                                        style: projectTitleStyle,
                                                      )
                                                    : Stack(
                                                        children: [
                                                          Text(
                                                            widget.previousProject?.title ?? '',
                                                            textAlign: TextAlign.center,
                                                            style: projectTitleStyle?.copyWith(
                                                              shadows: [
                                                                Shadow(
                                                                  offset: Offset(2, 2),
                                                                  blurRadius: 3,
                                                                  color: Colors.black.withValues(alpha: 0.3),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  SpaceH20(),
                                  AnimatedBubbleButton(
                                    title: StringConst.VIEW_PROJECT,
                                    color: AppColors.grey100,
                                    imageColor: AppColors.black100,
                                    startBorderRadius: borderRadius,
                                    titleStyle: buttonStyle,
                                    startOffset: Offset(0, 0),
                                    targetOffset: Offset(-0.1, 0),
                                    onTap: () {
                                      if (widget.navigateToPreviousProject != null) {
                                        widget.navigateToPreviousProject!();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SpaceH40(),
                    ],
                  ),
                Container(
                  height: assignHeight(context, 0.3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MouseRegion(
                        onEnter: (e) => _mouseEnter(true),
                        onExit: (e) => _mouseEnter(false),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: marginLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    StringConst.NEXT_PROJECT,
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontSize: responsiveSize(
                                        context,
                                        11,
                                        Sizes.TEXT_SIZE_12,
                                      ),
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SpaceH20(),
                                  isDisplayMobileOrTablet(context)
                                      ? Text(
                                          widget.nextProject.title,
                                          textAlign: TextAlign.center,
                                          style: projectTitleStyle,
                                        )
                                      : AnimatedSwitcher(
                                          duration: Animations.switcherDuration,
                                          child: _isHovering
                                              ? Text(
                                                  widget.nextProject.title,
                                                  textAlign: TextAlign.center,
                                                  style: projectTitleStyle,
                                                )
                                              : Stack(
                                                  children: [
                                                    Text(
                                                      widget.nextProject.title,
                                                      textAlign: TextAlign.center,
                                                      style: projectTitleStyle?.copyWith(
                                                        shadows: [
                                                          Shadow(
                                                            offset: Offset(2, 2),
                                                            blurRadius: 3,
                                                            color: Colors.black.withValues(alpha: 0.3),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                        ),
                                ],
                              ),
                            ),
                            SpaceH20(),
                            AnimatedBubbleButton(
                              title: StringConst.VIEW_PROJECT,
                              color: AppColors.grey100,
                              imageColor: AppColors.black100,
                              startBorderRadius: borderRadius,
                              titleStyle: buttonStyle,
                              startOffset: Offset(0, 0),
                              targetOffset: Offset(0.1, 0),
                              onTap: () {
                                if (widget.navigateToNextProject != null) {
                                  widget.navigateToNextProject!();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: widget.width * 0.15),
                      Expanded(
                        child: Container(
                          width: widget.width * 0.55,
                          height: assignHeight(context, 0.3),
                          child: ScaleTransition(
                            scale: scaleAnimation,
                            child: Image.asset(
                              widget.nextProject.coverUrl,
                              fit: BoxFit.cover,
                              color: _isHovering ? Colors.transparent : Colors.grey,
                              colorBlendMode: _isHovering
                                  ? BlendMode.color
                                  : BlendMode.saturation,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

}
