import 'package:flutter/material.dart';
import 'package:avaliacao_1/src/features/cores/core/cores.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) { 
          return IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: const Icon(
              Icons.menu,
              color: Cores.branco,
              size: 40,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }
      );
  }
}