import 'package:flutter/material.dart';
import 'package:my_portfolio/core/extenstions/extension.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'core/colors.dart';
import 'core/images.dart';
import 'core/text_styles.dart';
import 'sections/contact_section.dart';

import 'sections/experience_section.dart';
import 'sections/home_section.dart';
import 'sections/projects_section.dart';

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ItemScrollController _scrollController = ItemScrollController();

  void scrollTo(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 80,
              padding: EdgeInsets.only(
                left: 0.08.width,
                right: 2,
                top: 5,
                bottom: 5,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.navBarPrimaryColor,
                    AppColors.navBarSecondryColor,
                  ],
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Image.asset(
                        AppImages.imagesYR,
                        width: isMobile ? 0.14.width : 0.1.width,
                        height: 100,
                      ),
                      Flexible(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                spacing: isMobile ? 0 : 0.02.width,
                                runSpacing: 4,
                                children: [
                                  TextButton(
                                    onPressed: () => scrollTo(0),
                                    child: Text(
                                      'About Me',
                                      style: AppTextStyles.styleRegular20(
                                        context,
                                      ).copyWith(fontSize: isMobile ? 12 : 20),
                                    ),
                                  ),
                                  if (!isMobile)
                                    0.02.width.setHorizontalSpace(),
                                  TextButton(
                                    onPressed: () => scrollTo(1),
                                    child: Text(
                                      'Projects',
                                      style: AppTextStyles.styleRegular20(
                                        context,
                                      ).copyWith(fontSize: isMobile ? 12 : 20),
                                    ),
                                  ),
                                  if (!isMobile)
                                    0.03.width.setHorizontalSpace(),
                                  TextButton(
                                    onPressed: () => scrollTo(2),
                                    child: Text(
                                      'Experience',
                                      style: AppTextStyles.styleRegular20(
                                        context,
                                      ).copyWith(fontSize: isMobile ? 12 : 20),
                                    ),
                                  ),
                                  if (!isMobile)
                                    0.02.width.setHorizontalSpace(),
                                  TextButton(
                                    onPressed: () => scrollTo(3),
                                    child: Text(
                                      'Contact',
                                      style: AppTextStyles.styleRegular20(
                                        context,
                                      ).copyWith(fontSize: isMobile ? 12 : 20),
                                    ),
                                  ),
                                  if (!isMobile)
                                    0.02.width.setHorizontalSpace(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: ScrollablePositionedList.builder(
                itemScrollController: _scrollController,
                itemCount: 4,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const HomeSection();
                    case 1:
                      return const ProjectsSection();
                    case 2:
                      return const ExperienceSection();
                    case 3:
                      return const ContactSection();
                    default:
                      return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
