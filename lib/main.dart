import 'package:flutter/material.dart';
import 'portfolio_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Youmna Refaat Portfolio',
      navigatorKey: navigatorKey,
      home: const PortfolioHomePage(),
    );
  }
}
