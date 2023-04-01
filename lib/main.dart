import 'package:flutter/material.dart';
import 'pages/info.dart';
import 'pages/gallery.dart';
import 'pages/content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Típulas',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: false,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/gallery/tip_1.jpg'), context);
    precacheImage(const AssetImage('assets/images/logo.jpeg'), context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) {
  return Image.asset('assets/images/gallery/tip_1.jpg');
}

Widget buildMenuItems(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(6),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Inicio'),
          onTap: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.bug_report),
          title: const Text('Típulas'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Content(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_library),
          title: const Text('Galería'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Gallery(),
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('Información'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Info(),
              ),
            );
          },
        ),
      ],
    ),
  );
}
