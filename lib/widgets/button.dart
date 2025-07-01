import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/core/extenstions/extension.dart';
import '../core/colors.dart';
import '../core/text_styles.dart';

class ButtonData {
  final String text;
  final String icon;
  final String url;

  const ButtonData({required this.text, required this.icon, required this.url});
}

class Button extends StatelessWidget {
  final ButtonData buttonData;
  const Button({super.key, required this.buttonData});
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
    return GestureDetector(
      onTap: () => _launchURL(buttonData.url),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Image.asset(buttonData.icon, width: 20)),
            8.setHorizontalSpace(),
            Flexible(
              child: Text(
                buttonData.text,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.styleRegular12(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
