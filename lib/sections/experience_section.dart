import 'package:flutter/material.dart';
import 'package:my_portfolio/core/extenstions/extension.dart';
import '../../core/colors.dart';
import '../../core/images.dart';
import '../../core/text_styles.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0.03.width),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Experience', style: AppTextStyles.styleRegular35(context)),
              20.setVerticalSpace(),
              _buildExperienceLayout(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildExperienceLayout(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return isMobile
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppImages.imagesSCALogo, width: 80, height: 80),
                8.setHorizontalSpace(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Junior Flutter Developer at SCA',
                        style: AppTextStyles.styleRegular20(context),
                      ),
                      4.setVerticalSpace(),
                      Text(
                        'Mar 2025 - Present',
                        style: AppTextStyles.styleRegular14(
                          context,
                        ).copyWith(color: AppColors.secondryTextColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            16.setVerticalSpace(),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'As a member of the mobile development team at SCA, I contributed to the design, development, and maintenance of cross-platform mobile applications using Flutter and Dart, aimed at improving operational efficiency and user experience. I collaborated with designers and backend developers to implement clean, scalable code and responsive UI components. This role enhanced my problem-solving skills and deepened my understanding of mobile architecture, RESTful API integration, state management, and Agile methodologies.',
                style: AppTextStyles.styleRegular14(context),
              ),
            ).setHorizontalPadding(context, value: 10),
          ],
        )
        : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.imagesDeathlyHollow,
              width: 200,
              fit: BoxFit.contain,
            ),
            16.setHorizontalSpace(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.imagesSCALogo,
                        width: 100,
                        height: 60,
                      ),
                      12.setHorizontalSpace(),
                      Expanded(
                        child: Text(
                          'Junior Flutter Developer at SCA',
                          style: AppTextStyles.styleRegular20(context),
                        ),
                      ),
                      Text(
                        'Mar 2025 - Present',
                        style: AppTextStyles.styleRegular14(
                          context,
                        ).copyWith(color: AppColors.secondryTextColor),
                      ),
                    ],
                  ),
                  16.setVerticalSpace(),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'As a member of the mobile development team at SCA, I contributed to the design, development, and maintenance of cross-platform mobile applications using Flutter and Dart, aimed at improving operational efficiency and user experience. I collaborated with designers and backend developers to implement clean, scalable code and responsive UI components. This role enhanced my problem-solving skills and deepened my understanding of mobile architecture, RESTful API integration, state management, and Agile methodologies.',
                      style: AppTextStyles.styleRegular14(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}
