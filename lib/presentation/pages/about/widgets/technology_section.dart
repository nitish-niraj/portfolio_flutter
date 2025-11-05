import 'package:nitish_kumar_portfolio/presentation/widgets/animated_positioned_text.dart';
import 'package:nitish_kumar_portfolio/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:nitish_kumar_portfolio/presentation/widgets/spaces.dart';
import 'package:nitish_kumar_portfolio/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double spacing = 20;
const double columnWidth = 280.0;

class TechnologySection extends StatefulWidget {
  const TechnologySection({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);

  final AnimationController controller;
  final double width;

  @override
  State<TechnologySection> createState() => _TechnologySectionState();
}

class _TechnologySectionState extends State<TechnologySection> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.titleMedium?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    );
    TextStyle? bodyText1Style = textTheme.bodyMedium?.copyWith(
      fontSize: Sizes.TEXT_SIZE_15,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: widget.width,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;

          if (screenWidth < RefinedBreakpoints().tabletNormal) {
            // Mobile: Vertical scrollable layout
            return _buildMobileLayout(context, titleStyle, bodyText1Style);
          } else {
            // Desktop: Horizontal scrollable 7-column layout
            return _buildDesktopLayout(context, titleStyle, bodyText1Style);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    TextStyle? titleStyle,
    TextStyle? bodyStyle,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var category in Data.skillCategories)
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: _buildSkillCategory(
                context,
                category.title,
                category.skills,
                titleStyle,
                bodyStyle,
                widget.width,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    TextStyle? titleStyle,
    TextStyle? bodyStyle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Scrollable skills
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var category in Data.skillCategories)
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: _buildSkillCategory(
                    context,
                    category.title,
                    category.skills,
                    titleStyle,
                    bodyStyle,
                    columnWidth,
                  ),
                ),
            ],
          ),
        ),
        // Scroll hint at bottom center
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Left arrow button
                IconButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.offset - 320,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: AppColors.grey600,
                  ),
                  tooltip: 'Scroll left',
                ),
                SizedBox(width: 8),
                Text(
                  'Scroll to see more skills',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.grey600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(width: 8),
                // Right arrow button
                IconButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.offset + 320,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: AppColors.grey600,
                  ),
                  tooltip: 'Scroll right',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<String> skills,
    TextStyle? titleStyle,
    TextStyle? bodyStyle,
    double columnWidth,
  ) {
    return SizedBox(
      width: columnWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            width: columnWidth,
            text: title,
            textStyle: titleStyle,
          ),
          SpaceH20(),
          ...skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AnimatedPositionedText(
                controller: CurvedAnimation(
                  parent: widget.controller,
                  curve: Interval(
                    0.6,
                    1.0,
                    curve: Curves.ease,
                  ),
                ),
                text: skill,
                textStyle: bodyStyle,
                maxLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
