import 'package:flutter/material.dart';
import 'package:my_portfolio/core/extenstions/extension.dart';
import '../../core/colors.dart';
import '../../core/images.dart';
import '../../core/text_styles.dart';
import '../../widgets/projects_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Project> projects = const [
    Project(
      title: 'SCA Chat',
      year: '2026',
      description:
          'Secure, cross-platform private chat application built for iOS, Android, and Web — tailored for Suez Canal Authority employees, with real-time messaging and enterprise-grade privacy.',
      image: AppImages.imagesSCAChat,
      highlights: [
        'Real-time messaging via WebSockets (stomp_dart_client) for instant internal communication.',
        'On-device media compression, voice recording, and rich file sharing (video, audio, PDF).',
        'Local biometric authentication, secure token storage, and active screenshot protection.',
      ],
    ),
    Project(
      title: 'SCA Portal',
      year: '2025',
      description:
          'Internal employee portal built with Flutter and Clean Architecture, giving SCA staff a centralized, user-friendly hub for HR and administrative services.',
      image: AppImages.imagesSCAPortal,
      highlights: [
        'Secure, instant access to payrolls and official documents (PDFs) from anywhere.',
        'Firebase Push Notifications for real-time organizational updates and alerts.',
        'Simplified day-to-day tasks like attendance tracking.',
        'Biometric authentication and local encrypted storage for sensitive personal data.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: const EdgeInsets.all(32),
      color: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          isMobile
              ? Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  alignment: WrapAlignment.end,
                  spacing: 15,
                  children: [
                    Text(
                      'Projects',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.styleRegular35(context),
                    ).setOnlyPadding(context, bottom: 0.1.height),
                    0.01.width.setHorizontalSpace(),
                    Image.asset(AppImages.imagesOwl, height: 0.18.height),
                  ],
                ).setOnlyPadding(context, right: 0.01.width)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Projects',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.styleRegular35(context),
                    ),
                    0.25.width.setHorizontalSpace(),
                    Image.asset(AppImages.imagesOwl, height: 150),
                  ],
                ).setOnlyPadding(context, right: 0.1.width),

          for (final project in projects) ...[
            ProjectCard(project: project),
            20.setVerticalSpace(),
          ],
        ],
      ),
    );
  }
}
