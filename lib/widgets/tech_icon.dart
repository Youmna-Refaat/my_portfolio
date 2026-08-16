import 'package:flutter/material.dart';
import '../core/colors.dart';

class TechIcon extends StatelessWidget {
  final String assetPath;
  final IconData fallbackIcon;
  final double radius;
  final String? semanticLabel;

  const TechIcon({
    super.key,
    required this.assetPath,
    required this.fallbackIcon,
    this.radius = 35,
    this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.white,
      child: ClipOval(
        child: Image.asset(
          assetPath,
          width: radius * 1.4,
          height: radius * 1.4,
          fit: BoxFit.contain,
          alignment: Alignment.center,
          semanticLabel: semanticLabel,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              fallbackIcon,
              size: radius,
              color: AppColors.primaryColor,
            );
          },
        ),
      ),
    );
  }
}
