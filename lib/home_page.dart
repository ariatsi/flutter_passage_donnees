// home_page.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Page d\'accueil',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
