import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/core/extenstions/extension.dart';
import '../core/colors.dart';
import '../core/images.dart';
import '../core/text_styles.dart';

class Project {
  final String title;
  final String description;
  final String image;
  final String githubUrl;

  const Project({
    required this.title,
    required this.description,
    required this.image,
    required this.githubUrl,
  });
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondryTextColor.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Image.asset(
              project.image,
              alignment: Alignment.center,
            ).setSymmetricPadding(
              context,
              horizontal: 0.02.width,
              vertical: 0.02.height,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        project.title,
                        style: AppTextStyles.styleBold16(
                          context,
                        ).copyWith(color: AppColors.primaryColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Row(
                      children: [
                        Image.asset(AppImages.iconsGithub, width: 30),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => _launchURL(project.githubUrl),
                          child: Image.asset(AppImages.iconsAttach, width: 30),
                        ),
                      ],
                    ),
                  ],
                ).setOnlyPadding(
                  context,
                  left: 0.01.width,
                  right: 0.01.width,
                  bottom: 0.02.height,
                ),

                Text(
                  project.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.styleRegular12(context),
                ).setHorizontalPadding(context, value: 0.01.width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
