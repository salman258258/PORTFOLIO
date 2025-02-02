import 'package:flutter/material.dart';

class BlogMobile extends StatefulWidget {
  const BlogMobile({super.key});

  @override
  State<BlogMobile> createState() => _BlogMobileState();
}

class _BlogMobileState extends State<BlogMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Blog Mobile"),
      ),
    );
  }
}