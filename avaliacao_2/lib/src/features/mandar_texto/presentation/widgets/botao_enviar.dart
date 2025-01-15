import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoEnviar extends StatelessWidget {
  const BotaoEnviar({super.key, required this.onTap});

  final Function() onTap;

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
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            backgroundColor: Cores.roxo5
          ),
          onPressed: onTap,
          child: Text(
            'Enviar',
            style: GoogleFonts.lato(
              color: Cores.branco,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
