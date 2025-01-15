import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';

class MenuOpcao extends StatelessWidget {
  const MenuOpcao({super.key, required this.icone, required this.texto});

  final IconData icone;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Icon(
          icone,
          color: Cores.branco,
          size: 30,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          texto,
          style: const TextStyle(
            color: Cores.branco,
            fontSize: 20
          ),
        ),
      ],
    );
  }
}
