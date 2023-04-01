import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart' as main_app;

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
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
        const InfoDeveloper(),
        const Divider(),
        const ContactInfo(),
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

class InfoDeveloper extends StatefulWidget {
  const InfoDeveloper({super.key});

  @override
  State<InfoDeveloper> createState() => _InfoDeveloperState();
}

class _InfoDeveloperState extends State<InfoDeveloper> {
  Future<void>? launched;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('No se puede abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri(scheme: 'https', host: 'addielmoldes.github.io');
    return Center(
      child: Column(
        children: <Widget>[
          const Text(
            'Desarrollado por:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text('Ing. Ciencias Informáticas Addiel Moldes'),
          TextButton.icon(
            onPressed: () => setState(() {
              launched = _launchInBrowser(toLaunch);
            }),
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
}

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  Future<void>? launched;

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('No se puede abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri toTelegram =
        Uri(scheme: 'https', host: 't.me', path: 'addielmoldes');
    final Uri toMail = Uri(scheme: 'mailto', path: 'addielpunk99@gmail.com');
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
                onPressed: () => setState(() {
                  launched = launchInBrowser(toMail);
                }),
                child: const Icon(Icons.mail),
              ),
              TextButton(
                onPressed: () => setState(() {
                  launched = launchInBrowser(toTelegram);
                }),
                child: const Icon(Icons.telegram),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
