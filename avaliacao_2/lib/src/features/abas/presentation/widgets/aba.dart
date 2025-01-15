import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';

class Aba extends StatelessWidget {
  const Aba({super.key, required this.icone});

  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [          
          Icon(
            icone,
            color: Cores.branco,
          )
        ] 
      )
    );
  }
}
