import 'package:flutter/material.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("About Mobile"),
      ),
    );
  }
}