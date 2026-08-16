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
  final List<String> technologies;
  final bool isProfessional;
  final List<String> highlights;
  final String? year;

  final String? githubUrl;
  final String? storeUrl;
  final String? appStoreUrl;
  final String? websiteUrl;
  final String? demoUrl;

  const Project({
    required this.title,
    required this.description,
    required this.image,
    this.technologies = const [],
    this.isProfessional = false,
    this.highlights = const [],
    this.year,
    this.githubUrl,
    this.storeUrl,
    this.appStoreUrl,
    this.websiteUrl,
    this.demoUrl,
  });

  bool get hasGithubLink => githubUrl != null && githubUrl!.isNotEmpty;

  /// First available non-GitHub public link.
  String? get primaryExternalUrl {
    for (final url in [websiteUrl, demoUrl, storeUrl, appStoreUrl]) {
      if (url != null && url.isNotEmpty) {
        return url;
      }
    }

    return null;
  }

  bool get hasExternalLink => primaryExternalUrl != null;
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 480;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIcon(size: 64),
                    12.setVerticalSpace(),
                    _buildContent(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIcon(size: 96),
                    16.setHorizontalSpace(),
                    Expanded(child: _buildContent(context)),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildIcon({required double size}) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.16),

      child: Image.asset(
        project.image,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.apps_outlined,
            color: AppColors.titleTextColor,
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                project.title,
                style: AppTextStyles.styleRegular20(context),
              ),
            ),

            if (project.year != null) ...[
              _buildYearBadge(context),
              8.setHorizontalSpace(),
            ],

            _buildLinkActions(),
          ],
        ),

        8.setVerticalSpace(),

        Text(project.description, style: AppTextStyles.styleRegular12(context)),

        if (project.highlights.isNotEmpty) ...[
          10.setVerticalSpace(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: project.highlights
                .map((highlight) => _buildHighlightRow(context, highlight))
                .toList(),
          ),
        ],

        if (project.technologies.isNotEmpty) ...[
          10.setVerticalSpace(),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.technologies
                .map((technology) => _buildTag(context, technology))
                .toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildYearBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        project.year!,

        style: AppTextStyles.styleRegular14(
          context,
        ).copyWith(color: AppColors.secondryTextColor),
      ),
    );
  }

  Widget _buildHighlightRow(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '•',
            style: AppTextStyles.styleRegular12(context).copyWith(
              color: AppColors.titleTextColor,
              fontSize: 16,
              height: 1.1,
            ),
          ),
          8.setHorizontalSpace(),
          Expanded(
            child: Text(text, style: AppTextStyles.styleRegular12(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(BuildContext context, String label, {Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color ?? AppColors.backgroundColor),
      ),
      child: Text(
        label,
        style: AppTextStyles.styleRegular12(
          context,
        ).copyWith(color: color ?? AppColors.titleTextColor, fontSize: 11),
      ),
    );
  }

  Widget _buildLinkActions() {
    final icons = <Widget>[];

    // GitHub
    if (project.hasGithubLink) {
      icons.add(
        GestureDetector(
          onTap: () => _launchURL(project.githubUrl!),
          child: Image.asset(
            AppImages.iconsGithub,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.code,
                size: 24,
                color: AppColors.titleTextColor,
              );
            },
          ),
        ),
      );
    }

    // External link
    if (project.hasExternalLink) {
      if (icons.isNotEmpty) {
        icons.add(8.setHorizontalSpace());
      }

      icons.add(
        GestureDetector(
          onTap: () => _launchURL(project.primaryExternalUrl!),
          child: Image.asset(
            AppImages.iconsAttach,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.open_in_new,
                size: 24,
                color: AppColors.titleTextColor,
              );
            },
          ),
        ),
      );
    }

    if (icons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(mainAxisSize: MainAxisSize.min, children: icons);
  }
}
