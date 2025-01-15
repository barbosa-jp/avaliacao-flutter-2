import 'package:avaliacao_1/src/features/cores/core/cores.dart';
import 'package:avaliacao_1/src/features/sobre/presentation/widgets/membro_equipe.dart';
import 'package:avaliacao_1/src/features/sobre/data/membros_equipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SobreEquipe extends StatelessWidget {
  const SobreEquipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, 
      children: [
        Text(
          'Equipe',
          style: GoogleFonts.lato(
            color: Cores.branco,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        ...membrosEquipe.map((membro) {
          return MembroEquipe(
            imagem: membro[0],
            descricao: membro[1],
          );
        })
      ]
    );
  }
}
