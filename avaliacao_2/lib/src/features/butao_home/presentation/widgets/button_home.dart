import 'package:flutter/material.dart';
import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:avaliacao_1/src/features/diario/presentation/pages/diario.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const Diario();
            }
          )
        );
      },
      icon: const Icon(Icons.home, color: Cores.branco, size: 40),
    );
  }
}
