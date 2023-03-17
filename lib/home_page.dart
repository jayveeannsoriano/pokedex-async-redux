import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: This will be placed in a constant file later
        title: const Text('Home Page'),
      ),
      body: const Center(
        //TODO: This will be placed in a constant file later
        child: Text('It is working!'),
      ),
    );
  }
}
