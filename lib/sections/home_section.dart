import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/core/extenstions/extension.dart';
import '../../core/colors.dart';
import '../core/images.dart';
import '../core/text_styles.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.02.width,
            vertical: 0.05.height,
          ),
          color: AppColors.backgroundColor,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isMobile
                    ? Column(children: _buildHeaderContent(context, isMobile))
                    : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildHeaderContent(context, isMobile),
                    ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isNarrow = constraints.maxWidth < 600;
                    return isNarrow
                        ? Column(children: _buildExperienceContent(isMobile))
                        : Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _buildExperienceContent(isMobile),
                        );
                  },
                ),

                0.04.height.setVerticalSpace(),
              ],
            ),
          ),
        );
      },
    );
  }
}

List<Widget> _buildHeaderContent(BuildContext context, bool isMobile) {
  final content = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        children: [
          Text("Hello, I'm ", style: AppTextStyles.styleRegular38(context)),
          Text(
            "Youmna Refaat",
            style: AppTextStyles.styleRegular38(
              context,
            ).copyWith(fontFamily: 'Henny_Penny'),
          ),
          Image.asset(
            AppImages.imagesHat,
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          ).setOnlyPadding(context, bottom: 0.07.height),
        ],
      ).setSymmetricPadding(
        context,
        horizontal: 0.02.width,
        vertical: 0.01.height,
      ),
      Text(
        "a Junior Flutter Developer with a strong foundation in mobile application development. I specialize in building cross-platform apps using Flutter and Dart, with a focus on creating dynamic, responsive, and user-friendly experiences. I'm passionate about learning new technologies, solving problems, writing clean, maintainable code and being part of collaborative teams where I can both contribute and grow. I’m always excited to bring ideas to life through code.",
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.styleRegular16(context),
      ).setOnlyPadding(context, left: 0.05.width, right: 0.1.width),
      20.setVerticalSpace(),
      ElevatedButton(
        onPressed:
            () => _launchURL(
              'https://drive.google.com/file/d/1z8jMXrwYucI7GvnIE7pEys8HWWgOuVVR/view?usp=sharing',
            ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondryTextColor.withAlpha(40),
        ),
        child: const Text(
          'Download CV',
          style: TextStyle(color: AppColors.secondryTextColor),
        ),
      ).setOnlyPadding(
        context,
        right: 0.05.width,
        left: 0.05.width,
        bottom: 0.05.height,
      ),
    ],
  );

  return [
    CircleAvatar(
      radius: isMobile ? 100 : 120,
      backgroundImage: AssetImage(AppImages.imagesMe),
    ),

    SizedBox(width: isMobile ? 0 : 20),
    if (isMobile) content else Expanded(child: content),
  ];
}

List<Widget> _buildExperienceContent(bool isMobile) {
  return [
    isMobile
        ? SizedBox(
          child: Column(
            children: [
              Text(
                "Experience with",
                textAlign: TextAlign.center,
                style: AppTextStyles.styleRegular35(null),
              ),
              20.setVerticalSpace(),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: _buildSkillIcons(),
              ),
            ],
          ),
        )
        : Row(
          children: [
            SizedBox(
              width: 0.2.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.imagesScar, fit: BoxFit.contain),
                  Image.asset(
                    AppImages.imagesGlasses,
                    height: 0.2.height,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            SizedBox(
              width: 0.5.width,
              child: Column(
                children: [
                  Text(
                    "Experience with",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.styleRegular35(null),
                  ),
                  20.setVerticalSpace(),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: _buildSkillIcons(),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            SizedBox(
              width: isMobile ? 0 : 0.2.width,
              child: Image.asset(
                AppImages.imagesFootPrints,
                height: isMobile ? 0 : 0.35.height,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
  ];
}

List<Widget> _buildSkillIcons() {
  const icons = [
    AppImages.imagesCpp,
    AppImages.imagesDart,
    AppImages.imagesFlutter,
    AppImages.imagesFigma,
    AppImages.imagesFirebase,
    AppImages.imagesGit,
  ];

  return icons
      .map(
        (img) => CircleAvatar(
          radius: 35,
          backgroundColor: AppColors.white,
          child: Image.asset(img, width: 50, alignment: Alignment.center),
        ),
      )
      .toList();
}

Future<void> _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
