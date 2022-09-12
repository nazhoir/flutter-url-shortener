import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortener/state/url.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UrlShortenerState>(context, listen: true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const Text(
              "URL Shortener",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: state.urlController,
            ),
            ElevatedButton(
              onPressed: () {
                state.handleGetLinkButton();
              },
              child: const Text("Shortlink"),
            ),
            const SizedBox(
              height: 20,
            ),
            state.short
          ],
        ),
      ),
    );
  }
}
