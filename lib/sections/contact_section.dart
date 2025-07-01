import 'package:flutter/material.dart';
import 'package:my_portfolio/core/extenstions/extension.dart';
import '../core/colors.dart';
import '../core/images.dart';
import '../core/text_styles.dart';
import '../widgets/button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      color: AppColors.backgroundColor.withValues(alpha: 0.8),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16.0 : 0.05.width),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          10.setVerticalSpace(),
          Text('Contact', style: AppTextStyles.styleRegular35(context)),
          0.04.height.setVerticalSpace(),
          isMobile
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'I’m always open to discussing new projects, collaborations, or freelance work. If you’re looking for a dedicated Flutter developer or just want to connect, feel free to reach out.',
                    style: AppTextStyles.styleRegular14(context),
                  ).setOnlyPadding(context, left: 0.02.width),
                  30.setVerticalSpace(),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Button(
                        buttonData: ButtonData(
                          icon: AppImages.iconsMail,
                          text: 'Send an email',
                          url: 'mailto:youmnarefaat884@gmail.com',
                        ),
                      ),
                      Button(
                        buttonData: ButtonData(
                          icon: AppImages.iconsLinkedin,
                          text: 'LinkedIn',
                          url: 'https://www.linkedin.com/in/youmna-refaat/',
                        ),
                      ),
                      Button(
                        buttonData: ButtonData(
                          icon: AppImages.iconsGithub,
                          text: 'GitHub',
                          url: 'https://github.com/Youmna-Refaat',
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.imagesFlyingOwl,
                            width: 0.35.width,
                          ),
                        ],
                      ),
                    ],
                  ).setOnlyPadding(context, left: 0.02.width),
                  10.setVerticalSpace(),
                ],
              )
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'I’m always open to discussing new projects, collaborations, or freelance work. If you’re looking for a dedicated Flutter developer or just want to connect, feel free to reach out.',
                          style: AppTextStyles.styleRegular14(context),
                        ).setOnlyPadding(context, left: 0.15.width),
                        50.setVerticalSpace(),
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            Button(
                              buttonData: ButtonData(
                                icon: AppImages.iconsMail,
                                text: 'Send an email',
                                url: 'mailto:youmnarefaat884@gmail.com',
                              ),
                            ),
                            Button(
                              buttonData: ButtonData(
                                icon: AppImages.iconsLinkedin,
                                text: 'LinkedIn',
                                url:
                                    'https://www.linkedin.com/in/youmna-refaat/',
                              ),
                            ),
                            Button(
                              buttonData: ButtonData(
                                icon: AppImages.iconsGithub,
                                text: 'GitHub',
                                url: 'https://github.com/Youmna-Refaat',
                              ),
                            ),
                          ],
                        ).setOnlyPadding(context, left: 0.15.width),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.imagesFlyingOwl, width: 250),
                    ],
                  ),
                ],
              ).setOnlyPadding(context, right: 0.02.width),
        ],
      ),
    );
  }
}
