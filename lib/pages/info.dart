import 'package:flutter/material.dart';
import '../main.dart' as main_app;

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const main_app.NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Información'),
      ),
      body: SingleChildScrollView(
        child: infoText(context),
      ),
    );
  }
}

Widget infoText(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(16),
    child: Wrap(
      runSpacing: 10,
      children: <Widget>[
        _logoAndVersion(),
        const Divider(),
        _textInfo(),
        const Divider(),
        _infoDeveloper(),
        const Divider(),
        _contactInfo(),
      ],
    ),
  );
}

Widget _logoAndVersion() {
  return Wrap(
    runSpacing: 10,
    children: <Widget>[
      const Center(
        child: CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/images/logo.jpeg'),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: Column(
          children: const <Widget>[
            Text(
              'Tipulas',
              textAlign: TextAlign.center,
              textScaleFactor: 1.2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('v1.0.0'),
          ],
        ),
      ),
    ],
  );
}

Widget _textInfo() {
  return const Center(
    child: Text(
      'Esta aplicación ha sido desarrollada para proporcionar información sobre la familia de insectos del género Típula, con el objetivo de proteger a la especie.',
      textAlign: TextAlign.center,
    ),
  );
}

Widget _infoDeveloper() {
  return Center(
    child: Column(
      children: <Widget>[
        const Text(
          'Desarrollado por:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text('Ing. Ciencias Informáticas Addiel Moldes'),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.open_in_new,
            size: 16,
          ),
          label: const Text('Sitio Web'),
        ),
      ],
    ),
  );
}

Widget _contactInfo() {
  return Center(
    child: Column(
      children: <Widget>[
        const Text(
          'Contacto:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.mail),
            ),
            TextButton(
              onPressed: () {},
              child: const Icon(Icons.telegram),
            ),
          ],
        ),
      ],
    ),
  );
}
