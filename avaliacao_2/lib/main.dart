import 'package:avaliacao_2/src/features/login/presentation/pages/login.dart';
import 'package:flutter/material.dart';
// import 'package:avaliacao_2/src/features/diario/presentation/pages/diario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: TelaLogin(),
    );
  }
}
