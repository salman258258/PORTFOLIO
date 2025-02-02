import 'package:flutter/material.dart';

class BlogWeb extends StatefulWidget {
  const BlogWeb({super.key});

  @override
  State<BlogWeb> createState() => _BlogWebState();
}

class _BlogWebState extends State<BlogWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Blog Web"),
      ),
    );
  }
}