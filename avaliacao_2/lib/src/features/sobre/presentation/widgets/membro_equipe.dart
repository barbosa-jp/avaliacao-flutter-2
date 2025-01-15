import 'package:avaliacao_2/src/features/cores/core/cores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MembroEquipe extends StatelessWidget {
  const MembroEquipe({super.key, required this.descricao, required this.imagem});

  final String descricao;
  final String imagem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
         SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundImage: AssetImage(imagem)
          )
        ),
        const SizedBox(height: 20,),
        SizedBox(
          width: 350,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Cores.roxo2,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  descricao,
                  style: GoogleFonts.lato(
                    color: Cores.branco,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                )
              ),
            )
          )
        ),
      ]
    );
  }
}
