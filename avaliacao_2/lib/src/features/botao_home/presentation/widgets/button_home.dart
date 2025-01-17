import 'package:avaliacao_2/src/features/navigator/presentation/widgets/navigator.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:avaliacao_2/src/features/diario/presentation/pages/diario.dart';

class ButtonHome extends StatelessWidget {
  const ButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => nav(context, Diario()),
      icon: const Icon(Icons.home, color: Cores.branco, size: 40),
    );
  }
}
