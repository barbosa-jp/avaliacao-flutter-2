import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';

class BotaoAudio extends StatelessWidget {
  const BotaoAudio({super.key, required this.onTap, required this.icone});

  final Function() onTap;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: SizedBox(
        width: 135,
        height: 45,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: Cores.roxo5),
          onPressed: onTap,
          child: Icon(icone),
        ),
      ),
    );
  }
}
