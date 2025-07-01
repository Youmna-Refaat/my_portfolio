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
      title: 'Evently App',
      description:
          'Flutter app with CRUD for events, calendar integration, and real-time sync. Secured by Firebase Authentication and Firestore backend.',
      githubUrl: 'https://github.com/Youmna-Refaat/EventlyAPP',
      image: AppImages.imagesEvently,
    ),
    Project(
      title: 'Islami App',
      description:
          'Feature-rich Flutter app with Quran, prayer times, and more. Uses local storage and custom widgets for a smooth, spiritual experience.',
      githubUrl: 'https://github.com/Youmna-Refaat/IslamiAPP',
      image: AppImages.imagesIslami,
    ),
    Project(
      title: 'News App',
      description:
          'A Flutter news app fetching live content via RESTful APIs. Delivers a dynamic and responsive UI for a smooth reading experience.',
      githubUrl: 'https://github.com/Youmna-Refaat/NewsAPP',
      image: AppImages.imagesNews,
    ),
    Project(
      title: 'Notes App',
      description:
          'A clean Flutter app with local SQLite database for offline notes. Supports smooth CRUD operations with a user-friendly UI.',
      githubUrl: 'https://github.com/Youmna-Refaat/NotesAPP',
      image: AppImages.imagesNotes,
    ),
    Project(
      title: 'BeSafe App',
      description:
          'Real-time safety app with alerts, location tracking, and emergency push notifications. Uses Firebase, Google Maps API, and a Flask backend.',
      githubUrl: 'https://github.com/Youmna-Refaat/GraduationProjectAPP',
      image: AppImages.imagesBeSafe,
    ),
    Project(
      title: 'ScholarChat App',
      description:
          'Built with Flutter and Firebase, this app enables real-time messaging. Features include Firebase Auth and Firestore integration.',
      githubUrl: 'https://github.com/Youmna-Refaat/ScholarChatAPP',
      image: AppImages.imagesScholar,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth < 600 ? 1 : 3;
    final horizontalPadding = 32 * 2;
    final crossAxisSpacing = 16.0;
    final mainAxisSpacing = 16.0;

    final availableWidth =
        screenWidth -
        horizontalPadding -
        (crossAxisSpacing * (crossAxisCount - 1));
    final itemWidth = availableWidth / crossAxisCount;
    final itemHeight = 350.0;

    final totalRows = (projects.length / crossAxisCount).ceil();
    final totalHeight =
        (itemHeight * totalRows) + ((totalRows - 1) * mainAxisSpacing);
    final isMobile = screenWidth < 600;
    return Container(
      padding: const EdgeInsets.all(32),
      color: AppColors.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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

          SizedBox(
            height: totalHeight,
            width: double.infinity,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisSpacing: mainAxisSpacing,
                childAspectRatio: itemWidth / itemHeight,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ProjectCard(project: projects[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
