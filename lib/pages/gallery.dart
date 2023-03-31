import 'package:flutter/material.dart';
import '../main.dart' as main_app;

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const main_app.NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Galería'),
      ),
    );
  }
}
