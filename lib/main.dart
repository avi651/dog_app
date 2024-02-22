import 'package:flutter/material.dart';
import 'injector_container.dart';

void main() {
  dependencyInjection();  
  runApp(const DogApp());
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog App',
      debugShowCheckedModeBanner: false,
      home: Container(
        color: Colors.blue,
      ),
    );
  }
}
