import 'package:flutter/material.dart';
import '../main.dart' as main_app;

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const main_app.NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Típulas'),
      ),
    );
  }
}
