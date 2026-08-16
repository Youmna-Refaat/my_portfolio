import 'package:flutter/material.dart';
import 'package:my_portfolio/core/extenstions/extension.dart';
import '../core/colors.dart';
import '../core/images.dart';
import '../core/text_styles.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 0.05.height),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Skills',
                textAlign: TextAlign.center,
                style: AppTextStyles.styleRegular35(context),
              ),

              20.setVerticalSpace(),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _buildMobileCategories(),
                      )
                    : _buildDesktopCategories(),
              ),
            ],
          ).setSymmetricPadding(
            context,
            horizontal: isMobile ? 0.04.width : 0.06.width,
            vertical: 0,
          );
        },
      ),
    );
  }

  List<Widget> _buildMobileCategories() {
    return _skillCategories
        .map(
          (category) => Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: _SkillCategoryItem(category: category),
          ),
        )
        .toList();
  }

  Widget _buildDesktopCategories() {
    return Table(
      columnWidths: const {0: FlexColumnWidth(), 1: FlexColumnWidth()},
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        TableRow(
          children: [
            _SkillCategoryItem(category: _skillCategories[0]),
            _SkillCategoryItem(category: _skillCategories[1]),
          ],
        ),
        const TableRow(children: [SizedBox(height: 28), SizedBox(height: 28)]),
        TableRow(
          children: [
            _SkillCategoryItem(category: _skillCategories[2]),
            _SkillCategoryItem(category: _skillCategories[3]),
          ],
        ),
        const TableRow(children: [SizedBox(height: 28), SizedBox(height: 28)]),
        TableRow(
          children: [
            _SkillCategoryItem(category: _skillCategories[4]),
            _SkillCategoryItem(category: _skillCategories[5]),
          ],
        ),
      ],
    );
  }
}

class _SkillCategory {
  final String title;
  final String image;
  final List<String> skills;

  const _SkillCategory(this.title, this.image, this.skills);
}

const List<_SkillCategory> _skillCategories = [
  _SkillCategory('Flutter & Dart', AppImages.imagesHat, [
    'Dart',
    'Flutter',
    'Responsive UI',
  ]),
  _SkillCategory('State Management', AppImages.imagesHat, ['Provider', 'Bloc']),
  _SkillCategory('Backend & APIs', AppImages.imagesHat, [
    'Firebase Authentication',
    'Cloud Firestore',
    'Firebase Cloud Messaging',
    'RESTful APIs',
    'Google Maps Services',
  ]),
  _SkillCategory('Architecture & Design', AppImages.imagesHat, [
    'Clean Architecture',
    'SOLID Principles',
    'MVC',
    'MVVM',
    'Repository Pattern',
    'Factory Pattern',
    'Singleton Pattern',
  ]),
  _SkillCategory('Payments & Testing', AppImages.imagesHat, [
    'Stripe',
    'PayPal',
    'Paymob',
    'Unit Testing',
    'Widget Testing',
    'Integration Testing',
  ]),
  _SkillCategory('Tools & Collaboration', AppImages.imagesHat, [
    'Git',
    'Figma',
    'Communication',
    'Teamwork',
    'Adaptability',
    'Time Management',
  ]),
];

class _SkillCategoryItem extends StatelessWidget {
  final _SkillCategory category;

  const _SkillCategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              category.image,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
            ),
            10.setHorizontalSpace(),
            Expanded(
              child: Text(
                category.title,
                style: AppTextStyles.styleRegular18(context),
              ),
            ),
          ],
        ),

        10.setVerticalSpace(),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: category.skills
              .map((skill) => _SkillChip(label: skill))
              .toList(),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: AppTextStyles.styleRegular12(context).copyWith(fontSize: 11),
      ),
    );
  }
}
