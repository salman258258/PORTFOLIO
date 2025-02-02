import 'package:flutter/material.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Works Web"),
      ),
    );
  }
}