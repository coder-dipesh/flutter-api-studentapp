import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app/theme.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          WebView(
            initialUrl: 'https://softwarica.edu.np/',
            javascriptMode: JavascriptMode.unrestricted,
            onProgress: (int progress) {
              if (progress == 100) {
                setState(() {
                  isLoaded = true;
                });
              }
            },
          ),
          Visibility(
            visible: !isLoaded,
            child: Center(
              child: CircularProgressIndicator(
                color: HexColor.fromHex("#ED9728"),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
