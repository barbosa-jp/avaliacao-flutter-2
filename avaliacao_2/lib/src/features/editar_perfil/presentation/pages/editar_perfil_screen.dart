import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditarPerfil extends StatelessWidget {
  const EditarPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Text(
          'Vem aí!',
          style: GoogleFonts.lato(
            color: Cores.branco,
            fontWeight: FontWeight.bold,
            fontSize: 40
          ),
        ),
        Text(
          'Atualização em Breve',
          style: GoogleFonts.lato(
            color: Cores.branco,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
        )
      ])
    ;
  }
}
